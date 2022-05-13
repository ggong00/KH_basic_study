//함수를 이용하여 3개의 과목 총합과 평균을 구하는 프로그램
public class HackJum2 {
    public static void main(String[] args) {
        int korean = 80;
        int english = 95;
        int math = 43;

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
