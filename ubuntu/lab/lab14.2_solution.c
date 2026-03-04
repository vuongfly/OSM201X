#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h> // Thư viện để dùng sleep

int sells = 0;
int products = 0;

sem_t sem_can_sell;    // Kiểm soát: bán không được vượt quá sản xuất
sem_t sem_can_produce; // Kiểm soát: sản xuất không được vượt quá bán + 5

void *sellThread(void *arg) {
    for (int i = 0; i < 10000; i++) {
        sem_wait(&sem_can_sell); // Đợi có sản phẩm để bán
        
        sells++;
        printf("Sell: %d \t [Products: %d, Sells: %d] -> Gap: %d\n", 
                sells, products, sells, products - sells);
        
        sem_post(&sem_can_produce); // Bán xong 1 cái, trống chỗ để sản xuất tiếp
        
        usleep(2000000); // Nghỉ 2 giây để dễ quan sát
    }
    pthread_exit(NULL);
}

void *productThread(void *arg) {
    for (int i = 0; i < 10000; i++) {
        sem_wait(&sem_can_produce); // Đợi có chỗ trống trong kho (max 5)
        
        products++;
        printf("Produce: %d \t [Products: %d, Sells: %d] -> Gap: %d\n", 
                products, products, sells, products - sells);
        
        sem_post(&sem_can_sell); // Sản xuất xong, báo có hàng để bán
        
        usleep(1000000); // Nghỉ 1 giây (sản xuất nhanh hơn bán một chút)
    }
    pthread_exit(NULL);
}

int main() {
    // Khởi tạo: can_sell = 0 (chưa có hàng), can_produce = 5 (kho trống 5 chỗ)
    sem_init(&sem_can_sell, 0, 0);
    sem_init(&sem_can_produce, 0, 5);

    pthread_t tid[2];
    pthread_create(&tid[0], NULL, sellThread, NULL);
    pthread_create(&tid[1], NULL, productThread, NULL);

    pthread_join(tid[0], NULL);
    pthread_join(tid[1], NULL);

    sem_destroy(&sem_can_sell);
    sem_destroy(&sem_can_produce);

    return 0;
}


// # Biên dịch
// gcc lab14.2_solution.c -o lab14.2_solution -lpthread

// # Chạy
// ./lab14.2_solution