package com.bizdata.app.service.assess.controller;

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

import com.bizdata.app.service.assess.controller.vo.SearchAssessVO;
import com.bizdata.app.service.assess.domain.HaAssessment;
import com.bizdata.app.service.assess.service.AssessService;
import com.bizdata.commons.utils.DateEditor;
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
@RequestMapping("/admin/assess")
public class AssessController {
	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final AssessService assessService;

	private final FileUploadConfig fileUploadConfig;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	public AssessController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, AssessService assessService,
			FileUploadConfig fileUploadConfig) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.fileUploadConfig = fileUploadConfig;
		this.assessService = assessService;
	}

	@RequiresPermissions("assess:view") // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/service/assess/list");
	}

	/**
	 * 展示列表数据
	 *
	 * @param jqGridPageVO
	 *            分页VO
	 * @param jqGridSortVO
	 *            排序VO
	 * @param bannerSearchVO
	 *            banner搜索参数
	 * @return 结果list
	 */
	@RequiresPermissions("assess:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<HaAssessment, HaAssessment> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			SearchAssessVO searchAssessVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<HaAssessment> assessmentes = assessService.findAllByPage(jpaPageParamVO, jpaSortParamVO, searchAssessVO);
		for (HaAssessment assessment : assessmentes) {
			assessment.setAssessmentPic(fileUploadConfig.getServerPrefix() + assessment.getAssessmentPic());
		}
		return new JpaPageResultVO<HaAssessment, HaAssessment>(assessmentes, HaAssessment.class);
	}

	/**
	 * 跳转至新增页面
	 *
	 * @return 模板页面
	 */
	@RequestMapping(value = "/add_view", method = RequestMethod.GET)
	public ModelAndView addView() {
		System.out.println("========新建健康评估=========");
		return new ModelAndView("app_page/service/assess/add");
	}

	/**
	 * Assess新增或修改
	 *
	 * @param Assess
	 *            实体
	 * @return 执行反馈
	 */
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO saveOrUpdate(HaAssessment haAssessment) {
		ResultVO resultVO;
		if (haAssessment.getCreateTime() == null) {
			haAssessment.setCreateTime(new Date());
		}
		if (assessService.save(haAssessment)) {
			resultVO = ResultUtil.create(0, "paoMa保存成功!");
		} else {
			resultVO = ResultUtil.create(-1, "paoMa保存失败!");
		}
		return resultVO;
	}

	/**
	 * 跳转到编辑页面
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
	public ModelAndView readOne(String id) {
		HaAssessment haAssessment = assessService.findOne(id);
		haAssessment.setAssessmentPic(fileUploadConfig.getServerPrefix() + haAssessment.getAssessmentPic());
		return new ModelAndView("app_page/service/assess/edit", "haAssessment", haAssessment);
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
        HaAssessment haAssessment = assessService.findOne(id);
        String state = haAssessment.getState();	//获取状态值
        if("1".equals(state)) {
        	state = "-1";
        	haAssessment.setState(state);
        } else if(null == state) { //防止初始化时没有值
        	state = "-1";
        	haAssessment.setState(state);
        }
        if (assessService.save(haAssessment)) {
            resultVO = ResultUtil.create(0, "haAssessment删除成功!");
        } else {
            resultVO = ResultUtil.create(-1, "haAssessment删除失败!");
        }
        return resultVO;
    }

}
