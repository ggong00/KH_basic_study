public class SwitchExam {
    public static void main(String[] args) {
        int num = 3;

        //switch문에서 case문을 실행 후 break문장을 만날떄까지 순차적으로 실행된다.
        switch (num % 2) {
            case 1 :
                System.out.println("홀수");
                break; //switch문에서 break문을만나면 switch문을 빠져나온다.
            case 0 :
                System.out.println("짝수");
                break;
        }
    }
}
