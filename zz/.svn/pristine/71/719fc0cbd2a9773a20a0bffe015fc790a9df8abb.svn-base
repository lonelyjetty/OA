package com.bizdata.app.service.question.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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

import com.bizdata.app.service.question.controller.vo.SearchQuestionVO;
import com.bizdata.app.service.question.domain.HaAssessmentQuestion;
import com.bizdata.app.service.question.domain.HaQuestion;
import com.bizdata.app.service.question.service.AssessToQuestionService;
import com.bizdata.app.service.question.service.QuestionService;
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
@RequestMapping("/admin/assess/question")
@Slf4j
public class QuestionController {
	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final FileUploadConfig fileUploadConfig;

	private final QuestionService questionService;

	private final AssessToQuestionService assessToQuestionService;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	public QuestionController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, QuestionService questionService,
			FileUploadConfig fileUploadConfig, AssessToQuestionService assessToQuestionService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.fileUploadConfig = fileUploadConfig;
		this.questionService = questionService;
		this.assessToQuestionService = assessToQuestionService;
	}

	@RequiresPermissions("assess:view") // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view(String id) {
		System.out.println(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		return new ModelAndView("app_page/service/question/list", map);
	}

	/**
	 * 展示列表数据
	 *
	 * @param jqGridPageVO
	 *            分页VO
	 * @param jqGridSortVO
	 *            排序VO
	 * @param searchQuestionVO
	 *            问题搜索参数
	 * @return 结果list
	 */
	@RequiresPermissions("assess:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<HaQuestion, HaQuestion> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			SearchQuestionVO searchQuestionVO) {
		log.debug("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		log.info("评估主键:" + searchQuestionVO.getAssessmentId());
		Page<HaQuestion> haQuestiones = questionService.findAllByPage(jpaPageParamVO, jpaSortParamVO, searchQuestionVO);
		// System.out.println(haQuestiones.getSize());
		return new JpaPageResultVO<HaQuestion, HaQuestion>(haQuestiones, HaQuestion.class);
	}

	/**
	 * 跳转至新增页面
	 *
	 * @return 模板页面
	 */
	@RequestMapping(value = "/add_view", method = RequestMethod.GET)
	public ModelAndView addView(String id) {
		System.out.println("========新建健康评估=========");
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		return new ModelAndView("app_page/service/question/add", map);
	}

	/**
	 * Question新增或修改
	 *
	 * @param Assess
	 *            实体
	 * @return 执行反馈
	 */
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO saveOrUpdate(HaQuestion haQuestion) {
		ResultVO resultVO;
		// 设置创建时间
		if (haQuestion.getCreateTime() == null) {
			haQuestion.setCreateTime(new Date());
		}
		// 保存问题和评估之间的关联
		String assessmentId = haQuestion.getAssessmentId(); // 对应的评估主键
		if (null != assessmentId && !"".equals(assessmentId)) {
			if (questionService.save(haQuestion)) {
				HaAssessmentQuestion haAssessmentQuestion = assessToQuestionService.findById(haQuestion.getId());
				if (null == haAssessmentQuestion) {
					haAssessmentQuestion = new HaAssessmentQuestion();
					haAssessmentQuestion.setAssessmentId(assessmentId);
					haAssessmentQuestion.setQuestion(haQuestion);
					if (assessToQuestionService.save(haAssessmentQuestion)) {
						resultVO = ResultUtil.create(0, "haAssessmentQuestion保存成功!");
					} else {
						resultVO = ResultUtil.create(-1, "haAssessmentQuestion保存失败!");
					}
				}
				resultVO = ResultUtil.create(0, "修改成功");
			} else {
				resultVO = ResultUtil.create(-1, "paoMa保存失败!");
			}
		} else {
			resultVO = ResultUtil.create(-1, "assessmentId为空!");
		}

		return resultVO;
	}

	/**
	 * 删除操作,将状态改变
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO del(String id) {
		ResultVO resultVO;
		HaQuestion haQuestion = questionService.findOne(id);
		String state = haQuestion.getState();
		if ("1".equals(state)) {
			state = "-1";
			haQuestion.setState(state);
		} else if (null == state || "".equals(state)) { // 如果原本没有
			state = "-1";
			haQuestion.setState(state);
		}
		if (questionService.save(haQuestion)) {
			resultVO = ResultUtil.create(0, "删除成功!");
		} else {
			resultVO = ResultUtil.create(-1, "删除失败!");
		}
		return resultVO;
	}

	/**
	 * 编辑页面
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
	public ModelAndView readOne(String params) {
		String[] param = params.split(",");
		String id = param[0];
		String assessmentId = param[1];
		HaQuestion haQuestion = questionService.findOne(id);
		// boot.setPicUrl(fileUploadConfig.getServerPrefix() +
		// boot.getPicUrl());
		haQuestion.setAssessmentId(assessmentId);
		return new ModelAndView("app_page/service/question/edit", "haQuestion", haQuestion);
	}
}
