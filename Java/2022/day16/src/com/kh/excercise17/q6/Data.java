package com.kh.excercise17.q6;

import java.util.Objects;

public class Data {
    String m;
    String n;



    public Data(String m, String n) {
        this.m = m;
        this.n = n;
    }

    public Data(String m) {
        this.m = m;
    }

    @Override
    public boolean equals(Object o) {
        if (o instanceof Data) {
            Data t = (Data) o;
            return this.m.equals(t.m) && this.n.equals(t.n);
        }
        return false;
    }

    @Override
    public String toString() {
        return "Data{" +
                "m=" + m +
                '}';
    }

    @Override
    public int hashCode() {
        return Objects.hash(m, n);
    }
}
