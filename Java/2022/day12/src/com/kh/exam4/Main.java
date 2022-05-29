package com.kh.exam4;

public class Main {
    public static void main(String[] args) {
        HomeAppliances homeAppliances1 = new AirConditioner();
        HomeAppliances homeAppliances2 = new Radio();

        homeAppliances1.listenVoice();
        homeAppliances2.listenVoice();

        HomeAppliances.doInter();
    }
}
