package com.kh.exam;

import java.util.Scanner;

public class AccountMain {
    final static private String EXIT = "계좌를 선택해주세요";

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        AccountRepository accountRepository = new AccountRepository();  //저장소 생성

        Account accountSet = null;  //계좌 선택여부 확인

        boolean stop = false;   //반복문 제어
        while (!stop) {
            System.out.println("0.계좌선택 1.계좌개설 2.입금 3.출금 4.잔액조회 5.계좌폐지 6.계좌현황 7.종료 8.설정");
            switch (sc.nextLine()) {
                case "0": //계좌선택
                    System.out.println("계좌 이름을 입력해주세요");
                    accountSet = accountRepository.findAccount(sc.nextLine());
                    break;
                case "1": //계좌개설
                    if (accountRepository.getJoinNumber() < accountRepository.getAccounts().length) {
                        System.out.println("이름을 입력해주세요");
                        accountSet = new Account(sc.nextLine());
                        accountRepository.SignUpAccount(accountSet);
                    } else {
                        System.out.println("계좌가 꽉찼습니다.");
                    }
                    break;

                case "2":  //입금
                    if (accountSet == null) {
                        System.out.println(EXIT);
                    } else {
                        System.out.println("입금할 금액을 입력해주세요");
                        accountSet.deposit(Integer.parseInt(sc.nextLine()));
                    }
                    break;

                case "3":  //출금
                    if (accountSet == null) {
                        System.out.println(EXIT);
                    } else {
                        System.out.println("출금할 금액을 입력해주세요");
                        accountSet.withdraw(Integer.parseInt(sc.nextLine()));
                    }
                    break;

                case "4":  //잔액조회
                    if (accountSet != null) {
                        System.out.println(accountSet.toString());
                    } else {
                        System.out.println(EXIT);
                    }
                    break;

                case "5":  //계좌폐지
                    System.out.println("폐지할 계좌의 이름을 입력해주세요");
                    accountRepository.deleteAccount(sc.nextLine());
                    break;

                case "6":  //계좌현황
                    System.out.println(accountRepository.toString());
                    break;

                case "7":  //종료
                    System.out.println("종료합니다.");
                    stop = true;
                    break;

                case "8": //계좌 설정
                    System.out.println("아직 준비되지 않았습니다.");
                    System.out.println(accountRepository.getJoinNumber());
                    break;

                default:  //잘못된 입력
                    System.out.println("입력이 올바르지 않습니다.");
                    break;
            }
        }
    }
}
