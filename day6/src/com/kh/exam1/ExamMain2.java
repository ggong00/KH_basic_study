package com.kh.exam1;

import java.util.Scanner;

public class ExamMain2 {
    public static void main(String[] args) {
        Calculator c1 = new Calculator("빨강");
        Calculator c2 = new Calculator("빨강","모닝글로리");

        //켜다.
        c1.powerOn();

        c1.plus(10,20);

        try {
            System.out.println(c1.getResult());
        }catch (Exception e) {
            System.out.println(e.getMessage());
            return;
        }

        Scanner sc = new Scanner(System.in);
        System.out.println("값1 :");
//        String input = sc.nextLine();
        double value1 = Double.parseDouble(sc.nextLine());

        System.out.println("값2 :");
//        String input2 = sc.nextLine();
        double value2 = Double.parseDouble(sc.nextLine());

        c1.plus(value1,value2);

        try {
            System.out.println(c1.getResult());
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
