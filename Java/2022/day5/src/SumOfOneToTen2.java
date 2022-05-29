public class SumOfOneToTen2 {
    public static void main(String[] args) {
        int num = 100;
        System.out.println("[while] 1~100합 = "+ sumByWhile(num));
        System.out.println("[do while] 1~100합 = "+ sumByDoWhile(num));
    }

    //while문 활용
    public static int sumByWhile(int num) {
        int sum = 0;
        int i = 0;
        boolean stop = false;
        while (!stop) {
            sum += i;
            if(i >= num) {
                stop = true;
                continue;
            }
            i++;
        }
        return sum;
    }
    //do while문 활용
    public static int sumByDoWhile(int num) {
        int sum = 0;
        int i = 0;
        boolean stop = false;
        do {
            sum += i;
            if(i >= num) {
                stop = true;
                continue;
            }
            i++;
        }
        while (!stop);
        return sum;
    }

}
