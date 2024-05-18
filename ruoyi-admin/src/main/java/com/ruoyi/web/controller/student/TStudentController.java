package com.ruoyi.web.controller.student;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.student.domain.TStudent;
import com.ruoyi.student.service.ITStudentService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 学生信息管理Controller
 * 
 * @author song
 * @date 2024-05-17
 */
@Controller
@RequestMapping("/student/student")
public class TStudentController extends BaseController
{
    private String prefix = "student/student";

    @Autowired
    private ITStudentService tStudentService;

    @RequiresPermissions("student:student:view")
    @GetMapping()
    public String student()
    {
        return prefix + "/student";
    }

    /**
     * 查询学生信息管理列表
     */
    @RequiresPermissions("student:student:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TStudent tStudent)
    {
        startPage();
        List<TStudent> list = tStudentService.selectTStudentList(tStudent);
        return getDataTable(list);
    }

    /**
     * 导出学生信息管理列表
     */
    @RequiresPermissions("student:student:export")
    @Log(title = "学生信息管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TStudent tStudent)
    {
        List<TStudent> list = tStudentService.selectTStudentList(tStudent);
        ExcelUtil<TStudent> util = new ExcelUtil<TStudent>(TStudent.class);
        return util.exportExcel(list, "学生信息管理数据");
    }

    /**
     * 新增学生信息管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存学生信息管理
     */
    @RequiresPermissions("student:student:add")
    @Log(title = "学生信息管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TStudent tStudent)
    {
        return toAjax(tStudentService.insertTStudent(tStudent));
    }

    /**
     * 修改学生信息管理
     */
    @RequiresPermissions("student:student:edit")
    @GetMapping("/edit/{studentNo}")
    public String edit(@PathVariable("studentNo") Long studentNo, ModelMap mmap)
    {
        TStudent tStudent = tStudentService.selectTStudentByStudentNo(studentNo);
        mmap.put("tStudent", tStudent);
        return prefix + "/edit";
    }

    /**
     * 修改保存学生信息管理
     */
    @RequiresPermissions("student:student:edit")
    @Log(title = "学生信息管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TStudent tStudent)
    {
        return toAjax(tStudentService.updateTStudent(tStudent));
    }

    /**
     * 删除学生信息管理
     */
    @RequiresPermissions("student:student:remove")
    @Log(title = "学生信息管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tStudentService.deleteTStudentByStudentNos(ids));
    }


}
