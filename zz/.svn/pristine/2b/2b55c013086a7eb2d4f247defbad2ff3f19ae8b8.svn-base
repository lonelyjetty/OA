package com.bizdata.app.activity.hotevents.controller;

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

import com.bizdata.app.activity.hotevents.controller.vo.HotEventsVO;
import com.bizdata.app.activity.hotevents.domain.HotEvents;
import com.bizdata.app.activity.hotevents.service.HotEventsService;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;
import com.bizdata.config.FileUploadConfig;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.resp.ResultUtil;
import me.sdevil507.resp.ResultVO;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

@Controller
@RequestMapping("/admin/hot_events") // 声明路径
@Slf4j
public class HotEventsController {

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final HotEventsService hotEventsService;

	private final FileUploadConfig fileUploadConfig;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	public HotEventsController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, HotEventsService hotEventsService,
			FileUploadConfig fileUploadConfig) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.hotEventsService = hotEventsService;
		this.fileUploadConfig = fileUploadConfig;
	}

	@RequiresPermissions("hot_events:view") // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/activity/hotevents/list");
	}

	@RequiresPermissions("hot_events:view") // 权限控制
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<HotEvents, HotEvents> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			HotEventsVO hotEventsVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		// 根据是否即将开始来判断
		if (null != hotEventsVO.getSearchActionType() && !"".equals(hotEventsVO.getSearchActionType())) {
			String temp = hotEventsVO.getSearchActionType();
			if ("0".equals(temp)) {
				hotEventsVO.setStartingTime(new Date()); // 进行中
			} else if ("1".equals(temp)) {
				hotEventsVO.setNoStartTime(new Date()); // 未开始
			} else if ("2".equals(temp)) {
				hotEventsVO.setEndedTime(new Date()); // 已结束
			}
		}

		Page<HotEvents> hotEvents = hotEventsService.findAllByPage(jpaPageParamVO, jpaSortParamVO, hotEventsVO);
		for (HotEvents hotEvent : hotEvents) {
			hotEvent.setPicUrl(fileUploadConfig.getServerPrefix() + hotEvent.getPicUrl());
		}
		return new JpaPageResultVO<>(hotEvents, HotEvents.class);
	}

	/**
	 * 跳转到新增页面
	 * 
	 * @return
	 */
	@RequiresPermissions("hot_events:view") // 权限控制
	@RequestMapping(value = "/add_view", method = RequestMethod.GET)
	public ModelAndView addView() {
		return new ModelAndView("app_page/activity/hotevents/add");
	}

	/**
	 * 保存或者更新
	 * 
	 * @param hotevents
	 * @return
	 */
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO saveOrUpdate(HotEvents hotevents) {
		ResultVO resultVO = null;
		if (hotEventsService.save(hotevents)) {
			resultVO = ResultUtil.create(0, "hotevents保存成功!");
		} else {
			resultVO = ResultUtil.create(-1, "hotevents保存失败!");
		}
		return resultVO;
	}

	/**
	 * 跳转到编辑页面中
	 * 
	 * @param id
	 * @return
	 */
	@RequiresPermissions("hot_events:view")
	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
	public ModelAndView readOne(String id) {
		HotEvents hotEvents = hotEventsService.findOne(id);
		hotEvents.setPicUrl(fileUploadConfig.getServerPrefix() + hotEvents.getPicUrl());
		return new ModelAndView("app_page/activity/hotevents/edit", "hotEvents", hotEvents);
	}

	/**
	 * 下上线功能
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO del(String id) {
		ResultVO resultVO;

		HotEvents hotEvents = hotEventsService.findOne(id);
		if (null != hotEvents) {
			if ("1".equals(hotEvents.getState())) {
				System.out.println("该活动由上线变为下线");
				hotEvents.setState("-1");
			} else if ("-1".equals(hotEvents.getState())) {
				System.out.println("该活动由下线变为上线");
				hotEvents.setState("1");
			}

			boolean result = hotEventsService.save(hotEvents);
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
