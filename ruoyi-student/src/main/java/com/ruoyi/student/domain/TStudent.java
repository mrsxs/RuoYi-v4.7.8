package com.ruoyi.student.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.List;

/**
 * 学生信息管理对象 t_student
 * 
 * @author song
 * @date 2024-05-17
 */
public class TStudent extends SysUser
{
    private static final long serialVersionUID = 1L;

    /** 学号 */
    @Excel(name = "学号")
    private Long studentNo;

    /** 姓名 */
    @Excel(name = "姓名")
    private String studentName;

    /** 性别 */
    @Excel(name = "性别")
    private String studentSex;

    /** 密码 */
    private String stuPass;
    // 添加角色字段
    private List<SysRole> roles;

    public List<SysRole> getRoles() {
        return roles;
    }

    public void setRoles(List<SysRole> roles) {
        this.roles = roles;
    }
    public void setStudentNo(Long studentNo) 
    {
        this.studentNo = studentNo;
    }

    public Long getStudentNo() 
    {
        return studentNo;
    }
    public void setStudentName(String studentName) 
    {
        this.studentName = studentName;
    }

    public String getStudentName() 
    {
        return studentName;
    }
    public void setStudentSex(String studentSex) 
    {
        this.studentSex = studentSex;
    }

    public String getStudentSex() 
    {
        return studentSex;
    }
    public void setStuPass(String stuPass) 
    {
        this.stuPass = stuPass;
    }

    public String getStuPass() 
    {
        return stuPass;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("studentNo", getStudentNo())
            .append("studentName", getStudentName())
            .append("studentSex", getStudentSex())
            .append("stuPass", getStuPass())
            .toString();
    }
}
