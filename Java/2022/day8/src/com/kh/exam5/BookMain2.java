package com.kh.exam5;

public class BookMain2 {
    public static void main(String[] args) {
        Book[] books = new Book[5];

        books[0] = new Book("책제목1");
        books[1] = new Book("책제목2");
        books[2] = new Book("책제목3");
        books[3] = new Book("책제목4");
        books[4] = new Book("책제목5");

        //1) 책 제목으로 책 검색하기
        Book finedBook = searchBook(books, "책제목3");
        System.out.println(finedBook);

        //2) 책 제목으로 책 제거하기
    }
    // 책 제목을 입력받아 책을 반환하는 메소드 정의
    public static Book searchBook(Book[] book, String title) {
        for (Book book1 : book) {
            if(book1 == null) {
                continue;
            }else if (book1.getTitle().equals(title)) {
                return book1;
            }
        }
        return null;
    }


}
