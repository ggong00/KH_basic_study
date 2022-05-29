import java.util.Arrays;

public class MaxValue {

    public static void main(String[] args) {

        int x = 5;
        int y = 7;
        int z = 4;


        /*int maxValue;

        if(x>y && x>z) {
            maxValue = x;
        }else if(y>z) {
            maxValue = y;
        }else {
            maxValue = z;
        }
        */

        int maxValue = x;

        if(maxValue<y) {
            maxValue = y;
        }
        if(maxValue<z) {
            maxValue = z;
        }

        System.out.println("최대값출력");
        System.out.println(maxValue);


    }
}
