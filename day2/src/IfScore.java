import java.util.Scanner;

public class IfScore {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.println("정수를 입력하세요 :");
        int score = sc.nextInt(); //키보드로 부터 정수 값을 읽어 온다.


        if(score < 0 || score > 100) {
            System.out.println("점수입력 오류(0~100범위의 값만 유효합니다.)");
            return; //메소드 실행을 중지하고 빠져나온다.
        }


        if(score >= 90 && score <= 100) {
            System.out.println("A학점");

        }else if (score >= 80 && score < 90){
            System.out.println("B학점");

        } else if (score >= 70 && score < 80) {
            System.out.println("C학점");

        } else if (score >= 60 && score < 70) {
            System.out.println("D학점");

        } else {
            System.out.println("F학점");
        }

    }
}
