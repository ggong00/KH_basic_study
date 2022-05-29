public class HackJum1 {
    //3개 과목의 총점/평균을 구하는 프로그램
    public static void main(String[] args) {
        int korean = 80;
        int english = 95;
        int math = 42;

        int sum = korean + english + math;
        double average =(double)sum/3;

        System.out.println("총점 = " + sum);
        System.out.println("평균 = " + average);

//        System.out.printf("평균 = %.2f" , average);


    }

}
