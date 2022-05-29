package RockScissorsPaper;


import java.util.Random;
import java.util.Scanner;

public class RunGame {

    int winCount = 0;

    public void run () {
        boolean start = true;

        while (start) {

            System.out.println("[가위] = 0 [바위] = 1 [보] = 2 [그만두기] = 9 ");
            System.out.println("숫자를 입력해주세요");
            Scanner scanner = new Scanner(System.in);
            String sc = scanner.nextLine();
            Random ran = new Random();
            String other = ran.nextInt(3) + "";

            if (sc.equals("0")) {
                if (other.equals("2")) {
                    System.out.println("상대방이 [보]를 냈습니다");
                    System.out.println("승리");
                    winCount += 1;
                    System.out.println("당신은 " + winCount + "연승 했습니다.");
                } else if (other.equals("1")) {
                    System.out.println("상대방이 [주먹]을 냈습니다");
                    System.out.println("패배");
                    winCount = 0;
                } else if (other.equals("0")) {
                    System.out.println("상대방이 [가위]를 냈습니다");
                    System.out.println("무승부");
                    winCount = 0;
                }

            } else if (sc.equals("1")) {
                if (other.equals("2")) {
                    System.out.println("상대방이 [보]를 냈습니다");
                    System.out.println("패배");
                    winCount = 0;
                } else if (other.equals("1")) {
                    System.out.println("상대방이 [주먹]을 냈습니다");
                    System.out.println("무승부");
                    winCount = 0;
                } else if (other.equals("0")) {
                    System.out.println("상대방이 [가위]를 냈습니다");
                    System.out.println("승리");
                    winCount += 1;
                    System.out.println("당신은 " + winCount + "연승 했습니다.");
                }

            } else if (sc.equals("2")) {
                if (other.equals("2")) {
                    System.out.println("상대방이 [보]를 냈습니다");
                    System.out.println("무승부");
                    winCount = 0;
                } else if (other.equals("1")) {
                    System.out.println("상대방이 [주먹]을 냈습니다");
                    System.out.println("승리");
                    winCount += 1;
                    System.out.println("당신은 " + winCount + "연승 했습니다.");
                } else if (other.equals("0")) {
                    System.out.println("상대방이 [가위]를 냈습니다");
                    System.out.println("패배");
                    winCount = 0;
                }

            } else if (sc.equals("9")) {
                System.out.println("프로그램이 종료됩니다.");
                start = false;
            } else {
                System.out.println("잘못된 입력입니다.");
            }
            System.out.println("------------------------------------------------------------");
        }
    }


}
