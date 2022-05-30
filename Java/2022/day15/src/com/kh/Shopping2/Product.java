package com.kh.Shopping2;

public class Product implements Comparable<Product>{
    private String name;
    private int price;

    public Product(String name, int price) {
        this.name = name;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "이름 = " + name + "\n"
                + "가격 = " + price + "\n";
    }

    @Override
    public int compareTo(Product o) {
        if (this.name.hashCode() > o.name.hashCode()) {
            return -1;
        } else if (this.name.hashCode() < o.name.hashCode()) {
            return 1;
        }
        return 0;
    }


}
