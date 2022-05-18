package exam2;

import  java.lang.*;
/**
은행계좌 설계
 */
public class Account extends Object {
    private String accountOwner; //계정소유자

    private long balance; //잔액

    //입금
    public void deposit(int money) {
    this.balance += money;
   }
//출금
    public void withdraw(int money){
        this.balance -= money;
    }

    @0verride;
    public String toString(){
        return "계좌{" + "계좌소유자명='" + accountOwner +'\'' +
    }                ", 잔액=" + balance +


}


