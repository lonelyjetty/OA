package com.bizdata.app.circle.circle_mag.controller;

import java.util.Date;
import java.util.Map;

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

import com.bizdata.app.circle.circle_classification.domain.CircleClassi;
import com.bizdata.app.circle.circle_classification.service.CircleClassiService;
import com.bizdata.app.circle.circle_mag.controller.vo.SearchCircleVO;
import com.bizdata.app.circle.circle_mag.domain.Circle;
import com.bizdata.app.circle.circle_mag.service.CircleService;
import com.bizdata.app.circle.circletopic.domain.CircleTopic;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;
import com.bizdata.config.FileUploadConfig;

import me.sdevil507.resp.ResultUtil;
import me.sdevil507.resp.ResultVO;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

@Controller
@RequestMapping("/admin/circle_mag")
public class CircleController {
	private final CircleService circleClassService;

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;
	
	private final FileUploadConfig fileUploadConfig;
	private final CircleClassiService circleClassiService;

	@Autowired
	public CircleController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,CircleClassiService circleClassiService,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, CircleService circleClassService,FileUploadConfig fileUploadConfig) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.circleClassService = circleClassService;
		this.fileUploadConfig = fileUploadConfig;
		this.circleClassiService =circleClassiService;
	}

	/**
	 * 展示对应模板页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("circle_mag:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		Map<String, String> map = circleClassiService.findNameAndId();
		return new ModelAndView("app_page/circle/circle_mag/list","map",map);
	}
	
	
	@RequiresPermissions("circle_mag:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			SearchCircleVO searchcircleClassVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<Circle> circleClass = circleClassService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				searchcircleClassVO);
		for(Circle circle:circleClass) {
			circle.setLogo(fileUploadConfig.getServerPrefix() + circle.getLogo());
			circle.setClassiname(circleClassiService.getNameById(circle.getCircleclassid()));
		}
		return new JpaPageResultVO<>(circleClass, Circle.class);
	}
	
	/**
     * 新增记录页面
     *
     * @return 页面
     */
	@RequestMapping(value="/add_view",method=RequestMethod.GET)
	public ModelAndView addView() {
		Map<String, String> map = circleClassiService.findNameAndId();
		return new ModelAndView("app_page/circle/circle_mag/add","map",map);
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
        Circle circle = circleClassService.findOne(id);
		circle.setLogo(fileUploadConfig.getServerPrefix() + circle.getLogo());
		circle.setClassiname(circleClassiService.getNameById(circle.getCircleclassid()));
        return new ModelAndView("app_page/circle/circle_mag/edit", "circle", circle);
    }
    @RequestMapping(value = "/choosecircle", method = RequestMethod.GET)
    @ResponseBody
    public Map<String,String> changecircle(String classid){
    	Map<String,String> ss = circleClassiService.findNameAndId();
    	return ss;
    }
	/**
	 * 新增消息方法
	 * @param circleClass 入参VO
	 * @return 执行反馈
	 */
	@RequestMapping(value="/saveOrUpdate",method=RequestMethod.POST)
	@ResponseBody
	public ResultVO addCircle(Circle circleClass) {
		ResultVO resultVO;
		if(circleClass.getCircle_id()==0) {
			int k = circleClassService.getMaxcircleid();
			circleClass.setCircle_id(k+1);
			Subject currentUser = SecurityUtils.getSubject();
			circleClass.setCreate_name(currentUser.getPrincipal().toString());
		}
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
        Circle s = circleClassService.findOne(id);
        if(0==s.getState()) {
        	s.setState(1);
        }else {        	
        	s.setState(0);
        }
        if (circleClassService.save(s)) {
            resultVO = ResultUtil.create(0, "CircleTopic删除成功!");
        } else {
            resultVO = ResultUtil.create(-1, "CircleTopic删除失败!");
        }
        return resultVO;
    }
	
}
