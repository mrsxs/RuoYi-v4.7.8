package com.ruoyi.student.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.student.domain.TScore;
import com.ruoyi.student.domain.TStudent;
import com.ruoyi.student.mapper.TScoreMapper;
import com.ruoyi.student.mapper.TStudentMapper;
import com.ruoyi.student.service.ITStudentService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 学生信息管理Service业务层处理
 *
 * @author song
 * @date 2024-05-17
 */
@Service
public class TStudentServiceImpl implements ITStudentService {
  @Autowired
  private TStudentMapper tStudentMapper;
  @Autowired
  private TScoreMapper tScoreMapper;

  /**
   * 查询学生信息管理
   *
   * @param studentNo 学生信息管理主键
   * @return 学生信息管理
   */
  @Override
  public TStudent selectTStudentByStudentNo(Long studentNo) {
    return tStudentMapper.selectTStudentByStudentNo(studentNo);
  }

  /**
   * 查询学生信息管理列表
   *
   * @param tStudent 学生信息管理
   * @return 学生信息管理
   */
  @Override
  public List<TStudent> selectTStudentList(TStudent tStudent) {
    return tStudentMapper.selectTStudentList(tStudent);
  }

  /**
   * 新增学生信息管理
   *
   * @param tStudent 学生信息管理
   * @return 结果
   */
  @Override
  public int insertTStudent(TStudent tStudent) {
    //学号不能重复
    TStudent tStudent1 = new TStudent();
    tStudent1.setStudentNo(tStudent.getStudentNo());
    List<TStudent> tStudents = tStudentMapper.selectTStudentList(tStudent1);
    if (tStudents.size() > 0) {
      throw new RuntimeException("学号" + tStudent.getStudentNo() + "已存在");
    }
    return tStudentMapper.insertTStudent(tStudent);
  }

  /**
   * 修改学生信息管理
   *
   * @param tStudent 学生信息管理
   * @return 结果
   */
  @Override
  public int updateTStudent(TStudent tStudent) {
    return tStudentMapper.updateTStudent(tStudent);
  }

  /**
   * 批量删除学生信息管理
   *
   * @param studentNos 需要删除的学生信息管理主键
   * @return 结果
   */
  @Override
  public int deleteTStudentByStudentNos(String studentNos) {
    //遍历查询成绩如果有成绩则不能删除
    String[] studentNoArray = Convert.toStrArray(studentNos);
    for (String studentNo : studentNoArray) {
      TScore tScore = new TScore();
      tScore.setStudentId(Long.valueOf(studentNo));
      List<TScore> tScores = tScoreMapper.selectTScoreList(tScore);
      if (tScores.size() > 0) {
        throw new RuntimeException("学生" + studentNo + "有成绩不能删除");
      }
    }

    return tStudentMapper.deleteTStudentByStudentNos(Convert.toStrArray(studentNos));
  }

  /**
   * 删除学生信息管理信息
   *
   * @param studentNo 学生信息管理主键
   * @return 结果
   */
  @Override
  public int deleteTStudentByStudentNo(Long studentNo) {
    return tStudentMapper.deleteTStudentByStudentNo(studentNo);
  }

  @Override
  public TStudent login(String username, String password) {
    TStudent tStudent = null;
    try {
      tStudent = new TStudent();
      Long l = Long.valueOf(username);
      tStudent.setStudentNo(l);
      tStudent.setStuPass(password);
    } catch (NumberFormatException e) {
        throw new RuntimeException("用户名或密码错误");
    }
    List<TStudent> tStudents = tStudentMapper.selectTStudentList(tStudent);
    if (tStudents.size() > 0) {
      //存到SecurityUtils 里面
      SecurityUtils.getSubject().getSession().setAttribute("student", tStudents.get(0));
      return tStudents.get(0);
    }
    throw new RuntimeException("用户名或密码错误");

  }
}
