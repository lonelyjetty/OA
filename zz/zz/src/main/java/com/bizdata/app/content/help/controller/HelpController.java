package com.bizdata.app.content.help.controller;

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

import com.bizdata.app.content.help.controller.vo.SearchHelpFAQVO;
import com.bizdata.app.content.help.domain.Help;
import com.bizdata.app.content.help.service.ContentHelpService;
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
@RequestMapping("/admin/helpqa") // 提供映射(注意路径)
@Slf4j
public class HelpController {

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final ContentHelpService contentHelpService;

	@Autowired
	public HelpController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, ContentHelpService contentHelpService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.contentHelpService = contentHelpService;
	}

	/**
	 * 显示页面
	 * 
	 * @return
	 */
	@RequiresPermissions("helpqa:view") // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		System.out.println("========帮助QA页面=========");
		return new ModelAndView("app_page/content/help/list");
	}

	@RequiresPermissions("helpqa:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SearchHelpFAQVO searchFAQVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<Help> help = contentHelpService.findAllByPage(jpaPageParamVO, jpaSortParamVO, searchFAQVO);
		return new JpaPageResultVO<>(help, Help.class);
	}

	/**
	 * 跳转至新增页面
	 *
	 * @return 模板页面
	 */
	@RequestMapping(value = "/add_view", method = RequestMethod.GET)
	public ModelAndView addView() {
		System.out.println("========编辑问题页面=========");
		return new ModelAndView("app_page/content/help/add");
	}

	/**
	 * Help新增或修改
	 *
	 * @param help
	 *            实体
	 * @return 执行反馈
	 */
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO saveOrUpdate(Help help) {
		// System.out.println(help.getAnswer() + " ===== 答案");
		// System.out.println(help.getQuestion() + " ===== 问题");

		if (help.getCreateDate() == null) {
			// 设置时间
			Date nowDate = new Date();
			help.setCreateDate(nowDate);
		}
		ResultVO resultVO;
		if (contentHelpService.save(help)) {
			resultVO = ResultUtil.create(0, "Help保存成功!");
		} else {
			resultVO = ResultUtil.create(-1, "Help保存失败!");
		}
		return resultVO;
	}

	/**
	 * 根据ID跳转至编辑页面
	 *
	 * @param id
	 *            id
	 * @return 模板页面
	 */
	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
	public ModelAndView editView(String id) {
		System.out.println(id);
		Help help = contentHelpService.findOne(id);
		return new ModelAndView("app_page/content/help/edit", "help", help);
	}

	/**
	 * 上下线功能
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/line", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO line(String id) {
		ResultVO resultVO;

		Help help = contentHelpService.findOne(id);
		if (null != help) {
			if ("1".equals(help.getState())) {
				System.out.println("该问题由上线变为下线");
				help.setState("-1");
			} else if ("-1".equals(help.getState())) {
				System.out.println("该问题由下线变为上线");
				help.setState("1");
			} else {
				// 如果都没有则默认设置上线
				help.setState("1");
			}

			boolean result = contentHelpService.save(help);
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
