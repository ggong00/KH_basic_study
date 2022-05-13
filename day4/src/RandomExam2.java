import java.util.Arrays;

public class RandomExam2 {
    public static void main(String[] args) {
        int[] lotto = new int[6];

        for (int i = 0; i < lotto.length; i++) {
            int num = (int) Math.floor(Math.random()*45+1);
            lotto[i] = num;
            for (int j = 0; j < i; j++) {
                if(lotto[i] == lotto[j]) {
                    i--;
                }
            }
        }
        System.out.println(Arrays.toString(lotto));

    }
}
