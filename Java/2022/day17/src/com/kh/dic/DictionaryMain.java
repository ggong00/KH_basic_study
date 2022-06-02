package com.kh.dic;

import java.util.Scanner;

public class DictionaryMain {
    public static void main(String[] args) {
        String word = "";
        String meaning = "";
        Scanner sc = new Scanner(System.in);
        Dictionary dictionary = new Dictionary();
        String menuList = "메뉴] 1.저장 2.검색 3.수정 4.삭제 5.목록 6.색인 7.통계 8.종료";
        boolean stop = false;
        while (!stop) {
            System.out.println(menuList);
            String menu = sc.nextLine();
            switch (menu) {
                case "1" : //저장
                    System.out.print("단어 >>");
                    word = sc.nextLine();
                    System.out.print("뜻 >>");
                    meaning = sc.nextLine();
                    try {
                        dictionary.addDictionary(word , meaning);
                    } catch (DictionaryException e) {
                        System.out.println(e.getMessage());
                    }
                    break;
                case "2" : //검색
                    System.out.print("단어 >>");
                    word = sc.nextLine();
                    System.out.println(dictionary.findDictionary(word));
                    break;
                case "3": //수정
                    System.out.print("단어 >>");
                    word = sc.nextLine();
                    dictionary.updateDictionary(word);
                    break;
                case "4": //삭제
                    System.out.print("단어 >>");
                    word = sc.nextLine();
                    dictionary.deleteDictionary(word);
                    break;
                case "5": //목록
                    System.out.println("서브메뉴] 1.오름차순 2.내림차순");
                    String submenu = sc.nextLine();
                    dictionary.AllList(submenu);
                    break;
                case "6": //색인
                    System.out.println("알파벳 첫 글자를 입력해주세요");
                    String idx = sc.nextLine();
                    dictionary.indexFindToList(idx);
                    break;
                case "7": //통계
                    System.out.println("서브메뉴] 1.저장된 단어 갯수 2.단어의 문자수가 가장 많은 단어 3.단어 글자수 내림차순 출력(단어만)");
                    String submenu2 = sc.nextLine();
                    dictionary.statisticsOfDictionary(submenu2);
                    break;
                case "8": //종료
                    stop = true;
                    System.out.println("종료");
                    break;
                default: //예외입력
                    System.out.println("입력이 올바르지 않습니다.");
                    break;
            }
        }
    }
}
