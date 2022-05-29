package com.kh.exam5;
public class Main {
    public static void main(String[] args) {
        int x = 10;
        int y = 20;
        sum(x, y);
        System.out.printf("x = %d \ny = %d \n", x, y);

        int [] r = changeArray(x,y);

        x = r[0];
        y = r[1];
        System.out.println("x = " + x);
        System.out.println("y = " + y);

        int[] k = new int[2];
        k[0] = 10;
        k[1] = 20;
        changeArray(k[0], k[1]);
//        System.out.println("k[0]" + k[0]);
//        System.out.println("k[1]" + k[1]);
    }

    public static void sum(int x, int y) {
        x = 30;
        y = 40;
    }

    public static int[]  changeArray(int x, int y) {
        int[] r = new int[2];
        r[0] = 30;
        r[0] = 40;

        return r;
    }
}
