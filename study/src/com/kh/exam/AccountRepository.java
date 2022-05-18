package com.kh.exam;

public class AccountRepository {
    final static private int REPO_MAX = 10;
    private final Account[] accounts = new Account[REPO_MAX]; // 계좌 저장소
    private int joinNumber = 0;  //등록된 계좌 수
    public void SignUpAccount(Account account) {    //계좌 등록
      if(getJoinNumber() < REPO_MAX) {
          for (int i = 0; i < accounts.length; i++) {
              if (accounts[i] == null) {
                  accounts[i] = account;
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

    public void deleteAccount(String name) {    //계좌 삭제
        boolean delete = false;
        if (getJoinNumber() < 1) {
            System.out.println("계좌가 존재하지 않습니다.");
        } else {
            for (int i = 0; i < accounts.length; i++) {
                if (accounts[i] != null) {
                    if (accounts[i].getName().equals(name)) {
                        joinNumber--;
                        accounts[i] = null;
                        System.out.println("계좌를 삭제했습니다.");
                        System.out.println("남은 계좌 수 = " + joinNumber);
                        delete = true;
                    }
                }
            }
            if (delete == false) {
                System.out.println("계좌를 찾을 수 없습니다.");
            }
        }
    }

    @Override
    public String toString() {  //계좌현황
        String str = "";
        if (joinNumber > 0) {
            int i = 1;
            for (Account account : accounts) {
                if (account != null) {
                    str += "[" + i + "] 번 계좌 =" + account.toString() + "\n";
                    i++;
                }
            }
        } else if (joinNumber == 0) {
            str += "계좌가 존재하지 않습니다.";
        }
        return str;
    }

    public int getJoinNumber() {
        return joinNumber;
    }

    public Account[] getAccounts() {
        return accounts;
    }
}
