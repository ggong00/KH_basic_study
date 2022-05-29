public class HackJum {
    public static void main(String[] args) {
/*
        int[] subject = new int[3];


        subject[0] = 82; //국어점수
        subject[1] = 73; //국어점수
        subject[2] = 65; //국어점수
*/


        int[] subject = {80, 90, 100, 70};

        int sum = 0;
        double average = 0.0;


        //총점
        for (int i = 0; i < subject.length; i++) {
            sum += subject[i];
        }

        //평균
        average = (double) sum / subject.length;

        System.out.println("총점=" + sum);
        System.out.println("평균=" + average);
    }
}
