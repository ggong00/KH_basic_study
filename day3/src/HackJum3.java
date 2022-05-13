import java.util.Scanner;

//3개의 과목을 입력받아 총점과 평균을 구하는 프로그램 [개인]
public class HackJum3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("국어점수를 입력하세요");
        int korean = sc.nextInt();
        System.out.println("영어점수를 입력하세요");
        int english = sc.nextInt();
        System.out.println("수학점수를 입력하세요");
        int math = sc.nextInt();

        int sum = getSum(korean, english, math);
        double average = getAverage(sum);

        System.out.println("총점 = " + sum);
        System.out.println("평균 = " + average);

//        System.out.printf("평균 = %.2f" , average);

    }

    public static int getSum(int korean, int english, int math) {

        return korean + english + math;

    }

    public static double getAverage(int sum) {

        return (double)sum/3;
    }

}
