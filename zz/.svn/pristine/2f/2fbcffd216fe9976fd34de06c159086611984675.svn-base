package com.bizdata.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.mgt.SessionManager;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.admin.domain.User;
import com.bizdata.admin.service.UserService;
import com.bizdata.commons.constant.BizdataResponseStatus;
import com.bizdata.commons.utils.GsonExclusionStrategy;
import com.bizdata.commons.utils.JpaPageVO;
import com.bizdata.commons.utils.JpaSortVO;
import com.bizdata.commons.utils.JqgridSearchVO;
import com.bizdata.framework.exception.JpaFindConditionException;
import com.bizdata.framework.exception.PageConditionException;
import com.bizdata.framework.exception.SearchConditionException;
import com.bizdata.framework.exception.SortConditionException;
import com.bizdata.framework.extension.log.Loggable;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * 用户操作Controller
 *
 * @author sdevil507
 * @version 1.0
 */
@Controller
@RequestMapping("/admin/user")
public class AdminUserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SessionManager sessionManager;

    @Loggable
    private Logger logger;

    /**
     * 用户信息展示
     *
     * @return 对应页面
     */
    @RequiresPermissions("sys:user:view")
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView list() {
        return new ModelAndView("admin_page/user/user_list");
    }

    /**
     * 异步获取用户列表信息
     *
     * @param pageVO
     * @return 用户信息
     * @throws SortConditionException
     * @throws PageConditionException
     * @throws SearchConditionException
     */
    @RequiresPermissions("sys:user:view")
    @RequestMapping(value = "/read", method = RequestMethod.GET)
    @ResponseBody
    public String read(JpaPageVO pageVO, JpaSortVO sortVO, JqgridSearchVO jqgridSearchVO)
            throws JpaFindConditionException {
        Map<String, Object> userMap = new HashMap<>();
        Page<User> pageInfo = userService.findAllByPage(pageVO, sortVO, jqgridSearchVO);
        userMap.put("rows", pageInfo.getContent());
        userMap.put("currentPage", pageVO.getPage());
        userMap.put("totalPageSize", pageInfo.getTotalPages());
        userMap.put("totalRecords", pageInfo.getTotalElements());
        String[] ex = {"userList"};
        Gson gson = new GsonBuilder().setExclusionStrategies(new GsonExclusionStrategy(ex)).create();
        return gson.toJson(userMap);
    }

    /**
     * 新增用户与角色
     *
     * @param user  用户实体
     * @param roles 角色实体
     * @return json
     */
    @RequiresPermissions("sys:user:create")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public String create(User user, String[] roles) {
        String json;
        if (!StringUtils.hasText(user.getUsername()) || !StringUtils.hasText(user.getPassword())) {
            json = BizdataResponseStatus.COMMON_ERROR.getResult("用户信息不完整，请确认后重新提交");
            return json;
        }
        try {
            userService.insertUser(user, roles);
            json = BizdataResponseStatus.COMMON_SUCCESS.getResult("新增用户成功");
        } catch (Exception e) {
            e.printStackTrace();
            json = BizdataResponseStatus.COMMON_ERROR.getResult("新增用户失败,请确认用户名不重复！");
        }
        return json;
    }

    /**
     * 更新用户与角色
     *
     * @param user  用户
     * @param roles 角色
     * @return json
     */
    @RequiresPermissions("sys:user:update")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String update(User user, String[] roles) {
        String json;
        if (!StringUtils.hasText(user.getUsername()) || !StringUtils.hasText(user.getPassword())) {
            json = BizdataResponseStatus.COMMON_ERROR.getResult("用户信息不完整，请确认后重新提交");
            return json;
        }

        try {
            userService.updateUser(user, roles);
            json = BizdataResponseStatus.COMMON_SUCCESS.getResult("用户更新成功");
        } catch (Exception e) {
            e.printStackTrace();
            json = BizdataResponseStatus.COMMON_ERROR.getResult("更新用户失败,请确认用户名不重复！");
        }
        return json;
    }

    /**
     * 执行用户删除
     *
     * @param id 用户id
     * @return json
     */
    @RequiresPermissions("sys:user:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(String id) {
        String json;
        if (id.equals("1")) {
            json = BizdataResponseStatus.COMMON_ERROR.getResult("admin为系统超级管理员，初始数据不可以删除！");
            return json;
        }
        try {
            userService.deleteUser(id);
            json = BizdataResponseStatus.COMMON_SUCCESS.getResult("用户删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            json = BizdataResponseStatus.COMMON_ERROR.getResult("用户删除失败");
        }
        return json;
    }

    /**
     * 验证原始密码是否正确
     *
     * @param old_password 旧密码
     * @return
     */
    @RequestMapping(value = "/checkPassword")
    @ResponseBody
    public boolean checkPassword(String old_password) {
        // 如果密码验证正确
        return userService.checkPassword(SecurityUtils.getSubject().getPrincipal().toString(), old_password);
    }

    /**
     * 更改密码
     * @param password 新密码
     * @return boolean
     */
    @RequestMapping(value = "/changePassword")
    @ResponseBody
    public void changePassword(String password) {
        userService.changePassword(password);
    }


    
    
}
