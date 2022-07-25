package chap01_1.ex1_1;

//  네 값의 최대값을 구하는 max4메서드를 작성하고 테스트하시오

import java.util.Scanner;

public class Q1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        int b = sc.nextInt();
        int c = sc.nextInt();
        int d = sc.nextInt();

        System.out.println("네 정수의 최대 값" + max4(a, b, c, d));

    }

    private static int max4(int a, int b, int c, int d) {
        int max = a;
        if (b > max) max = b;
        if (c > max) max = c;
        if (d > max) max = d;

        return max;
    }

}
