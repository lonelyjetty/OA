package com.bizdata.app.invite.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.invite.controller.vo.UserInviteStatisticsVO;
import com.bizdata.app.invite.domain.UserInviteStatistics;
import com.bizdata.app.invite.service.UserInviteStatisticsService;
import com.bizdata.app.shortcutkey.controller.vo.SearchShortcutKeyVO;
import com.bizdata.app.shortcutkey.domain.ShortcutKey;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

@Controller
@RequestMapping("/admin/invite")
public class UserInviteStatisticsController {
	
	private final UserInviteStatisticsService userInviteStatisticsService;

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	@Autowired
	public UserInviteStatisticsController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, UserInviteStatisticsService userInviteStatisticsService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.userInviteStatisticsService = userInviteStatisticsService;
	}
	
	/**
	 * 展示对应模板页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("invite:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/invite/list");
	}

	@RequiresPermissions("invite:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<UserInviteStatistics, UserInviteStatistics> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			UserInviteStatisticsVO userInviteStatisticsVO) {
		System.out.println("--------------"+1);
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<UserInviteStatistics> userInviteStatistics = userInviteStatisticsService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				userInviteStatisticsVO);
		return new JpaPageResultVO<UserInviteStatistics, UserInviteStatistics>(userInviteStatistics, UserInviteStatistics.class);
	}
}
