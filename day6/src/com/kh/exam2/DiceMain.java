package com.kh.exam2;

import java.util.Scanner;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;

public class DiceMain {
    public static void main(String[] args) {
        //주사위 인스턴스 2개 생성
        Scanner sc = new Scanner(System.in);
        boolean stop = false;
        Dice dice1 = new Dice();
        Dice dice2 = new Dice();

        //주사위 인스턴스 각각 던지는 행위
        while (!stop) {
            dice1.roll();
            dice2.roll();
            System.out.println("dice1.faceValue = " + dice1.getFaceValue());
            System.out.println("dice2.faceValue = " + dice2.getFaceValue());
            //2개 주사위의 눈의 합이 10보다 크면 "당첨"
            int sumOfDice = dice1.getFaceValue() + dice2.getFaceValue();
            if (sumOfDice > 10) {
                System.out.println("당첨!");
            } else {
                System.out.println("꽝");
            }
            System.out.print("계속하시겠습니까? (y or n) = ");
            String input = sc.nextLine();

            if (input.equals("n")) {
                stop = true;
            }
        }
//        double a = Math.random()*6 +1;
//        System.out.println(a);
//        String.format("%.f",Math.random()*6 +1);
    }
}
