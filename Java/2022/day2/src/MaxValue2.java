import java.util.Scanner;

public class MaxValue2 {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("<< 3개의 정수값을 입력받아 최대값 구하기 >>");
        System.out.println("정수1 :");
        int x = Integer.parseInt(sc.nextLine());
        System.out.println("정수2 :");
        int y = Integer.parseInt(sc.nextLine());
        System.out.println("정수3 :");
        int z = Integer.parseInt(sc.nextLine());

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
