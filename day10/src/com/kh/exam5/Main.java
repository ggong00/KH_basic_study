package com.kh.exam5;

public class Main {
    public static void main(String[] args) {
        int x = 10;
        int y = 20;
        byte result = (byte) sum(x, y);
    }

    public static int sum(double x, double y) {
        return (int) (x + y);
    }
}
