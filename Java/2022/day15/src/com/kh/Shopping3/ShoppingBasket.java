package com.kh.Shopping3;

import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;

public class ShoppingBasket {
    private Set<Product> set;

    public ShoppingBasket() {
        this.set = new TreeSet<>();
    }

    public ShoppingBasket(Comparator c) {
        this.set = new TreeSet<>(c);
    }

    public void put(Product product) {
        this.set.add(product);
    }

    public void list() {
        System.out.println(set);
    }
}


