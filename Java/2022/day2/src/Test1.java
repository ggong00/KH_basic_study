public class Test1 {

    public static void method1() {
        System.out.println("method1 호출됨");
        method2();
    }

    public static void method2() {
        System.out.println("method2 호출됨");
        method2(); //재귀 호출
    }

    public static void method3() {
        System.out.println("method3 호출됨");

    }

    public static void main(String[] args) {
        System.out.println("hello~~");
        method1(); //메소드 호출

    }

}

