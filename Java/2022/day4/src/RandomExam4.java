import java.util.Arrays;

//로또 예제 4 : 중복확인을 메서드로 따로 분리해서 뽑기 (중복 시 하나를 다시 뽑음)

public class RandomExam4 {
    public static void main(String[] args) {
        int[] lotto = new int[6];
        boolean start = true;
        int count = 0;

        for (int i = 0; i < lotto.length; i++) {
            int num = (int) Math.floor(Math.random() * 45 + 1);
            lotto[i] = num;
            int place = i;
            count ++;
            //메소드를 통해 i번쨰 전 까지의 값 중 중복이 있는지 체크
            if (!isExist(lotto, place)) {
                i--;    //false 리턴 시 다시 뽑기
            }
        }
        System.out.println(count);
        System.out.println(Arrays.toString(lotto));
    }
    public static boolean isExist (int[] arr, int round) {
        int i1 = arr[round];
        for (int i = 0; i < round; i++) {
            if(i1 == arr[i]) {
                return false;
            }
        }
        return true;
    }
}
