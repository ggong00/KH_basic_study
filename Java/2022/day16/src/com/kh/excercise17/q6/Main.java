package com.kh.excercise17.q6;

import java.util.HashSet;
import java.util.Set;

public class Main {
    public static void main(String[] args) {
        Set<Data> set = new HashSet<>();
        set.add(new Data("2" , "5"));
        set.add(new Data("2" , "5"));
        set.add(new Data("3" , "8"));

        System.out.println(set.size());
    }
}
