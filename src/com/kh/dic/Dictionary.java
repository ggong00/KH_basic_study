package com.kh.dic;

import java.util.*;
/**
 *  단어장
 */
public class Dictionary {
    private TreeMap<String, String> dic = new TreeMap<>();
    private final int WORD_CPAPCITY = 5;

    /**
     * 저장
     * @param word 단어
     * @param meaning 의미
     */
    public void save(String word, String meaning) {
        //1)단어수 초과체크
        if(dic.size() == WORD_CPAPCITY) {
            throw new DictionaryException("최대 단어수 초과");
        }
        //2)중복체크
        if(dic.containsKey(word)) {
            throw new DictionaryException("이미 등록 되었습니다");
        }
        dic.put(word.toLowerCase(), meaning.toLowerCase());
    }

    /**
     * 검색
     * @param word 단어
     * @return 결과
     */
    public Map<String, String> findByWord(String word) {
        word = word.toLowerCase();
        Map<String, String> map = new HashMap<String, String>();
        String meaning = dic.get(word);
        if (meaning != null) {
            //1) 일치하는 단어를 검색했을 경우
            map.put(word, meaning);
        } else {
            //2) 일치하는 단어가 없을 경우
            char firstLetter = word.charAt(0);
            char nextLetter = (char) (word.charAt(0) + 1);
            map = dic.subMap(word, true, String.valueOf(nextLetter), false);
        }
        return map;
    }

    /**
     * 수정
     * @param word 단어
     * @param meaning 의미
     */
    public void update(String word, String meaning) {
        if (dic.replace(word.toLowerCase(), meaning) == null) {
            throw new DictionaryException("단어를 검색할 수 없습니다.");
        }
        System.out.println("단어의 뜻을 수정하였습니다.");
    }

    /**
     * 삭제
     * @param word 단어
     */
    public void delete(String word) {
        if (dic.remove(word.toLowerCase()) == null) {
            throw new DictionaryException("단어를 검색할 수 없습니다.");
        }
        System.out.println("단어를 삭제하였습니다.");
    }

    /**
     * 목록
     * @param subMenu 오름차순 내림차순
     * @return 단어
     */
    public Map<String, String> listAll(String subMenu) {
        Map<String, String> map = new HashMap<>();

        switch (subMenu) {
            case "1":   //오름차순:
                map = dic;
                break;
            case "2":   //내림차순:
                map = dic.descendingMap();
                break;
        }
        return map;
    }

    /**
     * 색인
     * @param letter 첫 글자
     * @return 단어
     */
    public List<String> index(String letter) {
        letter = letter.toLowerCase();
        //다음 문자 계산하기
        char nextLetter = (char) (letter.charAt(0) + 1);
        NavigableMap<String, String> subMap = dic.subMap(letter, true, String.valueOf(nextLetter), false);

        //단어만 추출
        Set<String> words = subMap.keySet();

        //set => list 옮겨담기
        List<String> list = new ArrayList<>();
        for (String word : words) {
            list.add(word);
        }
        return list;
//       return new ArrayList<>(subMap.keySet());
    }


    /**
     * 통계
     * @return 통계값
     */
    public String showWordStatics() {
        if (dic.size() == 0) {
            throw new DictionaryException("저장된 단어가 없습니다");
        }
        String info = "";
        info += "1. 저장된 단어의 갯수 : " + dic.size() + "\n";
        info += "2. 단어의 문자수가 가장 많은 단어 : " + getMostCharacterCount() + "\n";
        info += "3. 단어 글자수 내림차순 출력(단어만) : " + descendingByLengthOfWord() + "\n";

        return info;
    }

    //단어의 글자수가 가장 많은 단어, 이름있는 비교연산자
    private String getMostCharacterCount() {
        String str = "";

        TreeMap<String, String> map = new TreeMap<>(new DescendingByLengthOfWord());
        map.putAll(dic);
        map.firstKey();
        return map.firstKey();
    }

    //단어의 글자수가 가장 많은 단어, 익명 비교연산자
    private String getMostCharacterCount2() {
        String str = "";

        TreeMap<String, String> map = new TreeMap<>(new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                int result = 1;
                if (o1.length() > o2.length()) {
                    result = -1;
                }
                return result;
            }
        });
        map.putAll(dic);
        return map.firstKey();
    }

    private String descendingByLengthOfWord() {
        String str = "";
        TreeMap<String, String> map = new TreeMap<>(new DescendingByLengthOfWord());
        map.putAll(dic);
        Set<String> words = map.keySet();

        int size = words.size();
        int cnt = 0;
        for (String word : words) {
            if (cnt == size - 1) {
                str += word;
            } else {
                str += word + ",";
            }
            ++cnt;
        }
        return str;
    }

     static class DescendingByLengthOfWord implements Comparator<String> {

        @Override
        public int compare(String o1, String o2) {
            if (o1.length() > o2.length()) {
                return -1;
            }
            return 1;
        }
    }

    //초기값
    public void init() {
        dic.put("student", "학생");
        dic.put("teacher", "교사");
        dic.put("classroom", "교실");
        dic.put("smart", "현명한");
        dic.put("lunch", "점심");
    }

    //비우기
    public void clearAll() {
        dic.clear();
    }

}
