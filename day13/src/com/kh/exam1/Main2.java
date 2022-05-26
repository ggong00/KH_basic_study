package com.kh.exam1;

import com.kh.exam2.A;

public class Main2 {
    public static void main(String[] args) {

        method1();
    }

    private static void method1(){
        int[] arr = new int[3];

        try {
            arr[3] = 10;
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println(e.getMessage());
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCause());
            e.printStackTrace();
        }

    }
}
