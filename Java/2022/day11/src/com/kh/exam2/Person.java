package com.kh.exam2;

public class Person {
    private int age;

    public Person(int age) {
        this.age = age;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Person) {
            Person tmp = (Person) obj;
            return this.age == tmp.age;
        }
        return false;
    }


}