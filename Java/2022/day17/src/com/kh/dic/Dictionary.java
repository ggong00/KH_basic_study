package com.kh.dic;

import java.util.*;

public class Dictionary {
    private TreeMap<String, String> dictionary = new TreeMap<>();

    //저장
    public void addDictionary(String word, String meaning) throws DictionaryException {
        String lowercase = word.toLowerCase();
        if (dictionary.size() >= 5) {
            System.out.println("최대 5개단어만 저장할 수 있습니다.");
            return;
        }
        checkDictionaryException(lowercase);
        dictionary.put(lowercase, meaning);
        System.out.println("등록되었습니다.");
    }

    //검색
    public String findDictionary(String word) {
        String lowercase = word.toLowerCase();
        String result = "";
        Set<String> set = dictionary.keySet();
        for (String s : set) {
            if (s.indexOf(lowercase) == 0) {
                result += s + " : " + dictionary.get(s) + "\n";
            }
        }
        if (result.equals("")) {
            return result = "단어를 검색할 수 없습니다";
        }
        return result;
    }

    //수정
    public void updateDictionary(String word) {
        String lowercase = word.toLowerCase();
        Scanner sc = new Scanner(System.in);
        if (!dictionary.containsKey(lowercase)) {
            System.out.println("단어를 검색할 수 없습니다");
            return;
        } else {
            System.out.println(lowercase + " : " + dictionary.get(lowercase));
            System.out.print("수정할 뜻 >>");
            dictionary.put(lowercase, sc.nextLine());
            System.out.println("단어의 뜻을 수정 하였습니다.");
            System.out.println(lowercase + " : " + dictionary.get(lowercase));

        }
    }

    //삭제
    public void deleteDictionary(String word) {
        String lowercase = word.toLowerCase();
        if (!dictionary.containsKey(lowercase)) {
            System.out.println("단어를 검색할 수 없습니다");
            return;
        } else {
            dictionary.remove(lowercase);
            System.out.println("단어를 삭제 하였습니다.");
        }
    }

    //목록
    public void AllList(String submenu) {
        if (submenu.equals("1")) {
            Set<Map.Entry<String, String>> entries = dictionary.entrySet();
            for (Map.Entry<String, String> entry : entries) {
                System.out.println(entry.getKey() + " : " + entry.getValue());
            }
        } else if (submenu.equals("2")) {
            Set<Map.Entry<String, String>> entries = dictionary.descendingMap().entrySet();
            for (Map.Entry<String, String> entry : entries) {
                System.out.println(entry.getKey() + " : " + entry.getValue());
            }
        } else {
            System.out.println("입력이 올바르지 않습니다.");
        }
    }

    //색인
    public void indexFindToList(String index) {
        if (index.toString().length() > 1) {
            System.out.println("한 글자만 입력해주세요");
            return;
        }
        String lowercase = index.toLowerCase();
        char ch = lowercase.charAt(0);
        NavigableMap<String, String> subMap;
        subMap = dictionary.subMap(ch + "", true, (char) (ch + 1) + "", false);
        if (subMap.size() == 0) {
            System.out.println("단어를 검색할 수 없습니다.");
            return;
        }
        for (String s : subMap.keySet()) {
            System.out.println(s + " : " + dictionary.get(s));
        }
    }

    //통계
    public void statisticsOfDictionary(String submenu) {
        TreeSet<String> subDictionary = null;
        if (dictionary.size() == 0) {
            System.out.println("등록된 단어가 한 개도 없습니다.");
            return;
        }
        if (submenu.equals("2") || submenu.equals("3")) {
            Comparator<String> comparator = new Comparator<>() {
                @Override
                public int compare(String o1, String o2) {
                    if (o1.length() > o2.length()) {
                        return -1;
                    } else if (o1.length() < o2.length()) {
                        return 1;
                    } else {
                        return 1;
                    }
                }
            };
            subDictionary = new TreeSet<>(comparator);
            for (String m : dictionary.keySet()) {
                subDictionary.add(m);
            }
        }
        switch (submenu) {
            case "1":
                System.out.println("저장된 단어 수는" + dictionary.size() + "개 입니다.");
                break;
            case "2":
                System.out.println(subDictionary.first());
                break;
            case "3":
                for (String s : subDictionary) {
                    System.out.println(s);
                }
                break;
            default:
                System.out.println("입력이 올바르지 않습니다.");
                return;
        }
    }

    //중복 예외
    public void checkDictionaryException(String word) throws DictionaryException {
        if (dictionary.containsKey(word)) {
            throw new DictionaryException("이미 등록되었습니다");
        }
    }

}
