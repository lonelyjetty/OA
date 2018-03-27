package com.bizdata.app.information.controller;

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

import com.bizdata.app.banner.domain.Banner;
import com.bizdata.app.information.constant.InformationStateEnum;
import com.bizdata.app.information.controller.vo.SearchInformationVO;
import com.bizdata.app.information.domain.Information;
import com.bizdata.app.information.serivce.InformationService;
import com.bizdata.commons.utils.DateEditor;
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
@RequestMapping("/admin/information")
public class InformationController {
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	private final InformationService informationService;

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	@Autowired
	public InformationController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, InformationService informationService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.informationService = informationService;
	}

	/**
	 * 展示对应模板页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("information:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/information/list");
	}

	@RequiresPermissions("information:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<Information, Information> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			SearchInformationVO searchinformationVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<Information> information = informationService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				searchinformationVO);
		return new JpaPageResultVO<>(information, Information.class);
	}

	/**
	 * 新增记录页面
	 *
	 * @return 页面
	 */
	@RequestMapping(value = "/add_view", method = RequestMethod.GET)
	public ModelAndView addView() {
		return new ModelAndView("app_page/information/add");
	}

	/**
	 * 新增消息方法
	 * 
	 * @param information
	 *            入参VO
	 * @return 执行反馈
	 */
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO addInformation(Information information) {
		ResultVO resultVO;
		System.out.println(information.getCreatedate());
		if (null == information.getCreatedate()) {
			information.setCreatedate(new Date()); // 设置创建时间
		}
		if (null == information.getState()) {
			information.setState(InformationStateEnum.UNPUBLISHED); // 默认情况下不发布
		}
		String userInfo = information.getUserinf();
		if (null != userInfo) {
			while (userInfo.indexOf("，") != -1) {
				userInfo = userInfo.replace("，", ",");
			}
			if(userInfo.charAt(userInfo.length() -1) != ',') {
				userInfo = userInfo + ","; // 加上逗号方便接口查询
			}
			information.setUserinf(userInfo);
		}
		System.out.println("文章类型:" + information.getInformationTypeEnum());
		if (informationService.save(information)) {
			resultVO = ResultUtil.create(0, "保存消息成功!");
		} else {
			resultVO = ResultUtil.create(-1, "保存消息失败!");
		}
		return resultVO;
	}

	/**
	 * 直接发布消息
	 * 
	 * @param information
	 *            入参VO
	 * @return 执行反馈
	 */
	@RequestMapping(value = "/release", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO releaseInformation(Information information) {
		ResultVO resultVO;
		if (null == information.getCreatedate()) {
			information.setCreatedate(new Date()); // 设置创建时间
		}
		String userInfo = information.getUserinf();
		if (null != userInfo) {
			while (userInfo.indexOf("，") != -1) {
				userInfo = userInfo.replace("，", ",");
			}
			if(userInfo.charAt(userInfo.length() -1) != ',') {
				userInfo = userInfo + ","; // 加上逗号方便接口查询
			}
			information.setUserinf(userInfo);
		}
		information.setState(InformationStateEnum.PUBLISHED); // 设置为已发布
		// 推送时间即为发布时间
		if (null == information.getPushdate()) {
			information.setPushdate(new Date());
		}
		if (informationService.save(information)) {
			// if (informationService.release(information)) {
			resultVO = ResultUtil.create(0, "发布消息成功!");
			// } else {
			// resultVO = ResultUtil.create(-1, "发布消息失败!");
			// }
		} else {
			resultVO = ResultUtil.create(-1, "保存消息失败!");
		}
		return resultVO;
	}

	/**
	 * 将消息设置为已发布
	 * @param information
	 * @return
	 */
	@RequestMapping(value = "/rel", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO releaseInformation(String id) {
		ResultVO resultVO = ResultUtil.create(-1, "保存消息失败!");
		Information information = informationService.findOne(id);
		if(null == information.getPushdate()) {
			information.setPushdate(new Date());
		}
		if (null != information) {
			information.setState(InformationStateEnum.PUBLISHED); // 设置为已发布
			if (informationService.save(information)) {
				// if (informationService.release(information)) {
				resultVO = ResultUtil.create(0, "发布消息成功!");
				// } else {
				// resultVO = ResultUtil.create(-1, "发布消息失败!");
				// }
			} else {
				resultVO = ResultUtil.create(-1, "保存消息失败!");
			}
		}
		return resultVO;
	}

	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
	public ModelAndView editView(String id) {
		System.out.println(id);
		Information information = informationService.findOne(id);
		return new ModelAndView("app_page/information/edit", "information", information);
	}
}
