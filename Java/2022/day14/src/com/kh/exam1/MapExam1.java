package com.kh.exam1;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class MapExam1 {
    public static void main(String[] args) {
        Map<String, String> dictionary = new HashMap<>();

        //요소 추가
        dictionary.put("student", "학생");
        dictionary.put("teacher", "교사");
        dictionary.put("lecture", "강좌");
        dictionary.put("classroom", "교실");
        dictionary.put("classroom", "교실2");
        System.out.println(dictionary);

        //요소 검색(키 존재여부)
        System.out.println(dictionary.containsKey("student"));

        //요소 검색(값 존재여부)
        System.out.println(dictionary.containsValue("학생"));

        //요소 검색(주어진 키로 값 리턴)
        System.out.println(dictionary.get("student"));
        System.out.println("===========================");

        //요소 검색(모든 키 반환)
        Set<String> setA = dictionary.keySet();
        for (String s : setA) {
            System.out.println(s);
        }
        System.out.println("===========================");

        //요소 검색(모든 값 반환)
        Collection<String> values = dictionary.values();
        for (String s : values) {
            System.out.println(s);
        }
        System.out.println("===========================");

        //요소 검색 (키와 값의 쌍으로 구성된 map.Entry반환)
        Set<Map.Entry<String, String>> entries = dictionary.entrySet();
        for (Map.Entry<String, String> entry : entries) {
            System.out.println(entry.getKey() + "=" + entry.getValue());
        }

        //요소 검색(요소가 비어있는지 여부)
        System.out.println(dictionary.isEmpty());

        //요소 검색(요수 수)
        System.out.println(dictionary.size());

        //요소 삭제(키로 검색된 요ㅕ소 삭제)
        dictionary.remove("student");
        System.out.println(dictionary);

        //요소 삭제(키, 값 쌍으로로 검색된 요소 삭제)
        dictionary.remove("teacher", "교사");
        System.out.println(dictionary);

        //요소 삭제(전체)
        dictionary.clear();
        System.out.println(dictionary.size());
        System.out.println(dictionary);
    }
}
