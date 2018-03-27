package com.bizdata.commons.utils;

import com.bizdata.admin.domain.LoginLogout;
import com.bizdata.admin.service.LoginLogoutService;
import com.bizdata.commons.constant.LoginLogoutType;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 账户登录与注销日志格式化实现
 * <p>
 * Created by sdevil507 on 2017/8/25.
 */
@Component
public class LogInOrOutManagerImpl implements LogInOrOutManager {

    @Autowired
    private LoginLogoutService loginLogoutService;

    /**
     * 执行日志信息的格式化
     *
     * @param loginLogoutType 账户登录退出超时类型
     * @param username        用户名
     * @param ip              ip地址
     * @return 登录退出实体
     */
    private LoginLogout format(LoginLogoutType loginLogoutType, String username, String ip) {
        // 时间
        Date date = new Date();
        // 格式化时间
        String dateString = DateFormatUtils.format(date, "yyyy-MM-dd HH:mm:ss");
        // 操作内容
        String content = "";
        switch (loginLogoutType) {
            case LOGIN:
                content = username + " 于 " + dateString + " 成功登录后台管理系统 ";
                break;
            case LOGOUT:
                content = username + " 于 " + dateString + " 安全退出系统 ";
                break;
        }
        // 封装对象
        LoginLogout sysLoginLogout = new LoginLogout();
        sysLoginLogout.setUsername(username);
        sysLoginLogout.setContent(content);
        sysLoginLogout.setDate(date);
        sysLoginLogout.setType(loginLogoutType);
        sysLoginLogout.setIp(ip);
        return sysLoginLogout;
    }

    @Override
    public void log(LoginLogoutType loginLogoutType, String username, String ip) {
        loginLogoutService.log(format(loginLogoutType, username, ip));
    }
}
