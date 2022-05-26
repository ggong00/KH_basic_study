package com.kh.exam4;

public class AccountMain {
    public static void main(String[] args) {

        Account account = new Account("홍길동");
        System.out.println(account);

        //입금
        try {
            account.deposit(50000);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        System.out.println(account);

        //출금
        try {
            account.withdraw(45000);
        } catch (WithdrawUnderException e) {
            System.out.println(e.getMessage());
        } catch (WithdrawOverException e) {
            System.out.println(e.getMessage());
        }
        System.out.println(account);
    }

}
