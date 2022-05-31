package com.kh.excercise17.q7;

import java.util.Objects;

public class MyData implements Comparable<MyData>{
    String string;

    public MyData(String string) {
        this.string = string;
    }

    @Override
    public int compareTo(MyData o) {

        return this.string.compareTo(o.string);
    }

    @Override
    public String toString() {
        return string;
    }
}
