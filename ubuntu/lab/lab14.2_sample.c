#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h> // Thư viện để dùng sleep

int sells = 0;
int products = 0;

sem_t sem_can_sell;
sem_t sem_can_produce;

void *sellThread(void *arg) {
    for (int i = 0; i < 100; i++)
    {
        sem_wait(&sem_can_sell);
        
        sells++;
        printf("Sell: no %d \t [Products: %d, Sells: %d] -> Gap: %d \n",
        sells, products, sells, products - sells);

        sem_post(&sem_can_produce);

        usleep(2000000);    // sleep 2s
    }
    pthread_exit(NULL);
}

void *produceThread(void *arg) {
    for (int i = 0; i < 100; i++)
    {
        sem_wait(&sem_can_produce);

        products++;

        printf("Produce: no %d \t [Products: %d, Sells: %d] -> Gap: %d \n",
        products, products, sells, products - sells);
        
        sem_post(&sem_can_sell);

        usleep(1000000);    // sleep 1s
    }
    pthread_exit(NULL);
}

int main() {
    // Init: can_sell = 0
    // can_produce = 5
    sem_init(&sem_can_sell, 0, 0);
    sem_init(&sem_can_produce, 0, 5);

    pthread_t tid[2];
    pthread_create(&tid[0], NULL, sellThread, NULL);
    pthread_create(&tid[1], NULL, produceThread, NULL);

    pthread_join(tid[0], NULL);
    pthread_join(tid[1], NULL);

    sem_destroy(&sem_can_sell);
    sem_destroy(&sem_can_produce);

    return 0;
}