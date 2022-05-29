package com.kh.exam;

import java.util.Scanner;

public class AccountRepository {
    final static private int REPO_MAX = 10;
    private final Account[] accounts = new Account[REPO_MAX]; // 계좌 저장소
    private int joinNumber = 0;  //등록된 계좌 수
    public void signUpAccount() {    //계좌 등록
        Scanner sc = new Scanner(System.in);
        if(getJoinNumber() < REPO_MAX) {
            System.out.println("이름을 입력해주세요");
            String name = sc.nextLine();
            for (int i = 0; i < accounts.length; i++) {
                if (accounts[i] == null) {
                    accounts[i] = new Account(name);
                    joinNumber++;
                    System.out.println("개설이 완료되었습니다.");
                    System.out.println("등록된 계좌 수 = " + joinNumber);
                    break;
                }
            }
        }else {
            System.out.println("계좌가 꽉찼습니다.");
        }
    }
    public Account findAccount(String name) {   //계좌 선택
        for (Account account : accounts) {
            if (account != null) {
                if (account.getName().equals(name)) {
                    System.out.println(account.getName() + "계좌를 선택하셨습니다.");
                    return account;
                }
            }
        }
        System.out.println("계좌를 찾을 수 없습니다.");
        return null;
    }
    public void deleteAccount() {    //계좌 삭제
        Scanner sc = new Scanner(System.in);
        System.out.println("이름을 입력해주세요");
        String name = sc.nextLine();
        int isDeleteCount = 0;
        for (int i = 0; i < accounts.length; i++) { //계좌 조회 후 삭제
            if (accounts[i] != null) {
                if (accounts[i].getName().equals(name)) {
                    joinNumber--;
                    accounts[i] = null;
                    System.out.println("계좌를 삭제했습니다.");
                    System.out.println("남은 계좌 수 = " + joinNumber);
                }
            } else {
                isDeleteCount ++;
            }
        }
        if (isDeleteCount == REPO_MAX) {
            System.out.println("계좌를 찾을 수 없습니다");
        }
    }

    @Override
    public String toString() {  //계좌현황
        String str = "";
        for (Account account : accounts) {
            if (account != null) {
                str += account.toString() + "\n";
            }
        }
        if(joinNumber == 0) return "계좌가 없습니다.";
        return str;
    }
    public int getJoinNumber() {
        return joinNumber;
    }
}
