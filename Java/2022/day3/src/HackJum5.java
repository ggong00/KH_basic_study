import java.util.Scanner;

public class HackJum5 {
    public static void main(String[] args) {

        System.out.println(" << 3개의 과목을 입력받아 총점/평균 구하는 프로그램 >>");

        boolean stop = false;

        while (!stop) {

            int kor = inputValue("국어");
            if(kor == -1) {
                stop = true;
                continue;
            }
            int eng = inputValue("영어");
            if(kor == -1) {
                stop = true;
                continue;
            }
            int math = inputValue("수학");
            if(kor == -1) {
                stop = true;
                continue;
            }

            int sum = 0;
            double average = 0;

            sum = getSum(kor, eng, math);
            average = getAverage(sum);

            System.out.println("총점 = " + sum);
            System.out.println("평균 = " + average);

        }
    }
    public static int inputValue(String title) {
        System.out.println(title + " 점수 >>");
        Scanner sc = new Scanner(System.in);
        String input = sc.nextLine();
        int score = 0;

        if(input.equals("Q") || input.equals("q")) {
            score = -1;
        }else {
            score = Integer.parseInt(input);
        }
        return score;
    }


    public static int getSum(int korean, int english, int math) {

        return korean + english + math;

    }

    public static double getAverage(int sum) {

        return (double)sum/3;
    }
}
