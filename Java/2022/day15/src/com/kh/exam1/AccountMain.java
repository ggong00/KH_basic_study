package com.kh.exam1;

public class AccountMain {
    public static void main(String[] args) {
        Account account = new Account("홍길동");

        try {
            account.deposit(50000);
        } catch (DepositLimitException | MinusException e) {
            System.out.println(e.getMessage() + ":" + e.getCause());
        }

        System.out.println(account);
        account.withdraw(30000);
        System.out.println(account);

    }
}
