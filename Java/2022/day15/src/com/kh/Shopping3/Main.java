package com.kh.Shopping3;

import java.util.Comparator;

public class Main {
    public static void main(String[] args) {
        //이름 내림차순
        ShoppingBasket shoppingBasket = new ShoppingBasket();

        Product p1 = new Product("TV", 100);
        Product p2 = new Product("냉장고", 200);
        Product p3 = new Product("쇼파", 300);
        Product p4 = new Product("에어컨", 400);
        Product p5 = new Product("세탁기", 500);

        shoppingBasket.put(p1);
        shoppingBasket.put(p2);
        shoppingBasket.put(p3);
        shoppingBasket.put(p4);
        shoppingBasket.put(p5);
        shoppingBasket.list();

        //이름 내림차순
        Comparator<Product> c = new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                return o1.getName().compareTo(o2.getName()) * -1;
            }
        };

        ShoppingBasket shoppingBasket2 = new ShoppingBasket(c);

        shoppingBasket2.put(p1);
        shoppingBasket2.put(p2);
        shoppingBasket2.put(p3);
        shoppingBasket2.put(p4);
        shoppingBasket2.put(p5);
        shoppingBasket2.list();

        //가격 오름차순
        Comparator<Product> c2 = new Comparator<Product>() {
            @Override
            public int compare(Product p1, Product p2) {
                return (p1.getPrice() + "").compareTo((p2.getPrice()+""));
            }
        };

        ShoppingBasket shoppingBasket3 = new ShoppingBasket(c2);

        shoppingBasket3.put(p1);
        shoppingBasket3.put(p2);
        shoppingBasket3.put(p3);
        shoppingBasket3.put(p4);
        shoppingBasket3.put(p5);
        shoppingBasket3.list();

        //가격 내림차순

    }
}
