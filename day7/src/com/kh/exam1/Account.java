package com.kh.exam1;

import java.util.Scanner;

public class Account {
    //      필드
    private int accountId = 0;  //아이디 값
    private static int idCount = 0; //아이디 카운트
    private String name;    //계좌명
    private int balance;    //계좌 잔액
    private int maxDeposit = 100000;    //1회 최대 입금 한도
    private int maxWithdraw = -1000000; //출금 한도

    public Account(String name) {   //생성자
        this.name = name;
        accountId = ++idCount;
    }

    //      기능
    public void deposit() {    //입금
        System.out.println("입금할 금액을 입력해주세요");
        int money = scaner();
        if (money < maxDeposit) {
            this.balance += money;
            System.out.println(money + "원 입금되었습니다.");
        } else {
            System.out.println("1회 입금 한도를 초과했습니다.");
        }
    }
    public void withdraw() {   //출금
        System.out.println("출력할 금액을 입력해주세요");
        int money = scaner();
        if (this.balance - money < maxWithdraw) {
            System.out.println("출금 한도를 초과했습니다.");
            System.out.println("계좌 잔액 = " + this.balance);
        } else {
            System.out.println(money + "원 출금했습니다.");
            this.balance -= money;
        }
    }
    public int scaner() {   //정수값 입력 메소드
        Scanner sc = new Scanner(System.in);
        return sc.nextInt();
    }
    //      getter-setter
    public String getName() {
        return name;
    }
    public int getBalance() {
        return balance;
    }
    public long getMaxWithdraw() {
        return maxWithdraw;
    }
    public long getMaxDeposit() {
        return maxDeposit;
    }

    public static void setIdCount() {
        Account.idCount = --idCount;
    }

    public int getAccountId() {
        return accountId;
    }

    //      toString
    @Override
    public String toString() {
        String str = "";
        str += "[이름 = " + getName() + "]";
        str += "[잔액 = " + getBalance() + "]";
        str += "[1회 입금 한도 = " + getMaxDeposit() + "]";
        str += "[출금 한도 = " + getMaxWithdraw() + "]";
        return str;
    }
}