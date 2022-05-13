import java.lang.reflect.Array;
import java.util.Arrays;

public class ArrayTest8 {
    public static void main(String[] args) {
        
        int[] x = new int[]{1,2,3};

        int i;
        for (i = 0; i < x.length; i++) {
            System.out.println(x[i]);
        }
        System.out.println(Arrays.toString(x));

        double[] a = new double[]{1.2,3.4,5.6};
        double[] b = a;

        b[0] = 7.8;

        System.out.println(Arrays.toString(a));
        System.out.println(Arrays.toString(b));

        int[] c = new int[]{1,2,3,4,5};

        for (int k : c ) {
            System.out.println(k);
        }

    }
}
