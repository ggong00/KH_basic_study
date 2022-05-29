package com.kh.excercise14.q5;

public class A implements AutoCloseable {

    String res = "리소스 할당";

    @Override
    public void close() throws Exception {
        System.out.println("리소스 자동 해제");
    }
}
