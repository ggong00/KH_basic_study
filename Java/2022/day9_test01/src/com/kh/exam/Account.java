package com.kh.exam;

public class Account {
    final private int RIMIT_DEPOSIT_AND_WITHDROW = 40000;   //1회 입금, 출력 제한금액
    final private int MAX_BALANCE = 100000; //최대 예치금
    private String name;    //예금주 이름
    private int balance;    //잔고
    private String accountNumber;   //계좌번호
    private static int count;   //계좌번호를 카운트해주는 정적멤버
    final private int ACCOUNT_NUMBER_SIZE = 3;  //계좌번호를 부여하는 방식

    public Account(String name) {   //생성자 : 예금주를 입력받음
        this.name = name;   //예금주 설정
        this.balance = 0;   //초기 잔액은 0원
        count++;    //객체 생성 시 번호 +1

//      [계좌번호 모양 ex) 001 , 002 , 003 ... 999]
        String tmp = count + "";
        int length = ACCOUNT_NUMBER_SIZE - tmp.length();
        for (int i = 0; i < length; i++) {
            tmp = "0" + tmp;
        }
        accountNumber = tmp;
    }

    public void deposit(int input) {    //[입력받은 금액만큼 입금]
        if (getBalance() + input > MAX_BALANCE) {    //[입금액이 4만원을 넘는지 체크]
            System.out.println("최대 예치금액은 = " + MAX_BALANCE + "원 입니다.");
        } else if (input > RIMIT_DEPOSIT_AND_WITHDROW) {    //[입금 시 최대 예치금을 초과하는지 체크]
            System.out.println("1회 입금액을 초과했습니다.");
        } else {    //[모든 조건을 넘기면 입금]
            setBalance(getBalance() + input);
        }
        System.out.println("계좌 잔고 = " + getBalance() + "원");
    }

    public void withdraw(int input) {   //[입력받은 금액만큼 출금]
        if (getBalance() - input < 0) { //[출금 시 잔고가 마이너스가 되는지 체크]
            System.out.println("계좌의 잔액이 부족합니다");
        } else if (input > RIMIT_DEPOSIT_AND_WITHDROW) {     //[출금액이 4만원을 넘는지 체크]
            System.out.println("1회 출금액을 초과했습니다.");
        } else {    //[모든 조건을 넘기면 출금]
            setBalance(getBalance() - input);
        }
        System.out.println("계좌 잔고 = " + getBalance() + "원");
    }

    //  [getter and setter]
    public String getName() {
        return name;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public String getAcoountNumber() {
        return accountNumber;
    }

    //  [object클래스의 toString메소드 오버라이드]
    @Override
    public String toString() {
        String str = "";
        str += "계좌번호 = " + getAcoountNumber() + "\n";
        str += "예금주 = " + getName() + "\n";
        str += "잔고 = " + getBalance() + "\n";
        return str;
    }
}
