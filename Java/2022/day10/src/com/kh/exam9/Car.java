package com.kh.exam9;

public class Car extends Vehicle {
    // 승용차의 배기량에 대한 객체 변수를 선언한다
    private double volume;

    // 승용차의 모델명, 가격과 배기량을 주어진 값으로 초기화하면서
    // 객체를 생성한다
    public Car(String model, int price, int volume) {
        super(model, price);
        this.volume = (double) volume;
    }

    // 승용차의 배기량을 반환한다
    public double getVolume() {
        return volume;
    }

    //승용차의 세금을 계산한다
    @Override
    public double calculateTex() {
        double tax = 0.0;
        if (volume >= 3000) {
            tax = getPrice() * 0.05;
        } else if (volume >= 1500) {
            tax = getPrice() * 0.03;
        } else {
            tax = getPrice() * 0.01;
        }
        return tax;
    }

    // 승용차의 모델명, 가격과 배기량을 반환한다
    @Override
    public String toString() {
        return super.toString() + "배기량 : " + volume;
    }

    // 승용차의 배기량을 주어진 값으로 변경한다
    public void setVolume(int volume) {
        this.volume = (double) volume;
    }
}