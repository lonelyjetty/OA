package com.bizdata.admin.controller;

import com.bizdata.commons.constant.LoginLogoutType;
import com.bizdata.commons.utils.LogInOrOutManager;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 安全退出操作
 *
 * @author sdevil507
 * @version 1.0
 */
@Controller
@RequestMapping("/admin")
public class AdminLogoutController {

    @Autowired
    private LogInOrOutManager logInOrOutManager;

    /**
     * 执行安全退出操作
     *
     * @param request  请求实体
     * @param response 返回实体
     * @throws IOException
     */
    @RequestMapping(value = "/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Subject subject = SecurityUtils.getSubject();
        if (null != subject.getPrincipal()) {
            // 获取注销前session
            Session session = subject.getSession();
            // 获取注销前用户名
            String username = subject.getPrincipal().toString();
            // 执行入库操作
            logInOrOutManager.log(LoginLogoutType.LOGOUT, username, session.getHost());
            if (subject.isAuthenticated() || subject.isRemembered()) {
                //如果是登录状态,执行安全退出
                subject.logout();
            }
        }
        // 执行跳转到登陆页
        WebUtils.issueRedirect(request, response, "/admin/login");
    }
}
