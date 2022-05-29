package com.kh.excercise14.q6;

public class A {
    void abc() throws InterruptedException, ClassNotFoundException{
        bcd();
    }

    void bcd() throws InterruptedException, ClassNotFoundException{
        Thread.sleep(1000);
        Class.forName("java.lang.Object");

    }
}
