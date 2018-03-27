package com.bizdata.app.push.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.content.help.domain.Help;
import com.bizdata.app.information.domain.Information;
import com.bizdata.app.push.controller.vo.SearchPushVO;
import com.bizdata.app.push.domain.Push;
import com.bizdata.app.push.service.PushService;
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
@RequestMapping("/admin/push")
public class PushController {
	private final PushService pushmanageService;

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	@Autowired
	public PushController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, PushService pushmanageService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.pushmanageService = pushmanageService;
	}

	/**
	 * 展示对应模板页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("push:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/push/list");
	}

	@RequiresPermissions("push:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			SearchPushVO searchPushVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<Push> pushmanage = pushmanageService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				searchPushVO);
		return new JpaPageResultVO<>(pushmanage, Push.class);
	}
	
	/**
     * 新增记录页面
     *
     * @return 页面
     */
	@RequestMapping(value="/add_view",method=RequestMethod.GET)
	public ModelAndView addView() {
		return new ModelAndView("app_page/push/add");
	}
	/**
     * 根据ID跳转至编辑页面
     *
     * @param id id
     * @return 页面
     */
    @RequestMapping(value = "/edit_view", method = RequestMethod.GET)
    public ModelAndView editView(String id) {
        System.out.println(id);
        Push push = pushmanageService.findOne(id);
        return new ModelAndView("app_page/push/edit", "push", push);
    }
	/**
	 * 新增推送消息方法
	 * @param information 入参VO
	 * @return 执行反馈
	 */
	@RequestMapping(value="/saveOrUpdate",method=RequestMethod.POST)
	@ResponseBody
	public ResultVO addInformation(Push push) {
		ResultVO resultVO;
		if (pushmanageService.save(push)) {
            resultVO = ResultUtil.create(0, "保存消息成功!");
        } else {
            resultVO = ResultUtil.create(-1, "保存消息失败!");
        }
		return resultVO;
	}
}
