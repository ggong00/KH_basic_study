package com.kh.exam3;

public class Main {
    public static void main(String[] args) {
        //Wrapper class
        //byte -> Byte, short -> Short, char -> Character, int -> Interger
        //long -> Long, float -> Float, double -> Double, boolean -> Boolean



        //숫자문자열 => 숫자
        String num = "10";

        System.out.println(Integer.parseInt(num));
        System.out.println(Long.parseLong(num));
        System.out.println(Double.parseDouble(num));
        System.out.println(Float.parseFloat(num));
        System.out.println(Byte.parseByte(num));
        System.out.println(Short.parseShort(num));

        //숫자 = 문자열
        int num2 = 10;
        System.out.println(num2 + "");
        System.out.println(String.valueOf(num2));

        double num3 = 3.14;
        String str3 = String.valueOf(num3);
        System.out.println(str3);
    }
}
