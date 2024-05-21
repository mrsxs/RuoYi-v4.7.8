package com.ruoyi.web.controller.student;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.student.domain.TScore;
import com.ruoyi.student.domain.Total;
import com.ruoyi.student.service.ITScoreService;
import com.ruoyi.system.service.ISysDictDataService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 成绩管理Controller
 *
 * @author song
 * @date 2024-05-17
 */
@Controller
@RequestMapping("/student/score")
public class TScoreController extends BaseController {
  private String prefix = "student/score";

  @Autowired
  private ITScoreService tScoreService;
  @Autowired
  //字典数据表
  private ISysDictDataService dictDataService;


  @RequiresPermissions("student:score:view")
  @GetMapping()
  public String score() {
    return prefix + "/score";
  }

  /**
   * 查询成绩管理列表
   */
  @RequiresPermissions("student:score:list")
  @PostMapping("/list")
  @ResponseBody
  public TableDataInfo list(TScore tScore) {
    startPage();
    List<TScore> list = tScoreService.selectTScoreList(tScore);
    return getDataTable(list);
  }

  /**
   * 导出成绩管理列表
   */
  @RequiresPermissions("student:score:export")
  @Log(title = "成绩管理", businessType = BusinessType.EXPORT)
  @PostMapping("/export")
  @ResponseBody
  public AjaxResult export(TScore tScore) {
    List<TScore> list = tScoreService.selectTScoreList(tScore);
    ExcelUtil<TScore> util = new ExcelUtil<TScore>(TScore.class);
    return util.exportExcel(list, "成绩管理数据");
  }

  /**
   * 导出成绩管理列表
   */
  @RequiresPermissions("student:score:export")
  @Log(title = "成绩管理", businessType = BusinessType.EXPORT)
  @PostMapping("/export1")
  @ResponseBody
  public AjaxResult export1(TScore tScore) {
    List<Total> list = tScoreService.selectTScoreAndTotalScore(tScore);
    ExcelUtil<Total> util = new ExcelUtil<Total>(Total.class);
    return util.exportExcel(list, "成绩管理数据");
  }

  /**
   * 新增成绩管理
   */
  @GetMapping("/add")
  public String add(ModelMap map) {
    //获取成绩类别 score_type
    SysDictData dictData = new SysDictData();
    dictData.setDictType("score_type");
    List<SysDictData> scoreTypeList = dictDataService.selectDictDataList(dictData);
    map.addAttribute("datas", scoreTypeList);

    return prefix + "/add";
  }

  /**
   * 新增保存成绩管理
   */
  @RequiresPermissions("student:score:add")
  @Log(title = "成绩管理", businessType = BusinessType.INSERT)
  @PostMapping("/add")
  @ResponseBody
  public AjaxResult addSave(TScore tScore) {
    return toAjax(tScoreService.insertTScore(tScore));
  }

  /**
   * 修改成绩管理
   */
  @RequiresPermissions("student:score:edit")
  @GetMapping("/edit/{scoreId}")
  public String edit(@PathVariable("scoreId") Long scoreId, ModelMap mmap) {
    //获取成绩类别 score_type
    SysDictData dictData = new SysDictData();
    dictData.setDictType("score_type");
    List<SysDictData> scoreTypeList = dictDataService.selectDictDataList(dictData);
    mmap.addAttribute("datas", scoreTypeList);
    TScore tScore = tScoreService.selectTScoreByScoreId(scoreId);
    mmap.put("tScore", tScore);
    return prefix + "/edit";
  }

  /**
   * 修改保存成绩管理
   */
  @RequiresPermissions("student:score:edit")
  @Log(title = "成绩管理", businessType = BusinessType.UPDATE)
  @PostMapping("/edit")
  @ResponseBody
  public AjaxResult editSave(TScore tScore) {
    return toAjax(tScoreService.updateTScore(tScore));
  }

  /**
   * 删除成绩管理
   */
  @RequiresPermissions("student:score:remove")
  @Log(title = "成绩管理", businessType = BusinessType.DELETE)
  @PostMapping("/remove")
  @ResponseBody
  public AjaxResult remove(String ids) {
    return toAjax(tScoreService.deleteTScoreByScoreIds(ids));
  }

  /**
   * 打开总成绩页面
   */
  @RequiresPermissions("student:score:total")
  @GetMapping("/total")
  public String total() {
    return prefix + "/total";
  }

  /**
   * 个人总成绩
   */
  @RequiresPermissions("student:score:usertotal")
  @GetMapping("/usertotal")
  public String usertotal() {
    Subject subject = SecurityUtils.getSubject();
    Object principal = subject.getPrincipal();
    System.out.println(principal);
    return prefix + "/usertotal";
  }

  /**
   * 查询总成绩列表
   */
  @RequiresPermissions("student:score:total")
  @PostMapping("/sum")
  @ResponseBody
  public TableDataInfo totalList(TScore tScore) {
    //获取角色
    Subject currentUser = SecurityUtils.getSubject();
    SysUser sysUser = (SysUser) currentUser.getPrincipal();
    List<SysRole> roles = sysUser.getRoles();
    for (SysRole sysRole : roles){
      Long roleId = sysRole.getRoleId();
      if (roleId == 102){
        String password = sysUser.getRemark();
        tScore.setStudentId(Long.valueOf(password));
      }
    }

    startPage();
    List<Total> list = tScoreService.selectTScoreAndTotalScore(tScore);
    return getDataTable(list);
  }
}
