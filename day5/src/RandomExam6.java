import java.util.Arrays;

//로또 예제 6 : while문 사용

public class RandomExam6 {
    public static void main(String[] args) {
        Util util = new Util();
        int count = 0;  //for문 반복횟수 카운트
        int[] lotto = new int[6];
        boolean start = true;

        int i = 0;

        while (start) {
            int num = (int) Math.floor(Math.random() * 45 + 1);
            count++;
            //동일 번호가 존재하면 실행
            if (util.isExist(lotto, num)) {
                i--;
                continue;
            }
            //중복 없으면 배열에 값 추가
            lotto[i] = num;
            i++;
            if (i == 6) {
                start = false;

            }
        }
        for (int j = 0; j < lotto.length; j++) {
            Util.printLine('_', 3);
            int lotto1 = lotto[j];
            System.out.println(lotto1);
        }

//        System.out.println("반복 = "+count);
//        System.out.println(Arrays.toString(lotto));


    }
}
