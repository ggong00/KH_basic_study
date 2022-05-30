package com.kh.Shopping2;

import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;

public class ShoppingBasket {
    private Set<Product> set;

    public ShoppingBasket(TreeSet<Product> treeSet) {
        this.set = treeSet;
    }

    public void addShoppingBasket (Product p) {
        set.add(p);
    }

    public void listShoppingBasket() {
        System.out.println(set);
    }

    public void setComparator(Product[] p , Comparator c) {
        TreeSet<Product> tmp = new TreeSet<>(c);
        for (Product product : p) {
            tmp.add(product);
        }
        this.set = tmp;
    }

}
