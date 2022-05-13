import java.util.Scanner;

public class HackJum4 {
    public static void main(String[] args) {
        System.out.println(" << 3개의 과목을 입력받아 총점/평균 구하는 프로그램 >>");

        int kor = inputValue("국어");
        int eng = inputValue("영어");
        int math = inputValue("수학");

        int sum = 0;
        double average = 0;

        sum = getSum(kor , eng , math);
        average = getAverage(sum);

        System.out.println("총점 = " + sum);
        System.out.println("평균 = " + average);

    }

    public static int inputValue(String title) {
        System.out.println(title + " 점수 >>");
        Scanner sc = new Scanner(System.in);
        int score = Integer.parseInt(sc.nextLine());

        return score;
    }


    public static int getSum(int korean, int english, int math) {

        return korean + english + math;

    }

    public static double getAverage(int sum) {

        return (double)sum/3;
    }
}
