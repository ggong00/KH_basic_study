package com.kh.excercise17.q5;

public class Main {
    public static void main(String[] args) {
        Date date1 = new Date(3);
        Date date2 = new Date(3);
        System.out.println(date1 == date2);
        System.out.println(date1.equals(date2));
        System.out.println(date1.hashCode() == date2.hashCode());
    }
}
