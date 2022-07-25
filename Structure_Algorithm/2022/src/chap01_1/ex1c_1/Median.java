package chap01_1.ex1c_1;

import java.util.Scanner;

//  세 정수값의 중앙 값 출력

public class Median {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int a = sc.nextInt();
        int b = sc.nextInt();
        int c = sc.nextInt();

        System.out.println(med(a, b, c));
    }

    private static int med(int a, int b, int c) {
        if (a >= b) {
            if (b >= c) {
                return b;
            } else if (a <= c) {
                return a;
            } else {
                return c;
            }
        } else if (a >= c) {
            return a;
        } else if (c >= b) {
            return b;
        } else {
            return c;
        }
    }
}
