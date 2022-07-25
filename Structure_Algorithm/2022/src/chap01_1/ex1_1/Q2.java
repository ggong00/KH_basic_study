package chap01_1.ex1_1;

//  세 값의 최솟값을 구하는 알고리즘

import java.util.Scanner;

public class Q2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int a = sc.nextInt();
        int b = sc.nextInt();
        int c = sc.nextInt();

        System.out.println(min3(a,b,c));
    }
    private static int min3(int a, int b, int c) {
        int min = a;
        if (b < min) min = b;
        if (c < min) min = c;

        return min;
    }
}
