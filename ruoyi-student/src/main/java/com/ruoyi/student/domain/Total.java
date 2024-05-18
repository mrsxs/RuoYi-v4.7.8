package com.ruoyi.student.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

public class Total extends BaseEntity {
  @Excel(name = "学号")
  private Long studentNo;
  @Excel(name = "姓名")
  private String studentName;
  //习题成绩
  @Excel(name = "习题成绩")
  private long exerciseScore;
  //考试成绩
  @Excel(name = "考试成绩")
  private long examScore;
  //测验成绩
  @Excel(name = "测验成绩")
  private long testScore;
  //总成绩
  @Excel(name = "总成绩")
  private long totalScore;

  public Long getStudentNo() {
    return studentNo;
  }

  public void setStudentNo(Long studentNo) {
    this.studentNo = studentNo;
  }

  public String getStudentName() {
    return studentName;
  }

  public void setStudentName(String studentName) {
    this.studentName = studentName;
  }

  public long getExerciseScore() {
    return exerciseScore;
  }

  public void setExerciseScore(long exerciseScore) {
    this.exerciseScore = exerciseScore;
  }

  public long getExamScore() {
    return examScore;
  }

  public void setExamScore(long examScore) {
    this.examScore = examScore;
  }

  public long getTestScore() {
    return testScore;
  }

  public void setTestScore(long testScore) {
    this.testScore = testScore;
  }

  public long getTotalScore() {
    //总成绩=习题成绩+考试成绩+测验成绩
    return exerciseScore + examScore + testScore;
  }

  public void setTotalScore(long totalScore) {
    this.totalScore = totalScore;
  }

  @Override
  public String toString() {
    return "Total{" +
            "studentNo=" + studentNo +
            ", studentName='" + studentName + '\'' +
            ", exerciseScore=" + exerciseScore +
            ", examScore=" + examScore +
            ", testScore=" + testScore +
            ", totalScore=" + totalScore +
            '}';
  }
}
