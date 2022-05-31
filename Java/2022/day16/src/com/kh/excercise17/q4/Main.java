package com.kh.excercise17.q4;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

public class Main {
    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        List<String> list2 = new Vector<>();
        List<String> list3 = new LinkedList<>();
        checkPerformance(list);
        checkPerformance(list2);
        checkPerformance(list3);

        checkPerformance(list);
        checkPerformance(list2);
        checkPerformance(list3);

    }

    private static void checkPerformance(List<String> list) {
        long start = System.nanoTime(); //10억분의 1초
        for (int i = 0; i < 10; i++) {
            list.add(0, i + "데이터");
        }
        long end = System.nanoTime();
        System.out.println("완료 : " + (end - start));
//        System.out.println(list);
    }

    private static void checkPerformance2(List<String> list) {
        long start = System.nanoTime(); //10억분의 1초
        for (int i = 0; i < 10; i++) {
            list.add(i + "데이터");
        }
        long end = System.nanoTime();
        System.out.println("완료 : " + (end - start));
//        System.out.println(list);
    }


}
