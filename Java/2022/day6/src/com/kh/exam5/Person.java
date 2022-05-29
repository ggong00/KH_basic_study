package com.kh.exam5;

import java.lang.*;

public class Person {
    //      속성(필드)
    private String name;    //이름
    private int age;        //나이
    private String gender;  //성별

    //      생성자 디폴트
    public Person() {
        super();    //상위개념의 디폴트 생성자 호출
    }

    //      셍상자 오버로딩
    public Person(String name, int age, String gender) {
        this.name = name;
        this.age = age;
        this.gender = gender;
    }

    //행위(메소드)
    public void eat() {
        System.out.println(getName() + "이 먹는다");
    }

    public void smile() {
        System.out.println(getName() + "이 웃는다");
    }

    //용도 : 현재 인스턴스의 상태를 문자열로 표현.
    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", gender='" + gender + '\'' +
                '}';
    }

    //          getter and setter
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
