package com.kh.exam1;

public class ExamMain {
    public static void main(String[] args) {
        Calculator cal1 = new Calculator();
        cal1.plus(10,20);
        cal1.powerOn();

        try {
            System.out.println(cal1.getResult());
            cal1.plus(20,30);
            System.out.println(cal1.getResult());
            cal1.minus(50,30);
            System.out.println(cal1.getResult());
        }catch (Exception e) {
            System.out.println(e.getMessage());
            return;
        }

    }
}
