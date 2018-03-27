package com.bizdata.app.informlocation.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

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

import com.bizdata.app.activity.paoma.domain.PaoMa;
import com.bizdata.app.banner.domain.Banner;
import com.bizdata.app.informlocation.constant.State;
import com.bizdata.app.informlocation.controller.vo.SearchInformLocationVO;
import com.bizdata.app.informlocation.domain.InformLocation;
import com.bizdata.app.informlocation.serivce.InformLocationService;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.resp.ResultUtil;
import me.sdevil507.resp.ResultVO;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

@Controller
@RequestMapping("/admin/inform_location")
@Slf4j
public class InformLocationController {
	private final InformLocationService informLocationService;

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	public InformLocationController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, InformLocationService informLocationService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.informLocationService = informLocationService;
	}

	/**
	 * 展示对应模板页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("inform_location:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/informlocation/list");
	}

	@RequiresPermissions("inform_location:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<InformLocation, InformLocation> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			SearchInformLocationVO searchinformLocationVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<InformLocation> informLocation = informLocationService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				searchinformLocationVO);
		return new JpaPageResultVO<InformLocation, InformLocation>(informLocation, InformLocation.class);
	}

	@RequiresPermissions("inform_location:view")
	@RequestMapping(value = "/add_view", method = RequestMethod.GET)
	public ModelAndView addView() {
		return new ModelAndView("app_page/informlocation/add");
	}

	@RequiresPermissions("inform_location:view")
	@ResponseBody
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	public ResultVO saveOrUpdate(InformLocation informLocation) {
		ResultVO resultVO;
		if(null == informLocation.getCreateTime()) {
			informLocation.setCreateTime(new Date());
		}
		if (informLocationService.save(informLocation)) {
			resultVO = ResultUtil.create(0, "保存消息成功!");
		} else {
			resultVO = ResultUtil.create(-1, "保存消息失败!");
		}
		return resultVO;
	}

	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
	public ModelAndView editView(String id) {
		System.out.println(id);
		InformLocation informLocation = informLocationService.findOne(id);
		return new ModelAndView("app_page/informlocation/edit", "informLocation", informLocation);
	}

	/**
	 * 上下线功能
	 * 
	 * @param id
	 * @return
	 */
	@RequiresPermissions("inform_location:view")
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO line(String id) {
		ResultVO resultVO;

		InformLocation informLocation = informLocationService.findOne(id);
		if (null != informLocation) {
			if ("NOMAL".equals(informLocation.getState().toString())) {
				System.out.println("该活动由上线变为下线");
				informLocation.setState(State.OFF);
			} else if ("OFF".equals(informLocation.getState().toString())) {
				System.out.println("该活动由下线变为上线");
				informLocation.setState(State.NOMAL);
			}

			boolean result = informLocationService.save(informLocation);
			if (!result) {
				log.error("更新失败！");
				resultVO = ResultUtil.create(-1, "发生错误，请检查");
			} else {
				resultVO = ResultUtil.create(0, "执行成功");
			}
		} else {
			resultVO = ResultUtil.create(-1, "该活动不存在");
		}

		return resultVO;
	}
}
