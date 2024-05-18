package com.ruoyi.student.mapper;

import java.util.List;
import com.ruoyi.student.domain.TStudent;

/**
 * 学生信息管理Mapper接口
 * 
 * @author song
 * @date 2024-05-17
 */
public interface TStudentMapper 
{
    /**
     * 查询学生信息管理
     * 
     * @param studentNo 学生信息管理主键
     * @return 学生信息管理
     */
    public TStudent selectTStudentByStudentNo(Long studentNo);

    /**
     * 查询学生信息管理列表
     * 
     * @param tStudent 学生信息管理
     * @return 学生信息管理集合
     */
    public List<TStudent> selectTStudentList(TStudent tStudent);

    /**
     * 新增学生信息管理
     * 
     * @param tStudent 学生信息管理
     * @return 结果
     */
    public int insertTStudent(TStudent tStudent);

    /**
     * 修改学生信息管理
     * 
     * @param tStudent 学生信息管理
     * @return 结果
     */
    public int updateTStudent(TStudent tStudent);

    /**
     * 删除学生信息管理
     * 
     * @param studentNo 学生信息管理主键
     * @return 结果
     */
    public int deleteTStudentByStudentNo(Long studentNo);

    /**
     * 批量删除学生信息管理
     * 
     * @param studentNos 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTStudentByStudentNos(String[] studentNos);
}
