package com.kh.excercise17.q7;

import java.util.Comparator;
import java.util.TreeSet;

public class Main {
    public static void main(String[] args) {

        MyData md1 = new MyData("자바 프로그래밍");
        MyData md2 = new MyData("반가워");
        MyData md3 = new MyData("감사합니다");

//        TreeSet<MyData> treeSet = new TreeSet<>();
//        treeSet.add(md1);
//        treeSet.add(md2);
//        treeSet.add(md3);
//        System.out.println(treeSet);
//        System.out.println();

        DescendingBuDic descendingBuDic = new DescendingBuDic();
        TreeSet<MyData> treeSet2 = new TreeSet<>(descendingBuDic);
        treeSet2.add(md1);
        treeSet2.add(md2);
        treeSet2.add(md3);
        System.out.println("글자 내림차순");
        System.out.println(treeSet2);
        System.out.println();
        Comparator<MyData> comparator = new Comparator<>() {
            @Override
            public int compare(MyData o1, MyData o2) {
                return o1.string.compareTo(o2.string);
            }
        };

        TreeSet<MyData> treeSet3 = new TreeSet<>(comparator);
        treeSet3.add(md1);
        treeSet3.add(md2);
        treeSet3.add(md3);
        System.out.println("글자 오름차순");
        System.out.println(treeSet3);
        System.out.println();

        //1)문자열 길이 오름차순 (이름있는 구현클래스)
        AscendingByLengthOfString ascending = new AscendingByLengthOfString();
        TreeSet<MyData> treeSet4 = new TreeSet<>(ascending);
        treeSet4.add(md1);
        treeSet4.add(md2);
        treeSet4.add(md3);
        System.out.println("문자열 길이 오름차순 (이름있는 구현클래스)");
        System.out.println(treeSet4);
        System.out.println();

        //2) 문자열 길잉 오름차순 (익명 구현클래스)
        Comparator<MyData> dataComparator = new Comparator<MyData>() {
            @Override
            public int compare(MyData o1, MyData o2) {
                return (o1.string.length() + "").compareTo(o2.string.length() + "");
            }
        };
        TreeSet<MyData> treeSet5 = new TreeSet<>(dataComparator);
        treeSet5.add(md1);
        treeSet5.add(md2);
        treeSet5.add(md3);
        System.out.println("문자열 길이 오름차순 (익명 구현클래스)");
        System.out.println(treeSet5);
        System.out.println();

        //3) 문자열 길이 내림차순 (이름있는 구현클래스)
        DescendingByLengthOfString descending = new DescendingByLengthOfString();
        TreeSet<MyData> treeSet6 = new TreeSet<>(descending);
        treeSet6.add(md1);
        treeSet6.add(md2);
        treeSet6.add(md3);
        System.out.println("문자열 길이 내림차순 (이름있는 구현클래스)");
        System.out.println(treeSet6);
        System.out.println();

        //4) 문자열 길이 내림차순 (익명 구현클래스)
        Comparator<MyData> descending2 = new Comparator<MyData>() {
            @Override
            public int compare(MyData o1, MyData o2) {
                return (o1.string.length() + "").compareTo(o2.string.length() + "") * -1;
            }
        };

        TreeSet<MyData> treeSet7 = new TreeSet<>(descending2);
        treeSet7.add(md1);
        treeSet7.add(md2);
        treeSet7.add(md3);
        System.out.println("문자열 길이 내림차순 (익명 구현클래스)");
        System.out.println(treeSet7);
        System.out.println();
    }
}
