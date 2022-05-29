package com.kh.exam3;

public class Car {
    private int id; //자동차 식별번호
    private static int count;
    private String color;

    public Car(String color) {
        this.color = color;
        id = ++count;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return this.color;
    }

//    public static int getCount() {
//        return count;
//    }
//
}
