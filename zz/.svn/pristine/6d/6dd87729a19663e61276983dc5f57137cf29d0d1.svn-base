package com.bizdata.admin.controller;

import com.bizdata.admin.domain.LoginLogout;
import com.bizdata.admin.service.LoginLogoutService;
import com.bizdata.commons.utils.*;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登录登出日志展示Controller
 *
 * @author sdevil507
 * @version 1.0
 */
@Controller
@RequestMapping("/admin/loginlogout")
public class AdminLoginLogoutController {

    @Autowired
    private LoginLogoutService loginLogoutService;

    @Autowired
    private JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

    @Autowired
    private JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

    /**
     * 登录登出日志页面展示
     *
     * @return ModelAndView
     */
    @RequiresPermissions("sys:loginlogout:view")
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView view() {
        // 跳转到对应登录登出日志url
        return new ModelAndView("admin_page/login_logout_log/login_logout_log");
    }

    /**
     * 获取登录退出日志列表
     *
     * @param jqGridPageVO jqGrid分页VO
     * @param jqGridSortVO jqGrid排序VO
     * @return 登录退出日志列表
     */
    @RequiresPermissions("sys:loginlogout:view")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO) {
        JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
        JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
        Page<LoginLogout> loginLogouts = loginLogoutService.findAllByPage(jpaPageParamVO, jpaSortParamVO);
        return new JpaPageResultVO<>(loginLogouts, LoginLogout.class);
    }
}
