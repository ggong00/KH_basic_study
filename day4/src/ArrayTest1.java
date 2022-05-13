
//  배열: 하나의 변수로 여러개의 값을 메모리 연속공간에 저장할수 있는 자료구조
//  배열요소 : 배열에 저장된 값 하나하나를 뜻함.
//  배열요소접근 방법 : 배열변수이름[인덱스]
//  배열선언 : int[] 변수이름 = new int[3]
//  배열생성 : 변수이름 = new int {요소의 크기}

public class ArrayTest1 {
    public static void main(String[] args) {

        //초기값 0
        int[] subject; // 배열선언
        subject = new int[3]; //배열생성

        System.out.println(subject[0]);
        System.out.println(subject[1]);
        System.out.println(subject[2]);

        //초기값 0.0
        double[] subject2; //배열선언
        subject2 = new double[3]; //배열생성

        System.out.println(subject2[0]);
        System.out.println(subject2[1]);
        System.out.println(subject2[2]);

        //초기값 false
        boolean[] subject3; //배열선언
        subject3 = new boolean[3]; //배열생성

        System.out.println(subject3[0]);
        System.out.println(subject3[1]);
        System.out.println(subject3[2]);

        //초기값 공백
        char[] subject4; //배열선언
        subject4 = new char[3]; //배열생성

        System.out.println(subject4[0]);
        System.out.println(subject4[1]);
        System.out.println(subject4[2]);

        //초기값 null
        String[] subject5;  //배열선언
        subject5 = new String[3]; //배열생성

        System.out.println(subject5[0]);
        System.out.println(subject5[1]);
        System.out.println(subject5[2]);
    }

}
