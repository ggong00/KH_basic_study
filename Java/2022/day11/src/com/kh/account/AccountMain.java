package com.kh.account;

import java.util.Arrays;
import java.util.Scanner;

public class AccountMain {
    static final int NOT_FOUNT = -1;

    public static void main(String[] args) {
        displayMenu();

    }

    private static void displayMenu() {
        final int OPEN_ACCOUNT_LIMIT = 5;   //계좌개설 수 한도
        Account[] accounts = new Account[OPEN_ACCOUNT_LIMIT];
        System.out.println(Arrays.toString(accounts));
        boolean stop = false;

        Scanner scan = new Scanner(System.in);
        int idx = NOT_FOUNT;
        String accountName = null;      //예금주 이름
        String accountNumber = null;    //계좌 번호
        int money = 0;                  //입금, 출금 금액

        outer:
        while (!stop) {
            System.out.println("메뉴 >> 1.신규 2.폐지 3.입금 4.출금 5.계좌조회(개별) 6.계좌조회(전체) 7.종료 ");
            System.out.print("선택>>");
            String menu = scan.nextLine();
            switch (menu) {
                case "1":   //신규
                    System.out.print("이름 >>");
                    accountName = scan.nextLine();
                    //비어있는 요소 찾아오기
                    idx = findNullIndex(accounts);
                    if (idx == NOT_FOUNT) {
                        System.out.println("계좌 개설 한도가 모두 찼습니다.");
                        continue;
                    }
                    //동명이인 체크
                    if (dupChkAccountName(accounts, accountName)) {
                        System.out.println("동명이인이 존재합니다");
                        continue;
                    }
                    accounts[idx] = new Account(accountName);
                    System.out.println(accountName + "님의 신규 계좌가 생성되었습니다.");
                    System.out.println(accounts[idx]);
                    break;

                case "2":   //폐지
                    System.out.print("계좌번호 >>");
                    accountNumber = scan.nextLine();
                    idx = findIndexOfAccount(accounts, accountNumber);
                    if (idx == NOT_FOUNT) {
                        System.out.println("찾고자하는 계좌가 없습니다.");
                        continue;
                    }
                    //잔액 유무 체크
                    if (accounts[idx].getBalance() > 0) {
                        System.out.println("잔액이 존재합니다.");
                        System.out.println(accounts[idx]);
                    } else {
                        accounts[idx] = null;
                    }
                    break;

                case "3":   //입금
                    int limitCnt = 0;
                    while (true) {
                        System.out.print("계좌번호 >>");
                        accountNumber = scan.nextLine();
                        idx = findIndexOfAccount(accounts, accountNumber);
                        if (idx == NOT_FOUNT) {
                            System.out.println("찾고자하는 계좌가 없습니다.");
                            limitCnt++;
                            if (limitCnt == 3) {
                                continue outer;
                            }
                            continue;
                        }
                        break;
                    }
                    System.out.print("입금액 >>");
                    money = Integer.parseInt(scan.nextLine());
                    accounts[idx].deposit(money);
                    System.out.println(accounts[idx].toString());
                    break;

                case "4":   //출금
                    System.out.print("계좌번호 >>");
                    accountNumber = scan.nextLine();
                    idx = findIndexOfAccount(accounts, accountNumber);
                    if (idx == NOT_FOUNT) {
                        System.out.println("찾고자하는 계좌가 없습니다.");
                        continue;
                    }
                    System.out.print("츌금액 >>");
                    money = Integer.parseInt(scan.nextLine());
                    accounts[idx].withdraw(money);
                    System.out.println(accounts[idx].toString());
                    break;

                case "5":   //계좌조회(개별)
                    System.out.print("계좌번호 >>");
                    accountNumber = scan.nextLine();
                    idx = findIndexOfAccount(accounts, accountNumber);
                    if (idx == NOT_FOUNT) {
                        System.out.println("찾고자하는 계좌가 없습니다.");
                        continue;
                    }
                    System.out.println(accounts[idx].toString());
                    break;

                case "6":
                    printAllAcount(accounts);
                    break;  //계좌조회(전체)

                case "7":   //종료
                    stop = true;
                    continue;

                default:    //예외
                    System.out.println("선택한 목록이 없습니다.");
                    break;
            }
        }
    }

    //동명이인 체크
    private static boolean dupChkAccountName(Account[] accounts, String accountName) {
        boolean dupChk = false;
        for (int i = 0; i < accounts.length; i++) {
            if(accounts[i] != null) {
                if (accounts[i].getAccountName().equals(accountName)) {
                    dupChk = true;
                    break;
                }
            }
        }
        return dupChk;
    }

    //모든 계좌정보 출력
    private static void printAllAcount(Account[] accounts) {
        int usingCount = 0;
        for (int i = 0; i < accounts.length; i++) {
            if (accounts[i] != null) {
                System.out.println(accounts[i]);
                usingCount++;
            }
        }
        System.out.println("사용중인 계좌 수 : " + usingCount);
        System.out.println("잔여계좌 수 : " + (accounts.length - usingCount));
    }

    // 비어 있는 요소의 인덱스 번호를 반환, 없으면 -1
    private static int findNullIndex(Account[] accounts) {
        int findedIndex = NOT_FOUNT;
        for (int i = 0; i < accounts.length; i++) {
            Account account = accounts[i];
            if (account == null) {
                findedIndex = i;
                break;
            }
        }
        return findedIndex;
    }

    //계좌번호와 일치하는 인덱스 번호를 변환, 없으면 -1 반환
    private static int findIndexOfAccount(Account[] accounts, String accountNumber) {
        int findedIndex = NOT_FOUNT;
        for (int i = 0; i < accounts.length; i++) {
            Account account = accounts[i];
            if (account != null) {
                if (account.getAccountNumber().equals(accountNumber)) {
                    findedIndex = i;
                    break;
                }
            }
        }
        return findedIndex;
    }
    //

}
