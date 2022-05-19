package com.kh.exam;
import java.util.Scanner;
public class Account {
    private int accountId = 0;  //아이디 값
    private static int idCount = 0; //아이디 카운트
    private String name;    //계좌명
    private int balance;    //계좌 잔액
    final private int MAX_DEPOSIT_ONCE = 100000;    //1회 최대 입금 한도
    final private int MAX_WITHDRAW = -1000000; //출금 한도

    public Account(String name) {   //생성자
        this.name = name;
        accountId = ++idCount;
    }

    public void deposit() {    //입금
        System.out.println("입금할 금액을 입력해주세요");
        Scanner sc = new Scanner(System.in);
        int money = sc.nextInt();
        if (money < MAX_DEPOSIT_ONCE && money > 0) {
            this.balance += money;
            System.out.println(money + "원 입금되었습니다.");
        } else {
            System.out.println("1회 입금 한도를 초과했습니다.");
        }
    }
    public void withdraw() {   //출금
        System.out.println("출력할 금액을 입력해주세요");
        Scanner sc = new Scanner(System.in);
        int money = sc.nextInt();
        if (this.balance - money < MAX_WITHDRAW && money > 0)  {
            System.out.println("출금 한도를 초과했습니다.");
            System.out.println("계좌 잔액 = " + this.balance);
        } else {
            System.out.println(money + "원 출금했습니다.");
            this.balance -= money;
        }
    }

    //      getter-setter
    public String getName() {
        return name;
    }
    public int getBalance() {
        return balance;
    }
    public long getMAX_WITHDRAW() {
        return MAX_WITHDRAW;
    }
    public long getMAX_DEPOSIT() {
        return MAX_DEPOSIT_ONCE;
    }

    public int getAccountId() {
        return accountId;
    }

    //      toString
    @Override
    public String toString() {
        String str = "";
        str += "[고객 번호 = " + getAccountId() + "]";
        str += "[이름 = " + getName() + "]";
        str += "[잔액 = " + getBalance() + "]";
        str += "[1회 입금 한도 = " + getMAX_DEPOSIT() + "]";
        str += "[출금 한도 = " + getMAX_WITHDRAW() + "]";
        return str;
    }
}
