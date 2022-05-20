package com.kh.exam;

import java.util.Scanner;

public class AccountMain {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Account[] accounts = new Account[5]; //계좌 저장소
        int accountsNum = 0;    //생성된 계좌 수
        boolean stop = false;   //반복문 제어

        START:
        while (!stop) {
            System.out.println("1.신규 2.폐지 3.입금 4.출금 5.계좌조회(개별) 6.계좌조회(전체) 7.종료");
            switch (sc.nextLine()) {
                case "1":   //[신규 계좌 개설]
//                  [계좌가 꽉찼는지 확인]
                    if (accountsNum == accounts.length) {
                        System.out.println("계좌가 꽉찼습니다.");
                        continue START;
                    }
//                  [예금주 이름 입력]
                    System.out.print("예금주 이름을 입력해주세요");
                    String tmp = sc.nextLine();
//                  [반복문을 돌면서 동일한 이름의 계좌가 존재하는지 체크]
                    for (int i = 0; i < accounts.length; i++) {
                        if (accounts[i] != null) {
                            if (accounts[i].getName().equals(tmp)) {
                                System.out.println("동일한 예금주의 계좌가 존재합니다.");
                                continue START;
                            }
                        }
                    }
//                  [동일한 이름이 없으면 null포인트에 계좌 생성]
                    for (int i = 0; i < accounts.length; i++) {
                        if (accounts[i] == null) {
                            accounts[i] = new Account(tmp);
                            System.out.println("계좌가 생성되었습니다.");
                            System.out.println(accounts[i].getAcoountNumber());
                            accountsNum++;
                            continue START;
                        }
                    }
                    break;
                case "2":   //[계좌 폐지]
                    int count2 = 0;
//                  [계좌의 수가 0개인지 확인]
                    if (accountsNum < 1) {
                        System.out.println("계좌를 생성해주세요");
                    } else {
                        System.out.println("삭제할 계좌의 [계좌번호]를 입력해주세요");
                        String tmp2 = sc.nextLine();
//                      [계좌에 잔액이 남아있는지 체크하고 없으면 삭제]
                        for (int i = 0; i < accounts.length; i++) {
                            if (accounts[i] != null) {
                                if (accounts[i].getBalance() == 0 && accounts[i].getAcoountNumber().equals(tmp2)) {
                                    System.out.println("계좌를 성공적으로 제거했습니다.");
                                    accounts[i] = null;
                                    accountsNum--;
                                    continue START;
                                } else if (accounts[i].getAcoountNumber().equals(tmp2)) {
                                    System.out.println("계좌에 잔액이 남아 제거가 불가능합니다.");
                                    continue START;
                                } else {
                                    count2++;
                                }
                            }
                        }
//                      [계좌번호와 일치하는 계좌가 없을 시 출력]
                        if (count2 == accountsNum) {
                            System.out.println("계좌를 찾을수 없습니다.");
                        }
                        break;
                    }
                case "3":   //[입금]
                    int count3 = 0;
//                  [계좌의 수가 0개인지 확인]
                    if (accountsNum < 1) {
                        System.out.println("계좌를 생성해주세요");
                    } else {
                        System.out.println("입금할 계좌의 계좌번호를 입력해주세요");
                        String tmp3 = sc.nextLine();
//                      [입력 금액이 4만원을 넘는지, 예치금이 10만원이 넘는지 확인]
                        Account acTmp3 = accountCheck(accounts, tmp3);
                        if (acTmp3 != null) {
                            System.out.println("입금할 금액을 입력해주세요");
                            acTmp3.deposit(Integer.parseInt(sc.nextLine()));
                            continue START;
                        } else {
                            count3++;
                        }
//                      [계좌번호와 일치하는 계좌가 없을 시 출력]
                        if (count3 == accountsNum) {
                            System.out.println("계좌를 찾을수 없습니다.");
                        }
                        break;
                    }
                case "4":   //[출금]
                    int count4 = 0;
//                  [계좌의 수가 0개인지 확인]
                    if (accountsNum < 1) {
                        System.out.println("계좌를 생성해주세요");
                    } else {
                        System.out.println("출금할 계좌의 계좌번호를 입력해주세요");
                        String tmp4 = sc.nextLine();
//                      [출금 금액이 4만원을 넘는지, 예치금이 마이너스가 되는지 확인]
                        Account acTmp4 = accountCheck(accounts, tmp4);
                        if (acTmp4 != null) {
                            System.out.println("출금할 금액을 입력해주세요");
                            acTmp4.withdraw(Integer.parseInt(sc.nextLine()));
                            continue START;
                        } else {
                            count4++;
                        }
//                      [계좌번호와 일치하는 계좌가 없을 시 출력]
                        if (count4 == accountsNum) {
                            System.out.println("계좌를 찾을수 없습니다.");
                        }
                        break;
                    }
                case "5":   //[계좌 개별 조회]
                    int count5 = 0;
//                  [계좌의 수가 0개인지 확인]
                    if (accountsNum < 1) {
                        System.out.println("계좌를 생성해주세요");
                    } else {
                        System.out.println("조회할 계좌의 [계좌번호]를 입력해주세요");
                        String tmp5 = sc.nextLine();
//                      [계좌번호와 일치하는 계좌를 찾고 정보 출력]
                        Account acTmp5 = accountCheck(accounts, tmp5);
                        if (acTmp5 != null) {
                            if (acTmp5.getAcoountNumber().equals(tmp5)) {
                                System.out.println(acTmp5.toString());
                                continue START;
                            } else {
                                count5++;
                            }
                        }
                    }
//                  [계좌번호와 일치하는 계좌가 없을 시 출력]
                    if (count5 == accountsNum) {
                        System.out.println("계좌를 찾을수 없습니다.");
                    }
                    break;
                case "6":   //[계좌 전체 조회]
//                  [계좌의 수가 0개인지 확인]
                    if (accountsNum < 1) {
                        System.out.println("계좌를 생성해주세요");
                    } else {
                        String str = "";
//                      [null포인트가 아닌 계좌의 정보를 탐색하고 출력]
                        for (int i = 0; i < accounts.length; i++) {
                            if (accounts[i] != null) {
                                str += accounts[i].toString() + "\n";
                            }
                        }
                        str += "[잔여 계좌 수] = " + accountsNum;
                        System.out.println(str);
                        break;
                    }
                case "7":   //[프로그램 종료]
                    System.out.println("프로그램을 종료합니다.");
                    stop = true;
                    break;
                default:    //[입력값이 올바르지 않으면 출력]
                    System.out.println("입력이 올바르지 않습니다.");
                    break;
            }
        }
    }

    //  [입력값과 일치하는 객체를 탐색 후 리턴하는 메소드]
    public static Account accountCheck(Account[] accounts, String str) {
        for (int i = 0; i < accounts.length; i++) {
            if (accounts[i] != null) {
                if (accounts[i].getAcoountNumber().equals(str)) {
                    return accounts[i];
                }
            }
        }
        return null;
    }
}
