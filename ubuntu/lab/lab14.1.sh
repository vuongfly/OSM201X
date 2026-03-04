
void T1(void) {
    // T1 thực thi 

    // Xong việc, phát 2 tín hiệu cho T2 và T3
    sem_post(&sem1); 
    sem_post(&sem1); 
}

void T2(void) {
   sem_wait(&sem1);

   // T2 thực thi

     sem_post(&sem2);

}

void T3(void) {
   sem_wait(&sem1);

   // T3 thực thi

  sem_post(&sem2);

}

void T4(void) {
    sem_wait(&sem2);

    sem_wai(&sem2);

    // T4 thực thi
}
