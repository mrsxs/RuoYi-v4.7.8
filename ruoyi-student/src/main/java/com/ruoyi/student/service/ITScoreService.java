package com.ruoyi.student.service;

import com.ruoyi.student.domain.TScore;
import com.ruoyi.student.domain.Total;

import java.util.List;

/**
 * 成绩管理Service接口
 * 
 * @author song
 * @date 2024-05-17
 */
public interface ITScoreService 
{
    /**
     * 查询成绩管理
     * 
     * @param scoreId 成绩管理主键
     * @return 成绩管理
     */
    public TScore selectTScoreByScoreId(Long scoreId);

    /**
     * 查询成绩管理列表
     * 
     * @param tScore 成绩管理
     * @return 成绩管理集合
     */
    public List<TScore> selectTScoreList(TScore tScore);

    /**
     * 新增成绩管理
     * 
     * @param tScore 成绩管理
     * @return 结果
     */
    public int insertTScore(TScore tScore);

    /**
     * 修改成绩管理
     * 
     * @param tScore 成绩管理
     * @return 结果
     */
    public int updateTScore(TScore tScore);

    /**
     * 批量删除成绩管理
     * 
     * @param scoreIds 需要删除的成绩管理主键集合
     * @return 结果
     */
    public int deleteTScoreByScoreIds(String scoreIds);

    /**
     * 删除成绩管理信息
     * 
     * @param scoreId 成绩管理主键
     * @return 结果
     */
    public int deleteTScoreByScoreId(Long scoreId);

    /**
     * 查询成绩和总成绩
     */
    public List<Total> selectTScoreAndTotalScore(TScore tScore);
}
