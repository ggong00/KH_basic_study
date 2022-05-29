package com.kh.exam5;

public class PersonMain {
    public static void main(String[] args) {
        Person person1 = new Person("홍길동", 23, "남자");

        person1.eat();
        person1.smile();
        System.out.println(person1);
    }
}
