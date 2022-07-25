package chap02_01;

import java.util.Arrays;
import java.util.Scanner;

//  배열을 역순으로 정렬하는 알고리즘

public class ReverseArray {

    static void reverse(int [] arr) {
        for (int i = 0; i < arr.length / 2; i++) {
            int k = arr.length - 1 - i;
            int t = arr[i];
            arr[i] = arr[k];
            arr[k] = t;
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] x = new int[n];

        for (int i = 0; i < x.length; i++) {
            System.out.println("값 입력 : ");
            x[i] = sc.nextInt();
        }

        reverse(x);

        System.out.println(Arrays.toString(x));
    }
}
