package com.kh.exam1;

import java.util.ArrayList;
import java.util.List;

public class ListExam1 {
    public static void main(String[] args) {
        //list 계열의 컬렉션 생성
        List<String> list = new ArrayList<String>(30);
        System.out.println();

        //요소 추가
        list.add("홍길동");
        list.add("홍길순");
        list.add("홍길북");

        System.out.println(list);

        //요소 추가(원하는 인덱스에 추가)
        list.add(1, "홍길북");
        System.out.println(list);

        //요소 교체(교체하고자 하는원 인덱스의 요소를 교체)
        list.set(3, "홍길서");
        System.out.println(list);

        //요소 검색 (찾고자하는 요소가 있는지 여부 판단)
        System.out.println(list.contains("홍길동"));

        //요소 검색(특정 인덱스의 요소를 반환)

        System.out.println(list.get(2));

        //요소 검색(컬렉션이 비어져있는지 유무)
        System.out.println(list.isEmpty());

        //요소 검색(요소 수 반환)
        System.out.println(list.size());

        //요소 삭제(특정 인덱스의 요소 삭제)
        list.remove(2);
        System.out.println(list);

        //요소 삭제(특정 요소를 삭제)
        list.remove("홍길북");
        System.out.println(list);

        //요소 삭제(전체 삭제)
        list.clear();
        System.out.println(list);

        //요소 순환
        list.add("홍길동");
        list.add("홍길순");
        list.add("홍길북");

        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }

        //요소 순환(향상된 for)
        System.out.println("======================");
        for (String s : list) {
            System.out.println(s);
        }

    }
}
