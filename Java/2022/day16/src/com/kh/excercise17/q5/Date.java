package com.kh.excercise17.q5;

public class Date {
    int m;

    public Date(int m) {
        this.m = m;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Date) {
            Date t = (Date) obj;
            return this.m == t.m;
        }
        return false;
    }
}
