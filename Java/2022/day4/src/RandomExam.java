import java.util.Arrays;

/*
    Math.random() : 0<= ? < 1 사이의 랜덤한 실수 발생

*/
public class RandomExam {
    public static void main(String[] args) {
        int[] lotto = new int[6];

        boolean stop = false;
        int n = 0;

        //중복 없을때까지 반복
        while (!stop) {
            //첫 번째 로또번호 초기화
            for (int i = 0; i < 6; i++) {
                int num = (int) (Math.floor(Math.random() * 45) + 1);
                lotto[i] = num;
            }
            //중복 있는지 확인
            for (int j = 0; j < lotto.length; j++) {
                int k = lotto[j];
                for(int y = j+1; y<lotto.length; y++) {
                    if (k == lotto[y]) {
                        n +=1; //중복이면 n변수에 1을 더함
                    }
                }
            }
            //n이 0이면 번호 출력
            if (n == 0) {
                stop = true;
                System.out.println(Arrays.toString(lotto));
            }else { //만약 n이 0이아니면 다시 반복
                n = 0;
            }
        }
    }
}
