import java.util.Arrays;

//로또 예제 5 : 개선된 코드 (배열에 값을 넣기전에 중복 확인)

public class RandomExam5 {

    public static void main(String[] args) {
        int count = 0;
        int[] lotto = new int[6];
        boolean start = true;

        for (int i = 0; i < lotto.length; i++) {
            int num = (int) Math.floor(Math.random() * 45 + 1);
            count++;
            if (isExist(lotto, num)) {
                i--;
                continue;
            }
            lotto[i] = num;
        }

        System.out.println("반복 = "+count);
        System.out.println(Arrays.toString(lotto));
    }

    public static boolean isExist(int[] arr, int num) {
        boolean result = false;

        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == num) {
                result = true;
                break;
            }
        }
        return result;
    }
}
