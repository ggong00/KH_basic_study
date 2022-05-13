public class ArrayTest4 {
    public static void main(String[] args) {
        int x = 10;
        System.out.println("x = " + x);

        int[] y = new int[2];
        System.out.println("y = " + y);
        System.out.println("y[0] = " + y[0]);
        System.out.println("y[1] = " + y[1]);

        int[][] z = new int[2][3];
        System.out.println("z = " + z);
        System.out.println("z.length = " + z.length);

        System.out.println("z[0] = " + z[0]);
        System.out.println("z[1] = " + z[1]);

        System.out.println("z[0].length = " + z[0].length);
        System.out.println("z[1].length = " + z[1].length);

        System.out.println("z[0][0] = " + z[0][0]);
        System.out.println("z[1][1] = " + z[0][1]);
        System.out.println("z[1][2] = " + z[0][2]);

        System.out.println("z[1][0] = " + z[1][0]);
        System.out.println("z[1][1] = " + z[1][1]);
        System.out.println("z[1][2] = " + z[1][2]);

        int[][][] k = new int[2][3][2];

        int[][][] l = new int[6][4][3];

        int[][] a = new int[3][];
        a[0] = new int[1];
        a[1] = new int[2];
        a[2] = new int[3];


    }
}
