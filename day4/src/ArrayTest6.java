import java.util.Scanner;

public class ArrayTest6 {
    public static void main(String[] args) {
        int[][] x = new int[2][];

//        x[0] = new int[]{1,2};
//        x[1] = new int[]{3, 4, 5};

        x[0] = new int[2];
        x[0][0] = 1;
        x[0][1] = 2;

        x[1] = new int[3];
        x[1][0] = 1;
        x[1][1] = 2;

        for (int i = 0; i < x.length; i++) {
            for (int j = 0; j < x[i].length; j++) {
                System.out.printf("x[%d][%d] = %d \n", i, j, x[i][j]);
            }
        }

        int[][][] y = new int[3][][];

        int[][][] z = new int[3][2][];

    }
}