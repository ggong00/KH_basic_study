package com.kh.Shopping;

import com.kh.exam4.Person;

import java.util.Comparator;
import java.util.TreeSet;

public class Main {
    public static void main(String[] args) {
        Product[] p = new Product[5];
        //상품 생성
        p[0] = new Product("가상품", 1000);
        p[1] = new Product("다상품", 2500);
        p[2] = new Product("나상품", 5000);
        p[3] = new Product("라상품", 8500);
        p[4] = new Product("마상품", 1500);

        //장바구니 생성
        ShoppingBasket shoppingBasket1 = new ShoppingBasket(new TreeSet<>());

        //가격내림차순으로 정렬하기 (Comparable 구현)
        shoppingBasket1.addShoppingBasket(p[0]);
        shoppingBasket1.addShoppingBasket(p[1]);
        shoppingBasket1.addShoppingBasket(p[2]);
        shoppingBasket1.addShoppingBasket(p[3]);
        shoppingBasket1.addShoppingBasket(p[4]);

        shoppingBasket1.listShoppingBasket();
        System.out.println("======================");

        //Comparator 익명클래스
        Comparator a = new Comparator<Product>() {
            @Override
            public int compare(Product p1, Product p2) {
                Integer a = p1.getPrice();
                Integer b = p2.getPrice();
                return a.compareTo(b);
            }
        };

        //Comparator 형식으로 TreeSet 변경
        shoppingBasket1.setComparator(p , a);

        //가격오름차순으로 정렬하기(Comparator 구현)
        shoppingBasket1.listShoppingBasket();
        System.out.println("======================");
    }
}
