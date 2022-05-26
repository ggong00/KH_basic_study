package com.kh.excercise14.q4;

public class Main {
    public static void main(String[] args) {
        try {
            int[] array = new int[]{1, 2, 3};
            System.out.println(array[3]);
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("배열 인덱스의 사용 범위를 벗어났습니다.");
        } catch (Exception e) {
            System.out.println("다른 예외가 발생했습니다.");
        }
    }
}
