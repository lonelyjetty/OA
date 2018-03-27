package com.bizdata.app.banner.controller;

import com.bizdata.app.banner.controller.vo.BannerSearchVO;
import com.bizdata.app.banner.domain.Banner;
import com.bizdata.app.banner.service.BannerService;
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
 * BannerController
 * <p>
 * Created by sdevil507 on 2017/9/5.
 */
@Controller
@RequestMapping(value = "/admin/banner")
public class BannerController {

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
        binder.registerCustomEditor(Date.class, new DateEditor());
    }

    private final BannerService bannerService;

    private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

    private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

    private final FileUploadConfig fileUploadConfig;

    @Autowired
    public BannerController(BannerService bannerService, JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO, JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, FileUploadConfig fileUploadConfig) {
        this.bannerService = bannerService;
        this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
        this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
        this.fileUploadConfig = fileUploadConfig;
    }

    /**
     * 展示对应模板页面
     *
     * @return 模板页面
     */
    @RequiresPermissions("banner:view")
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView view() {
        return new ModelAndView("app_page/banner/list");
    }

    /**
     * 展示列表数据
     *
     * @param jqGridPageVO   分页VO
     * @param jqGridSortVO   排序VO
     * @param bannerSearchVO banner搜索参数
     * @return 结果list
     */
    @RequiresPermissions("banner:view")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, BannerSearchVO bannerSearchVO) {
        JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
        JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
        Page<Banner> banners = bannerService.findAllByPage(jpaPageParamVO, jpaSortParamVO, bannerSearchVO);
        for (Banner banner : banners) {
            banner.setPicUrl(fileUploadConfig.getServerPrefix() + banner.getPicUrl());
        }
        return new JpaPageResultVO<>(banners, Banner.class);
    }


    /**
     * 跳转至新增页面
     *
     * @return 模板页面
     */
    @RequestMapping(value = "/add_view", method = RequestMethod.GET)
    public ModelAndView addView() {
        return new ModelAndView("app_page/banner/add");
    }

    /**
     * 根据ID跳转至编辑页面
     *
     * @param id id
     * @return 模板页面
     */
    @RequestMapping(value = "/edit_view", method = RequestMethod.GET)
    public ModelAndView editView(String id) {
        System.out.println(id);
        Banner banner = bannerService.findOne(id);
        banner.setPicUrl(fileUploadConfig.getServerPrefix() + banner.getPicUrl());
        return new ModelAndView("app_page/banner/edit", "banner", banner);
    }

    /**
     * Banner新增或修改
     *
     * @param banner 实体
     * @return 执行反馈
     */
    @RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO saveOrUpdate(Banner banner) {
        ResultVO resultVO;
        if (bannerService.save(banner)) {
            resultVO = ResultUtil.create(0, "Banner保存成功!");
        } else {
            resultVO = ResultUtil.create(-1, "Banner保存失败!");
        }
        return resultVO;
    }

    /**
     * 根据ID删除某条Banner
     *
     * @param id id
     * @return 执行反馈
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO del(String id) {
        ResultVO resultVO;
        if (bannerService.delete(id)) {
            resultVO = ResultUtil.create(0, "Banner删除成功!");
        } else {
            resultVO = ResultUtil.create(-1, "Banner删除失败!");
        }
        return resultVO;
    }
}
