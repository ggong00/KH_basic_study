public class WhileExam {
    public static void main(String[] args) {
//------------------------------------------------------------------
        int sum= 0;

        for(int i =1; i<=10; i++) {
            sum += i; //sum = sum+i;
        }

        System.out.println("1~10까지의 합 = " + sum);
//------------------------------------------------------------------
        int sum2 = 0;
        int j = 1;

        while (j<=10) {
            sum2 += j;  //sum = sum + j
            j++;    //j = j + 1
        }

        System.out.println("1~10까지의 합 = " + sum2);
//------------------------------------------------------------------
        int sum3 = 0;
        int k = 0;

        do {
            sum3 += k;
            k++;
        }while (k<=10);

        System.out.println("1~10까지의 합 = " + sum3);
//------------------------------------------------------------------
    }
}
