package RockScissorsPaper;

import fight.Run;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        System.out.println("플레이 하고싶으시면 [Run]을 입력해주세요");
        Scanner sc = new Scanner(System.in);
            if (sc.nextLine().equals("Run")) {
                RunGame runGame = new RunGame();
                runGame.run();
            } else {
                System.out.println("잘못된 입력입니다.");
                System.out.close();
            }

    }
}
