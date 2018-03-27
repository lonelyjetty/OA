package com.bizdata.app.app_mag.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.app_mag.controller.vo.SearchApp_magVO;
import com.bizdata.app.app_mag.domain.App_mag;
import com.bizdata.app.app_mag.service.App_magService;
import com.bizdata.app.information.domain.Information;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;

import me.sdevil507.resp.ResultUtil;
import me.sdevil507.resp.ResultVO;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

@Controller
@RequestMapping("/admin/app_mag")
public class App_magController {
	private final App_magService app_magService;

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	@Autowired
	public App_magController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, App_magService app_magService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.app_magService = app_magService;
	}

	/**
	 * 展示对应模板页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("app_mag:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/app_mag/list");
	}
	/**
	 * 返回数据
	 * @param jqGridPageVO
	 * @param jqGridSortVO
	 * @param searchApp_magVO
	 * @return
	 */
	@RequiresPermissions("app_mag:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			SearchApp_magVO searchApp_magVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<App_mag> app_mag = app_magService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				searchApp_magVO);
		return new JpaPageResultVO<>(app_mag, App_mag.class);
	}
	
	/**
     * 新增app配置页面
     *
     * @return 页面
     */
	@RequestMapping(value="/add_view",method=RequestMethod.GET)
	public ModelAndView addView() {
		return new ModelAndView("app_page/app_mag/add");
	}
	/**
	 * 新增消息方法
	 * @param information 入参VO
	 * @return 执行反馈
	 */
	@RequestMapping(value="/saveOrUpdate",method=RequestMethod.POST)
	@ResponseBody
	public ResultVO addInformation(App_mag app_mag) {
		ResultVO resultVO;
		if (app_magService.save(app_mag)) {
            resultVO = ResultUtil.create(0, "保存消息成功!");
        } else {
            resultVO = ResultUtil.create(-1, "保存消息失败!");
        }
		return resultVO;
	}
}
