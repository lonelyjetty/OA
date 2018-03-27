package com.bizdata.app.boot.controller;

import com.bizdata.app.boot.controller.vo.BootSearchVO;
import com.bizdata.app.boot.domain.Boot;
import com.bizdata.app.boot.service.BootService;
import com.bizdata.commons.utils.*;
import com.bizdata.config.FileUploadConfig;
import me.sdevil507.resp.ResultUtil;
import me.sdevil507.resp.ResultVO;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 启动页Controller
 * <p>
 * Created by sdevil507 on 2017/9/5.
 */
@Controller
@RequestMapping(value = "/admin/boot")
public class BootController {
    
    private final BootService bootService;

    private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

    private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

    private final FileUploadConfig fileUploadConfig;

    @Autowired
    public BootController(BootService bootService, JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO, FileUploadConfig fileUploadConfig) {
        this.bootService = bootService;
        this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
        this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
        this.fileUploadConfig = fileUploadConfig;
    }

    /**
     * 展示对应模板页面
     *
     * @return 模板页面
     */
    @RequiresPermissions("boot:view")
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView view() {
        return new ModelAndView("app_page/boot/list");
    }

    /**
     * 展示列表数据
     *
     * @param jqGridPageVO 分页VO
     * @param jqGridSortVO 排序VO
     * @param bootSearchVO 查询VO
     * @return 结果list
     */
    @RequiresPermissions("boot:view")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, BootSearchVO bootSearchVO) {
        JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
        JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
        Page<Boot> boots = bootService.findAllByPage(jpaPageParamVO, jpaSortParamVO, bootSearchVO);
        for (Boot boot : boots) {
            boot.setPicUrl(fileUploadConfig.getServerPrefix() + boot.getPicUrl());
        }
        return new JpaPageResultVO<>(boots, Boot.class);
    }

    /**
     * 新增记录页面
     *
     * @return 页面
     */
    @RequestMapping(value = "/add_view", method = RequestMethod.GET)
    public ModelAndView addView() {
        return new ModelAndView("app_page/boot/add");
    }

    /**
     * 新增记录方法
     *
     * @param boot 入参VO
     * @return 执行反馈
     */
    @RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO add(Boot boot) {
        ResultVO resultVO;
        if (bootService.save(boot)) {
            resultVO = ResultUtil.create(0, "保存启动页成功!");
        } else {
            resultVO = ResultUtil.create(-1, "保存启动页失败!");
        }
        return resultVO;
    }

    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO del(String id) {
        ResultVO resultVO;
        if (bootService.delete(id)) {
            resultVO = ResultUtil.create(0, "删除启动页成功!");
        } else {
            resultVO = ResultUtil.create(-1, "删除启动页失败!");
        }
        return resultVO;
    }

    @RequestMapping(value = "/edit_view", method = RequestMethod.GET)
    public ModelAndView readOne(String id) {
        Boot boot = bootService.findOne(id);
        boot.setPicUrl(fileUploadConfig.getServerPrefix() + boot.getPicUrl());
        return new ModelAndView("app_page/boot/edit", "boot", boot);
    }
}
