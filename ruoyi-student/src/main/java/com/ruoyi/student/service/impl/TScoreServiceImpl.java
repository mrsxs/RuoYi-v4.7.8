package com.ruoyi.student.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.student.domain.TScore;
import com.ruoyi.student.domain.Total;
import com.ruoyi.student.mapper.TScoreMapper;
import com.ruoyi.student.service.ITScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 成绩管理Service业务层处理
 *
 * @author song
 * @date 2024-05-17
 */
@Service
public class TScoreServiceImpl implements ITScoreService {
  @Autowired
  private TScoreMapper tScoreMapper;

  /**
   * 查询成绩管理
   *
   * @param scoreId 成绩管理主键
   * @return 成绩管理
   */
  @Override
  public TScore selectTScoreByScoreId(Long scoreId) {
    return tScoreMapper.selectTScoreByScoreId(scoreId);
  }

  /**
   * 查询成绩管理列表
   *
   * @param tScore 成绩管理
   * @return 成绩管理
   */
  @Override
  public List<TScore> selectTScoreList(TScore tScore) {
    return tScoreMapper.selectTScoreList(tScore);
  }

  /**
   * 新增成绩管理
   *
   * @param tScore 成绩管理
   * @return 结果
   */
  @Override
  public int insertTScore(TScore tScore) {

    //判断该类别成绩是否已经存在
    TScore tScore1 = new TScore();
    tScore1.setScoreType(tScore.getScoreType());
    tScore1.setStudentId(tScore.getStudentId());
    List<TScore> tScores = tScoreMapper.selectTScoreList(tScore1);
    if (!tScores.isEmpty()) {
      throw new RuntimeException("该类别成绩已存在");
    }
    return tScoreMapper.insertTScore(tScore);
  }

  /**
   * 修改成绩管理
   *
   * @param tScore 成绩管理
   * @return 结果
   */
  @Override
  public int updateTScore(TScore tScore) {
    return tScoreMapper.updateTScore(tScore);
  }

  /**
   * 批量删除成绩管理
   *
   * @param scoreIds 需要删除的成绩管理主键
   * @return 结果
   */
  @Override
  public int deleteTScoreByScoreIds(String scoreIds) {
    return tScoreMapper.deleteTScoreByScoreIds(Convert.toStrArray(scoreIds));
  }

  /**
   * 删除成绩管理信息
   *
   * @param scoreId 成绩管理主键
   * @return 结果
   */
  @Override
  public int deleteTScoreByScoreId(Long scoreId) {
    return tScoreMapper.deleteTScoreByScoreId(scoreId);
  }

  @Override
  public List<Total> selectTScoreAndTotalScore(TScore tScore) {
    List<TScore> tScores = tScoreMapper.selectTScoreList(tScore);

    Map<Long, Total> map = new HashMap<>();
    //有重复的学生id 需要合并
    for (TScore score : tScores) {
      if (map.containsKey(score.getStudentId())) {
        //合并
        Total total = map.get(score.getStudentId());
        ScoreType(map, score, total);
      } else {
        //新建
        Total total = new Total();
        total.setStudentNo(score.getStudentId());
        total.setStudentName(score.getStudent().getStudentName());
        ScoreType(map, score, total);
      }
    }


    return new ArrayList<>(map.values());
  }

  private void ScoreType(Map<Long, Total> map, TScore score, Total total) {
    switch (score.getScoreType()) {
      case "1":
        total.setExerciseScore(score.getScoreValue());
        break;
      case "2":
        total.setTestScore(score.getScoreValue());
        break;
      case "3":
        total.setExamScore(score.getScoreValue());
        break;
    }
    map.put(score.getStudentId(), total);
  }
}
