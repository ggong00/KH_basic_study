import java.util.Scanner;

public class Gugudan {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.println(">> 구구단을 출력하는 프로그램 <<");
        while (true) {
            System.out.println("출력하고자하는 구구단을 입력하세요 [Q] : 종료");
            String input = sc.nextLine();

            if (input.equals("Q")) {
                System.out.println("종료");
                break;

            } else {
                int a = Integer.parseInt(input);
                for(int i =1; i<10; i++) {
                    System.out.println(a + "*" + i + "=" + (a*i));
                }

            }

        }
    }
}
