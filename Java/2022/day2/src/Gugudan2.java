import java.util.Scanner;

public class Gugudan2 {
    public static void main(String[] args) {

        boolean stop = false;



        Scanner sc = new Scanner(System.in);
        System.out.println(">> 구구단을 출력하는 프로그램 <<");
        while (!stop) {
            System.out.println("출력하고자하는 구구단을 입력하세요 [Q] : 종료");
            String input = sc.nextLine();

            if (input.equals("Q")) {
                System.out.println("종료");
                stop = true;

            } else {
                int gugudan = Integer.parseInt(input);
                for(int i =1; i<10; i++) {
                    System.out.println(gugudan + "*" + i + "=" + (gugudan*i));
                }

            }

        }
    }
}
