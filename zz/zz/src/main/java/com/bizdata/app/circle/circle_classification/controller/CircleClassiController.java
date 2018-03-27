package com.bizdata.app.circle.circle_classification.controller;

import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.circle.circle_classification.constant.StateEnum;
import com.bizdata.app.circle.circle_classification.controller.vo.SearchCircleClassiVO;
import com.bizdata.app.circle.circle_classification.domain.CircleClassi;
import com.bizdata.app.circle.circle_classification.service.CircleClassiService;
import com.bizdata.app.circle.circletopic.domain.CircleTopic;
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
@RequestMapping("/admin/circle_classification")
public class CircleClassiController {
	private final CircleClassiService circleClassService;

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	@Autowired
	public CircleClassiController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, CircleClassiService circleClassService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.circleClassService = circleClassService;
	}

	/**
	 * 展示对应模板页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("circle_classification:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/circle/circle_classification/list");
	}
	
	/**
	 * 返回列表数据
	 * @param jqGridPageVO
	 * @param jqGridSortVO
	 * @param searchcircleClassVO
	 * @return
	 */
	@RequiresPermissions("circle_classification:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			SearchCircleClassiVO searchcircleClassVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<CircleClassi> circleClass = circleClassService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				searchcircleClassVO);
		return new JpaPageResultVO<>(circleClass, CircleClassi.class);
	}
	
	/**
     * 新增记录页面
     *
     * @return 页面
     */
	@RequestMapping(value="/add_view",method=RequestMethod.GET)
	public ModelAndView addView() {
		return new ModelAndView("app_page/circle/circle_classification/add");
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
        CircleClassi circleClass = circleClassService.findOne(id);
        return new ModelAndView("app_page/circle/circle_classification/edit", "circleClass", circleClass);
    }
	/**
	 * 新增圈子分类方法
	 * @param circleClass 入参VO
	 * @return 执行反馈
	 */
	@RequestMapping(value="/saveOrUpdate",method=RequestMethod.POST)
	@ResponseBody
	public ResultVO addCircleClassi(CircleClassi circleClass) {
		ResultVO resultVO;
		Subject currentUser = SecurityUtils.getSubject();
        String username = currentUser.getPrincipal().toString();
        circleClass.setCreatename(username);
		if (circleClassService.save(circleClass)) {
            resultVO = ResultUtil.create(0, "保存消息成功!");
        } else {
            resultVO = ResultUtil.create(-1, "保存消息失败!");
        }
		return resultVO;
	}
	/**
     * 根据ID删除某条CircleTopic
     *
     * @param id id
     * @return 执行反馈
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO del(String id) {
        ResultVO resultVO;
        CircleClassi circleClass = circleClassService.findOne(id);
        if(StateEnum.DELETED.equals(circleClass.getStateEnum())) {
        	circleClass.setStateEnum(StateEnum.NORMAL);
        }else {
        	circleClass.setStateEnum(StateEnum.DELETED);
        }
        if (circleClassService.save(circleClass)) {
            resultVO = ResultUtil.create(0, "CircleTopic删除成功!");
        } else {
            resultVO = ResultUtil.create(-1, "CircleTopic删除失败!");
        }
        return resultVO;
    }
	
}
