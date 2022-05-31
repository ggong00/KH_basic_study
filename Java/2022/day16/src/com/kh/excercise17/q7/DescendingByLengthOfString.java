package com.kh.excercise17.q7;

import java.util.Comparator;

public class DescendingByLengthOfString implements Comparator<MyData> {
    @Override
    public int compare(MyData o1, MyData o2) {
        return (o1.string.length() + "").compareTo(o2.string.length() + "") * -1;
    }
}
