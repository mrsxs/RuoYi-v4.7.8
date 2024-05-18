package com.ruoyi.framework.shiro.realm;

import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.student.domain.TStudent;
import com.ruoyi.student.service.ITStudentService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class StudentRealm extends AuthorizingRealm {

  @Autowired
  private ITStudentService studentService;

  @Override
  protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
    SysUser user = (SysUser) principals.getPrimaryPrincipal();
    SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
    List<SysRole> roles = user.getRoles();
    for (SysRole role : roles) {
      info.addRole(role.getRoleKey());
    }
    info.addStringPermission("*:*:*");  // 示例权限，请根据实际情况添加
    return info;
  }

  @Override
  protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
    UsernamePasswordToken upToken = (UsernamePasswordToken) token;
    String username = upToken.getUsername();
    String password = new String(upToken.getPassword());
    System.out.println(username);
    System.out.println(password);
    TStudent student = studentService.login(username, password);
    if (student == null) {
      throw new AuthenticationException("用户名或密码错误");
    }

    // 创建一个新的SysUser对象
    SysUser sysUser = new SysUser();
    sysUser.setUserId(100L);
    sysUser.setLoginName(student.getStudentName());
    sysUser.setUserName(student.getStudentName());
    sysUser.setPassword(student.getStuPass());
    Long userId = student.getStudentNo();

    sysUser.setRemark(String.valueOf(userId));


    // 手动设置角色信息
    List<SysRole> roles = new ArrayList<>();
    SysRole studentRole = new SysRole();
    studentRole.setRoleId(102L); // 设定一个角色ID
    studentRole.setRoleKey("student");
    studentRole.setRoleName("学生");
    studentRole.setRoleSort("3");
    studentRole.setDataScope("1");
    roles.add(studentRole);
    sysUser.setRoles(roles);

    return new SimpleAuthenticationInfo(sysUser, password, getName());
  }
}
