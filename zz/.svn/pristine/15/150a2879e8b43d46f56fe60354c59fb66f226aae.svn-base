package com.bizdata.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.admin.domain.Resource;
import com.bizdata.admin.service.MenuService;

import me.sdevil507.resp.ResultUtil;
import me.sdevil507.resp.ResultVO;



/**
 * 首页Controller
 * <p>
 * Created by sdevil507 on 2017/8/8.
 */
@Controller
@RequestMapping("/admin")
public class AdminIndexController {

    @Autowired
    private MenuService menuService;

    /**
     * 加载系统首页，如果page标识为空则加载outer外部框架，如果的index则加载首页
     *
     * @param response 返回
     * @param page     跳转page标识
     * @return 视图
     * @throws Exception
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index(HttpServletResponse response, String page) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        if (page == null) {
            // 如果page标识为空，则加载前端整体outer框架
            modelAndView.setViewName("include/outer");
            return modelAndView;
        } else if ("index".equals(page)) {
            // 如果page标识为index，则加载index
            modelAndView.setViewName("admin_page/index");
            return modelAndView;
        } else {
            //否则的话直接跳转到相应功能路径
            response.sendRedirect(page);
            return null;
        }
    }

    /**
     * 查询当前用户被授权访问菜单
     *
     * @return 菜单集合数据
     */
    @RequestMapping(value = "/getCurrentUserMenus", method = RequestMethod.GET)
    @ResponseBody
    public ResultVO getCurrentUserMenus() {
        ResultVO resultVO;
        String username = SecurityUtils.getSubject().getPrincipal().toString();
        List<Resource> menus = menuService.getAuthMenus(username);
        if (menus != null && menus.size() > 0) {
            resultVO = ResultUtil.create(0, "菜单获取成功!", menus);
        } else {
            resultVO = ResultUtil.create(-1, "菜单获取失败!");
        }
        return resultVO;
    }
}
