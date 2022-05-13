public class ArrayTest5 {
    public static void main(String[] args) {
        //1차원배열에 디폴트값을 초기화하기
        int[] x = new int[]{1, 2, 3};
        //1차원배열 요소 출력하기
        for (int i = 0; i < x.length; i++) {
//            System.out.println("x[" + i + "]" + " =" + x[i]);
            System.out.printf("x[%d] = %d \n" ,i ,x[i]);
        }
//-----------------------------------------------------------------------------------------
        //2차원배열에 디폴트값을 주어 초기화하기
        int[][] y = new int[][]{ //[2][3]
                {1, 2, 3},
                {3, 4, 5},
        };
        //2차원배열 요소 출력하기
        for (int i = 0; i < y.length; i++) {
            for (int j = 0; j < y[i].length; j++) {
//                System.out.println("y[" + i + "]" + "[" + j + "]" + " = " + y[i][j]);
                System.out.printf("y[%d][%d] = %d \n" ,i ,j ,y[i][j]);
            }
        }
//-----------------------------------------------------------------------------------------
        //3차원배열에 디폴트값을 주어 초기화하기
        int[][][] u = new int[][][]{ //[2][3][1]
                {
                        {1}, {2}, {3}
                },
                {
                        {3}, {4}, {5}
                }
        };
        //3차원배열에 요소 출력하기
        for (int i = 0; i < u.length; i++) {
            for (int j = 0; j < u[i].length; j++) {
                for (int l = 0; l < u[i][j].length; l++) {
//                    System.out.println("y[" + i + "]" + "[" + j + "]" + "[" + l + "]" + " = " + u[i][j][l]);
                    System.out.printf("u[%d][%d][%d] = %d \n" ,i ,j ,l ,u[i][j][l]);
                }

            }
        }


//-----------------------------------------------------------------------------------------


    }
}
