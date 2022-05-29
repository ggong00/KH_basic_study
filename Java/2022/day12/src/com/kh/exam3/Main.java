package com.kh.exam3;

public class Main {
    public static void main(String[] args) {
        System.out.println(HomeAppliances.voltage);

        HomeAppliances homeAppliances = new Radio();
        homeAppliances.on();
        homeAppliances.off();
        Radio radio = (Radio) homeAppliances;
        radio.matchChannel();

        //익명 클래스(인터페이스 구현 or 클래스 상속)
        //목적 : 1회성 인스턴스 만들고 버림

        //case1) : 인터페이스 구현을 통한 익명클래스
        HomeAppliances h1 = new HomeAppliances() {
            @Override
            public void on() {
                System.out.println("켜다");
            }

            @Override
            public void off() {
                System.out.println("끄다");
            }
        };

        h1.on();
        h1.off();

        //case2) : 클래스 상속을 통한 익명클래스
        Radio r1 = new Radio() {
            //주파수 맞추다
            @Override
            public void matchChannel() {
                listener();
                System.out.println("음성으로 주파수를 맞추다");
            }

            //음성인식
            public void listener() {
                System.out.println("음성을 인식하다");
            }

        };

        r1.on();
        r1.off();
        r1.matchChannel();

    }
}
