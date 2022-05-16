import java.util.Arrays;

//  로또 예제 3 : 중복확인을 메서드로 따로 분리해서 뽑기 (중복 시 처음부터 다시 뽑음)
//               *중복이 많아질수록 반복 횟수가 증가해 효율 낮음

public class RandomExam3 {
    public static void main(String[] args) {
        int[] lotto = new int[6];
        boolean start = true;
        int count = 0;

        A:while (start) {
            //배열에 값 초기화
            for (int i = 0; i < lotto.length; i++) {
                count++;
                int num = (int) Math.floor(Math.random() * 45 + 1);
                lotto[i] = num;
                int place = i;
            }
            //배열에 값을 하나씩 뽑아서 중복이 있는지 체크
            for (int i = 0; i < lotto.length; i++) {
                int lotto1 = lotto[i];
                if (!isExist(lotto, lotto1)) {
                    continue A;
                }
            }
            start = false;
        }
        System.out.println("반복횟수 ="+count);
        System.out.println(Arrays.toString(lotto));
    }

    public static boolean isExist (int[] arr, int num) {
        int count =0;
        for (int i = 0; i < arr.length; i++) {
            int i1 = arr[i];
            if(i1 == num ) {
                count +=1;
            }
        }
        if(count > 1) return false;
        else return true;
    }
}
