package com.bizdata.app.service.option.controller;

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

import com.bizdata.app.service.option.controller.vo.SearchOptionVO;
import com.bizdata.app.service.option.domain.HAQuestionOption;
import com.bizdata.app.service.option.domain.HaOption;
import com.bizdata.app.service.option.service.OptionService;
import com.bizdata.app.service.option.service.OptionToQuestionService;
import com.bizdata.app.service.question.domain.HaAssessmentQuestion;
import com.bizdata.app.service.question.domain.HaQuestion;
import com.bizdata.app.service.question.service.AssessToQuestionService;
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
@RequestMapping("/admin/assess/option")
@Slf4j
public class OptionController {
	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final FileUploadConfig fileUploadConfig;

	private final OptionService optionService;

	private final OptionToQuestionService optionToQuestionService;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	public OptionController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, OptionService optionService,
			FileUploadConfig fileUploadConfig, OptionToQuestionService optionToQuestionService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.fileUploadConfig = fileUploadConfig;
		this.optionService = optionService;
		this.optionToQuestionService = optionToQuestionService;
	}

	@RequiresPermissions("assess:view") // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view(String id) {
		System.out.println(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		return new ModelAndView("app_page/service/option/list", map);
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
	public JpaPageResultVO<HaOption, HaOption> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			SearchOptionVO searchOptionVO) {
		log.debug("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		log.info("问题主键:" + searchOptionVO.getQuestionId());
		Page<HaOption> haOptiones = optionService.findAllByPage(jpaPageParamVO, jpaSortParamVO, searchOptionVO);
		for (HaOption haOption : haOptiones) {
			haOption.setSkipCode(optionToQuestionService.getSkipCode(haOption.getId(), searchOptionVO.getQuestionId()));
			haOption.setToQuestionCode(
					optionToQuestionService.getToQuestionCode(haOption.getId(), searchOptionVO.getQuestionId()));
		}
		return new JpaPageResultVO<HaOption, HaOption>(haOptiones, HaOption.class);
	}

	/**
	 * 跳转至新增页面
	 *
	 * @return 模板页面
	 */
	@RequestMapping(value = "/add_view", method = RequestMethod.GET)
	public ModelAndView addView(String id) {
		// System.out.println("========新建健康评估=========");
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		return new ModelAndView("app_page/service/option/add", map);
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
	public ResultVO saveOrUpdate(HaOption haOption) {
		ResultVO resultVO;
		// 设置创建时间
		if (haOption.getCreateTime() == null) {
			haOption.setCreateTime(new Date());
		}
		// 保存问题和选项之间的关联
		String questionId = haOption.getQuestionId(); // 对应的评估主键
		if (null != questionId && !"".equals(questionId)) {
			if (optionService.save(haOption)) {
				HAQuestionOption hAQuestionOption = optionToQuestionService.findByOptionId(haOption.getId());
				if(null == hAQuestionOption) {
					hAQuestionOption = new HAQuestionOption();
					hAQuestionOption.setQuestionId(questionId);
					hAQuestionOption.setOption(haOption);
					hAQuestionOption.setToQuestionCode(haOption.getSkipCode());
					hAQuestionOption.setScore(haOption.getToQuestionCode());
					
					if (optionToQuestionService.save(hAQuestionOption)) {
						resultVO = ResultUtil.create(0, "hAQuestionOption保存成功!");
					} else {
						resultVO = ResultUtil.create(-1, "hAQuestionOption保存失败!");
					}
				} else {
					resultVO = ResultUtil.create(0, "成功");
				}
			} else {
				resultVO = ResultUtil.create(-1, "haOption保存失败!");
			}
		} else {
			resultVO = ResultUtil.create(-1, "questionId为空!");
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
		if (optionService.delete(id)) {
			resultVO = ResultUtil.create(0, "HaOption删除成功!");
		} else {
			resultVO = ResultUtil.create(-1, "HaOption删除失败!");
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
	public ModelAndView readOne(String param) {
		String[] params = param.split(",");
		String id = params[0];
		String questionId = params[1];
		HaOption haOption = optionService.findOne(id);
		haOption.setSkipCode(optionToQuestionService.getSkipCode(haOption.getId(), questionId));
		haOption.setToQuestionCode(optionToQuestionService.getToQuestionCode(haOption.getId(), questionId));
		// boot.setPicUrl(fileUploadConfig.getServerPrefix() +
		// boot.getPicUrl());
		haOption.setQuestionId(questionId);
		return new ModelAndView("app_page/service/option/edit", "haOption", haOption);
	}
}
