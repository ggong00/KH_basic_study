package com.kh.exam1;
/*
    계좌 모델링
*/

public class Account {
    private String accountOwner;
    private int balance;

    public Account(String accountOwner) {
        this.accountOwner = accountOwner;
    }

    /**
     * @param money = 입금액
     * @throws DepositLimitException
     */

    public void deposit(int money) throws DepositLimitException {
        if (money < 0) {
            throw new MinusException("음수 허용 불가");    //uncheck exception
//            System.out.println("음수허용 불가")
        }
        if (money > 40000) {
//            System.out.println("입금한도 초과");
            throw new DepositLimitException("입금한도 초과", new Throwable("40000")); //checked exception
        }
        balance += money;
    }

    /**
     *
     * @param money = 출금액
     */

    public void withdraw(int money) {
        balance -= money;
    }

    @Override
    public String toString() {
        return "Account{" +
                "accountOwner='" + accountOwner + '\'' +
                ", balance=" + balance +
                '}';
    }

    public String getAccountOwner() {
        return accountOwner;
    }

    public int getBalance() {
        return balance;
    }
}
