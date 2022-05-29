package com.kh.exam1;

import java.util.HashSet;
import java.util.Set;

public class SetExam1 {
    public static void main(String[] args) {
        Set<String> set = new HashSet<>();

        //요수추가
        set.add("홍길동");
        set.add("홍길순");
        set.add("홍길서");
        set.add("홍길동"); //중복(x)

        System.out.println(set);

        //요소검색 (동등객체 존재유무판단)
        System.out.println(set.contains("홍길동"));

        //요소검색 (컬렉션이 비워져 있는지)
        System.out.println(set.isEmpty());

        //요소검색(요소 수)
        System.out.println(set.size());

        //요소순환
        for (String s : set) {
            System.out.println(s);
        }

        //요소 삭제(동등개체 삭제)
        set.remove("홍길서");
        System.out.println(set);

        //요소 삭제(전체)
        set.clear();
        System.out.println(set);

        set.add("홍길동");
        set.add("홍길순");
        set.add("홍길서");

    }
}
