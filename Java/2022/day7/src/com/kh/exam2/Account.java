package com.kh.exam2;

public class Account {
    private String name;    //이름
    private int money;      //잔고

    public Account() {  //디폴트 생성자
        super();
    }

    public Account(String name, int money) {    //생성자
        this.name = name;
        this.money = money;
    }

    public void setName(String name) {  //이름 변경
        this.name = name;
    }

    public String getName() {   //이름 확인
        return name;
    }

    public int getMoney() {     //잔고 확인
        return money;
    }

    public void plusMoney(int money) {   //입금
        this.money += money;
    }

    public void minusMoney(int money) {   //출금
        if(this.money < money) {
            System.out.println("잔액이 부족합니다");
            System.out.println("남은 잔액 " + this.money + "원");
        } else {
            this.money -= money;
        }
    }

    @Override
    public String toString() {  //계좌 정보 확인
        return "[예금주] = "+this.name + " [남은 잔액] = " + this.money;
    }
}
