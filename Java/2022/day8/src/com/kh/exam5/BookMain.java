package com.kh.exam5;

import java.util.Arrays;

public class BookMain {
    public static void main(String[] args) {
        Book[] books = new Book[5];

        books[0] = new Book("가");
        books[1] = new Book("나");
        books[2] = new Book("다");
        books[3] = new Book("라");
        books[4] = new Book();

        books[3] = null;

        System.out.println(Arrays.toString(books));

        for (int i = 0; i < books.length; i++) {
            if(books[i] == null) {
                books[i] = new Book();
            }
        }
        System.out.println(Arrays.toString(books));

        boolean isFull = true;
        int count = 0;

        //책장에 책을 꽃을 장소가 있는지 체크
        for (int i = 0; i < books.length; i++) {
            if(books[i] != null) {
                isFull = false;
                break;
            }
        }

        for (int i = 0; i < books.length; i++) {
            if (books[i] == null) {
                count++;
            }
        }


        //책을 꽂을 장소가 없으면 "책 꽂을 장소가 부족함" 출력
        //          있으면 여유공간 출력
        if (isFull) {
            System.out.println("책 꽂을 장소가 부족함");
        } else {
            //여유공간 출력
            System.out.println("여유공간 =" + count);
        }
    }
}
