public class Excercise4_5 {
    public static void main(String[] args) {
        for(int i =0; i<5; i++) {
            for(int j = 0; j<3; j++) {
                if(i==2) {
                    continue;
                }
                if(j == 1) {
                    break;
                }
                System.out.println("A");
            }
        }
    }
}
