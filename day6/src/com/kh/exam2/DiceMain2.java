package com.kh.exam2;

import java.util.Scanner;

public class DiceMain2 {
    public static void main(String[] args) {
        //설명
        Scanner sc = new Scanner(System.in);
        System.out.println("[두 주사위의 합이 10보다 크면 당첨입니다.]");
        System.out.println("주사위 게임을 몇 번 하시겠습니까?");
        //입력 값 만큼 반복
        int num = sc.nextInt();

        Dice2 dice1 = new Dice2(); //1번 다이스 생성
        Dice2 dice2 = new Dice2(); //2번 다이스 생성

        int i = 1;
        while (i <= num) {
            //주사위 인스턴스 각각 던지는 행위
            dice1.throwDice();
            dice2.throwDice();

            //주사위 정보
            System.out.printf("<%d회> [1번 다이스] = %d ", i, dice1.getNum());
            System.out.printf("[2번 다이스] = %d \n", dice2.getNum());
            System.out.print("합 = " + (dice1.getNum() + dice2.getNum()));

            // 2개의 주사위 눈의 합이 10보다 크면 "당첨"
            if (dice1.getNum() + dice2.getNum() > 10) {
                System.out.println(" **************** [당첨] ****************");
            } else {
                System.out.println(" [꽝]");
            }
            System.out.println("--------------------------------------");
            i++;
        }
    }
}
