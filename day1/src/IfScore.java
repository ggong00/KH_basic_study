public class IfScore {
    public static void main(String[] args) {
        int score = 91;
        int firstNum = score/10;

        if(firstNum == 9 || firstNum == 10 ) {
            System.out.println("A학점");
        }else if(firstNum == 8 ) {
            System.out.println("B학점");
        }else if(firstNum == 7 ) {
            System.out.println("C학점");
        }else if(firstNum == 6 ) {
            System.out.println("D학점");
        }else {
            System.out.println("F학점");
        }

    }
}
