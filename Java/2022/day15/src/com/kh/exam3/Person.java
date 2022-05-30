package com.kh.exam3;

import java.util.Objects;

public class Person {
    private String name;
    private int age;


    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        System.out.println("equals 호출됨");
        boolean flag = false;
        if (o instanceof Person) {
            Person p = (Person) o;
            if (this.name.equals(p.name)) {
                flag = true;
            }
        }
        return flag;
    }

    @Override
    public int hashCode() {
        System.out.println("해쉬코드 호출됨!");
        return Objects.hashCode(name);
    }

}
