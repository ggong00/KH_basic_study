package com.kh.exam2;

public class TraineeMain {
    public static void main(String[] args) {
        Trainee trainee1 = new Trainee();
        trainee1.study();
        trainee1.doHomeWork();

        Trainee trainee2 = new Trainee("홍길동", 30);
        trainee2.study();
        trainee2.doHomeWork();

        Trainee trainee3 = new Trainee("홍길순", 20, "여자");
        trainee3.study();
        trainee3.doHomeWork();

        Trainee[] trainees = new Trainee[21];
        trainees[0] = trainee1;
        trainees[1] = trainee2;
        trainees[2] = trainee3;

        for (int i = 0; i < 3; i++) {
            Trainee trainee = trainees[i];
            trainee.study();
        }


    }
}
