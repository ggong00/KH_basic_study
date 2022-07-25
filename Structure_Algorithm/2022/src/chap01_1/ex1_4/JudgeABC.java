package chap01_1.ex1_4;

//  입력한 정수값에 따라 A B C 출력 프로그램 (예본1)

import java.util.Scanner;

public class JudgeABC {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("정수를 입력하세요");
        int n = sc.nextInt();

        if (n == 1) {
            System.out.println("A");
        } else if (n == 2) {
            System.out.println("B");
        } else {
            System.out.println("C");
        }

    }
}
