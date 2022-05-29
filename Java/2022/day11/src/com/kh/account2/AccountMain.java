package com.kh.account2;

import java.util.HashMap;
import java.util.Scanner;

public class AccountMain {
    static HashMap<String, Menu> menus = new HashMap<>();

    public static void main(String[] args) {
        Bank bank = new Bank();
        Scanner scan = new Scanner(System.in);
        boolean stop = false;

        outer:
        while (!stop) {
            String accountName = null;      //예금주 이름
            String accountNumber = null;    //계좌 번호
            int money = 0;                  //입금, 출금 금액

            System.out.println("메뉴 >> 1.신규 2.폐지 3.입금 4.출금 5.계좌조회(개별) 6.계좌조회(전체) 7.종료 ");
            System.out.print("선택>>");
            String menu = scan.nextLine();
            switch (menu) {
                case "1":   //신규
                    System.out.print("이름 >>");
                    accountName = scan.nextLine();
                    bank.createAccount(accountName);
                    break;

                case "2":   //폐지
                    System.out.print("계좌번호 >>");
                    accountNumber = scan.nextLine();
                    bank.closeAccount(accountNumber);
                    break;

                case "3":   //입금
                    System.out.print("계좌번호 >>");
                    accountNumber = scan.nextLine();
                    System.out.print("입금액 >>");
                    money = Integer.parseInt(scan.nextLine());
                    bank.deposit(accountNumber, money);
                    break;

                case "4":   //출금
                    System.out.print("계좌번호 >>");
                    accountNumber = scan.nextLine();
                    System.out.println("출금액");
                    money = Integer.parseInt(scan.nextLine());
                    bank.withdraw(accountNumber, money);

                case "5":   //계좌조회(개별)
                    System.out.print("계좌번호 >>");
                    accountNumber = scan.nextLine();
                    bank.printAccountInfo(accountNumber);
                    break;

                case "6":   //계좌조회(전체)
                bank.printAccountAllInfo();
                    break;

                case "7":   //종료
                    stop = true;
                    continue;

                default:    //예외
                    System.out.println("선택한 목록이 없습니다.");
                    break;
            }
        }
    }
}
