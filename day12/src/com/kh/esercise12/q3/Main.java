package com.kh.esercise12.q3;

public class Main {
    public static void main(String[] args) {
        A a = new A() {
            @Override
            void abc() {
                System.out.println("반갑습니다.");
            }
        };
        a.abc();

        C e = () -> System.out.println("반갑습니다.");
        e.abc();

        A c = new B();
        c.abc();
    }
}
