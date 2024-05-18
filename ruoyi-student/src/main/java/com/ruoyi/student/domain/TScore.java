package com.ruoyi.student.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 成绩管理对象 t_score
 *
 * @author song
 * @date 2024-05-17
 */
public class TScore extends BaseEntity {
  private static final long serialVersionUID = 1L;

  /**
   *
   */
  private Long scoreId;

  /**
   * 成绩值
   */
  @Excel(name = "成绩")
  private Long scoreValue;

  /**
   * 成绩类别1习题 2测验 3考试
   */
  @Excel(name = "成绩类别1习题 2测验 3考试")
  private String scoreType;

  private TStudent student;

  @Excel(name = "学生姓名")
  private String studentName;

  public String getStudentName() {
    if (student != null) {
      return student.getStudentName();
    }
    return studentName;
  }

  public void setStudentName(String studentName) {
    this.student = student;
    // 同时设置 studentName
    if (student != null) {
      this.studentName = student.getStudentName();
    }
  }

  public TStudent getStudent() {
    return student;
  }

  public void setStudent(TStudent student) {
    this.student = student;
  }

  /**
   *
   */
  private Long studentId;

  public void setScoreId(Long scoreId) {
    this.scoreId = scoreId;
  }

  public Long getScoreId() {
    return scoreId;
  }

  public void setScoreValue(Long scoreValue) {
    this.scoreValue = scoreValue;
  }

  public Long getScoreValue() {
    return scoreValue;
  }

  public void setScoreType(String scoreType) {
    this.scoreType = scoreType;
  }

  public String getScoreType() {
    return scoreType;
  }

  public void setStudentId(Long studentId) {
    this.studentId = studentId;
  }

  public Long getStudentId() {
    return studentId;
  }

  @Override
  public String toString() {
    return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("scoreId", getScoreId())
            .append("scoreValue", getScoreValue())
            .append("scoreType", getScoreType())
            .append("studentId", getStudentId())
            .toString();
  }
}
