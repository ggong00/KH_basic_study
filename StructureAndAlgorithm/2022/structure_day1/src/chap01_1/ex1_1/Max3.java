package chap01_1.ex1_1;

//  3개의 정숫값을 입력하고 최대값을 구하여 출력

import java.util.Scanner;

public class Max3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("세 정수의 최대값을 구합니다");
        System.out.println("a의 값"); int a = sc.nextInt();
        System.out.println("b의 값"); int b = sc.nextInt();
        System.out.println("c의 값"); int c = sc.nextInt();
        int max = a;
        if(b > max)
            max = b;
        if(c > max)
            max = c;
        System.out.println("세 정수의 최대값은" + max + "입니다.");
    }
}
