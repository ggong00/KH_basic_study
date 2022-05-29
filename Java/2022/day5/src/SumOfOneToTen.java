public class SumOfOneToTen {
    public static void main(String[] args) {
        int num = 100;
        System.out.println("[for문] 1~100합 = "+ sumByFor(num));
        System.out.println("[while] 1~100합 = "+ sumByWhile(num));
        System.out.println("[do while] 1~100합 = "+ sumByDoWhile(num));
        System.out.println("[수학공식] 1~100합 = "+ num*(num+1)/2);
    }

    //for문 활용
    public static int sumByFor(int num) {
        int sum = 0;
        for (int i = 0; i <= num; i++) {
             sum += i;
        }
        return sum;
    }
    //while문 활용
    public static int sumByWhile(int num) {
        int sum = 0;
        int i = 0;
        while (i <= num) {
            sum += i;
            i++;
        }
        return sum;
    }
    //do while문 활용
    public static int sumByDoWhile(int num) {
        int sum = 0;
        int i = 0;
        do {
            sum += i;
            i++;
        }
        while (i <= num);
        return sum;
    }

}
