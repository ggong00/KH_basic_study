package com.kh.exam;

public class Account {
    //      필드
    private String name;    //계좌명
    private int balance;    //계좌 잔액
    private int maxDeposit = 100000;    //1회 최대 입금 한도
    private int maxWithdraw = -1000000; //출금 한도

    public Account(String name) {   //생성자
        this.name = name;
    }

    //      기능
    public void deposit(int money) {    //입금
        if (money < maxDeposit) {
            this.balance += money;
            System.out.println(money + "원 입금되었습니다.");

        } else {
            System.out.println("1회 입금 한도를 초과했습니다.");
            System.out.println();
        }
    }

    public void withdraw(int money) {   //출금
        if (this.balance - money < maxWithdraw) {
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

    public void setName(String name) {   //이름 수정
        this.name = name;
    }

    public int getBalance() {
        return balance;
    }

    public long getMaxWithdraw() {
        return maxWithdraw;
    }

    public void setMaxWithdraw(int maxWithdraw) {     //출금 한도 변경
        this.maxWithdraw = maxWithdraw;
    }

    public long getMaxDeposit() {
        return maxDeposit;
    }

    public void setMaxDeposit(int maxDeposit) {     //1회 입금 한도 변경
        this.maxDeposit = maxDeposit;
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
