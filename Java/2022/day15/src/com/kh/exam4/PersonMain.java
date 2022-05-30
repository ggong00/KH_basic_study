package com.kh.exam4;

import java.util.Set;
import java.util.TreeSet;

public class PersonMain {
    public static void main(String[] args) {
        Person p1 = new Person("홍길동1", 20);
        Person p2 = new Person("홍길동2", 40);
        Person p3 = new Person("홍길동3", 30);
        Person p4 = new Person("홍길동4", 10);

        Set<Person> treeSet = new TreeSet<>();

        treeSet.add(p1);
        treeSet.add(p2);
        treeSet.add(p3);
        treeSet.add(p4);
        System.out.println(treeSet);

        Set<Person> treeSet2 = new TreeSet<>((Person o1, Person o2) -> {
            int result = 0;
            if (o1.getAge() < o2.getAge()) {
                result = 1;
            } else if (o1.getAge() > o2.getAge()) {
                result = -1;
            }
            return result;
        }
        );

        treeSet2.add(p1);
        treeSet2.add(p2);
        treeSet2.add(p3);
        treeSet2.add(p4);
        System.out.println(treeSet2);
    }
}
