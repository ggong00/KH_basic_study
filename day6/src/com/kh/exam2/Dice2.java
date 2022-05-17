package com.kh.exam2;

public class Dice2 {
    private int num;

    public int getNum() {
        return this.num;
    }

    public void throwDice() {
        this.num = (int) Math.floor(Math.random()*6 +1);
    }

}
