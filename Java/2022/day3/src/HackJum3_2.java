import java.util.Scanner;
//3개의 과목을 입력받아 총점과 평균을 구하는 프로그램 [예시]

public class HackJum3_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println(" << 3개의 과목을 입력받아 총점/평균 구하는 프로그램 >>");
        System.out.println("국어 점수 >> ");
        String input = sc.nextLine();
        int kor = Integer.parseInt(input);

        System.out.println("영어 점수 >> ");
        String input2 = sc.nextLine();
        int eng = Integer.parseInt(input2);

        System.out.println("수학 점수 >> ");
        String input3 = sc.nextLine();
        int math = Integer.parseInt(input3);

        int sum = 0;
        double average = 0;

        sum = getSum(kor , eng , math);
        average = getAverage(sum);

        System.out.println("총점 = " + sum);
        System.out.println("평균 = " + average);

    }

    public static int getSum(int korean, int english, int math) {

        return korean + english + math;

    }

    public static double getAverage(int sum) {

        return (double)sum/3;
    }
}
