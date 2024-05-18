package com.ruoyi.student.mapper;

import com.ruoyi.student.domain.TScore;

import java.util.List;

/**
 * 成绩管理Mapper接口
 * 
 * @author song
 * @date 2024-05-17
 */
public interface TScoreMapper 
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
     * 删除成绩管理
     * 
     * @param scoreId 成绩管理主键
     * @return 结果
     */
    public int deleteTScoreByScoreId(Long scoreId);

    /**
     * 批量删除成绩管理
     * 
     * @param scoreIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTScoreByScoreIds(String[] scoreIds);

}
