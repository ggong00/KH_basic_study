package com.kh.exam1;

import java.util.Scanner;

public class Student {
    // 객체 변수들
    private String name;      // 이름
    private int quizscore;      // 퀴즈 점수
    private int midtermscore;    // 중간시험 점수
    private int finalscore;      // 기말시험 점수
    private String grade;  //학점 등급

    // 생성자메소드: 학생의 이름을 넘겨 받아 객체를 생성한다
    public Student(String studentName) {
        this.name = studentName;
    }

    // 학생의 이름을 반환한다
    public String getName() {
        return name;
    }

    // 학생의 퀴즈 점수를 반환한다
    public int getQuizScore() {
        return this.quizscore;
    }

    // 학생의 중간시험 점수를 반환한다
    public int getMidtermScore() {
        return this.midtermscore;
    }

    // 학생의 기말시험 점수를 반환한다
    public int getFinalScore() {
        return this.finalscore;
    }

    //   현 Student 객체의 정보에 대한 문자열을 반환한다.
    @Override
    public String toString() {
        String str = "";
        str += "이름: " + getName() + "\n";
        str += "퀴즈점수: " + getQuizScore() + "\n";
        str += "중간점수: " + getMidtermScore() + "\n";
        str += "기말점수: " + getFinalScore() + "\n";
        return str;
    }

    // 이름을 주어진 값으로 변경한다
    public void setName(String Name) {
        name = Name;
    }

    // 퀴즈 점수를 주어진 값으로 변경한다
    public void setQuizScore(int QuizScore) {
        this.quizscore = QuizScore;
    }

    // 중간시험 점수를 주어진 값으로 변경한다
    public void setMidtermScore(int MidtermScore) {
        this.midtermscore = MidtermScore;
    }

    // 기말시험 점수를 주어진 값으로 변경한다
    public void setFinalScore(int FinalScore) {
        this.finalscore = FinalScore;
    }

    public String getGradle() {
        return grade;
    }

    // 사용자에게 학생의 퀴즈 점수, 중간시험 점수와 기말시험 점수를 읽어 들인다.
    // 입력 요청시 이름을 사용한다. 예를 들면, ‘길동의 중간시험 점수를 입력하라.’
    public void inputGrades() {
        Scanner sc = new Scanner(System.in);
        int clear = 0;
        do {
            int score = Integer.parseInt(sc.nextLine());
            System.out.println("점수범위는 0이상 100이하로 입력해야합니다.");
            System.out.println("점수를 입력해주세요 : ");
            if (isScoreRange(score) && clear == 0) {
                setQuizScore(score);
                clear++;
                continue;
            } else if (isScoreRange(score) && clear == 1) {
                setMidtermScore(score);
                clear++;
                continue;
            } else if (isScoreRange(score) && clear == 2) {
                setFinalScore(score);
                clear++;
                continue;
            } else {
                break;
            }
        }while (true);
    }

    // 학생의 시험 점수들의 총점을 계산하여 반환한다
    public double getTotal() {
        return (double) getFinalScore() + getMidtermScore() + getQuizScore();
    }

    public boolean isScoreRange(int number) {
        if (0 > number && number > 100) {
            return false;
        } else {
            return true;
        }
    }

    // 학생의 학점을 반환한다
    public void getGrade() {
        double tmp = getTotal() / 3;
        if (tmp >= 90) {
            grade = "A";
        } else if (tmp >= 80) {
            grade = "B";
        } else if (tmp >= 70) {
            grade = "C";
        } else if (tmp >= 60) {
            grade = "D";
        } else {
            grade = "F";
        }
    }


}