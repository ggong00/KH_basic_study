package com.kh.exam8;

// 실습과제 10.1: DogDriver.java
// Dog 클래스를 시험한다

import java.util.*;

public class DogDriver {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String shotAnswer;  // 예방주사 접종여부 입력값
        String dogName;        // 개 이름
        int dogAge;            // 개 나이
        String dogBreed;    // 개 품종
        boolean dogShot;    // 예방주사 접종여부

        // 개의 이름, 나이와 품종은 각각 기본 값으로 초기화하고
        // 예방주사 접종여부는 false로 초기화하면서 Dog 객체를 생성한다
        Dog dog1 = new Dog();

        // 개의 이름을 '하루'로 정한다
        dog1.setName("하루");

        // 개의 나이를 세 살로 한다
        dog1.setAge(3);

        // 개의 품종을 '진돗개'로 한다
        dog1.setBreed("진돗개");

        // 개의 예방주사 접종여부를 true로 한다
        dog1.setBoosterShot("예");

        // 개의 이름을 입력 받는다
        System.out.print("개의 이름을 입력하세요: ");
        dogName = scan.next();
        System.out.println();

        // 개의 나이를 입력 받는다
        System.out.print("개의 나이를 입력하세요: ");
        dogAge = scan.nextInt();

        // 개의 품종을 입력 받는다
        System.out.print("개의 품종을 입력하세요: ");
        dogBreed = scan.nextLine();

        // 입력 받은 개의 이름, 나이와 품종을 반영하여 Dog 객체를 생성한다
        Dog dog2 = new Dog(dogName, dogAge, dogBreed);

        // 개의 예방주사 접종여부를 ‘예’ 혹은 ‘아니오’로 입력 받는다
        System.out.print("예방주사를 맞았나요(예 혹은 아니오)?: ");
        shotAnswer = scan.nextLine();
        System.out.println();

        // 개의 예방주사 접종여부 입력 값에 따라
        // 예방주사 접종여부를 적절하게 정한다
        if(shotAnswer.equals("아니오")) {
            dog2.setBoosterShot(shotAnswer);
        } else if (shotAnswer.equals("예")) {
            dog2.setBoosterShot(shotAnswer);
        }
        System.out.println();
        System.out.println("[강아지 정보]");

        // 첫 번째 Dog 객체의 모든 데이터를 출력한다
        System.out.println(dog1);

        // 두 번째 Dog 객체의 모든 데이터를 출력한다
        System.out.println(dog2);

        System.out.println("===================================");

        // 두 살이 넘었으나 예방주사를 맞지 않는 개의 이름과 나이를 출력한다
        System.out.println("[2살 넘기고 예방접종을 맞지않은 강아지]");
        if(dog1.getAge() > 2 && dog1.isBoosterShot() == false) {
            System.out.println(dog1.PetToString());
        } else if (dog2.getAge() > 2 && dog2.isBoosterShot() == false) {
            System.out.println(dog2.PetToString());
        }

    }
}
