package chap01_1.ex1_5;

//  입력한 정수값에 따라 A B C 출력 프로그램 (예본2)

import java.util.Scanner;

public class JudgeABC2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("정수를 입력하세요");
        int n = sc.nextInt();

        if (n == 1) {
            System.out.println("A");
        } else if (n == 2) {
            System.out.println("B");
        } else if (n == 3) {
            System.out.println("C"); //이 로직은 1 ,2 , 3 이외의 값에 대한 처리를 안함 즉 else 가 숨어있다.
        }

    }
}
