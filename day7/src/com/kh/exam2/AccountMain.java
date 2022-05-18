package com.kh.exam2;

public class AccountMain {
    public static void main(String[] args) {
        Account a1 = new Account("홍길동", 10000);
        System.out.println(a1.toString());

        a1.setName("홍길순");
        System.out.println("a1.getname = " + a1.getName());

        a1.plusMoney(100000);
        System.out.println(a1.toString());

        a1.minusMoney(2000);
        System.out.println(a1.toString());

        a1.minusMoney(2000000);
        System.out.println(a1.toString());

    }
}
