package com.bizdata.app.activity.flow.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.activity.flow.controller.vo.FlowVO;
import com.bizdata.app.activity.flow.domain.Flow;
import com.bizdata.app.activity.flow.service.FlowService;
import com.bizdata.app.miaodetail.excleutil.ExcelUtil;
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
@Slf4j
@RequestMapping("/admin/flow") // 声明路径
public class FlowController {

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final FlowService flowService;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	public FlowController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, FlowService flowService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.flowService = flowService;
	}

	@RequiresPermissions("flow:view") // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/activity/flow/list");
	}

	@RequiresPermissions("flow:view") // 权限控制
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<Flow, Flow> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, FlowVO FlowVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);

		Page<Flow> flows = flowService.findAllByPage(jpaPageParamVO, jpaSortParamVO, FlowVO);
		return new JpaPageResultVO<>(flows, Flow.class);
	}

	@RequiresPermissions("hot_events:view") // 权限控制
	@RequestMapping(value = "/add_view", method = RequestMethod.GET)
	public ModelAndView addView() {
		return new ModelAndView("app_page/activity/flow/add");
	}

	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO saveOrUpdate(Flow flow) {
		ResultVO resultVO = null;
		if (null == flow.getCreateDate()) {
			flow.setCreateDate(new Date());
		}
		if (null == flow.getState()) {
			flow.setState("1");
		}
		if (flowService.save(flow)) {
			resultVO = ResultUtil.create(0, "flow保存成功!");
		} else {
			resultVO = ResultUtil.create(-1, "flow保存失败!");
		}
		return resultVO;
	}

	@RequestMapping(value = "/savefile", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO savefile(@RequestParam(value = "file", required = false) MultipartFile file) {
		ResultVO resultVO = null;
		if (null != file) {
			String name = file.getOriginalFilename();
			long size = file.getSize();
			if (name == null || ExcelUtil.EMPTY.equals(name) && size == 0) {
				resultVO = ResultUtil.create(-1, "文件上传错误");
			} else {
				try {
					InputStreamReader isr = new InputStreamReader(file.getInputStream(), "utf-8");
					BufferedReader br = new BufferedReader(isr);
					String s = null; // 每一行的字符串
					while ((s = br.readLine()) != null) {
						String mobile = s.substring(0, s.indexOf("-"));
						String value = s.substring(s.indexOf("-") + 1);
						Flow flow = new Flow();
						flow.setCreateDate(new Date());
						flow.setFaceValue(Float.valueOf(value));
						flow.setMobile(mobile);
						flow.setState("1");
						if (flowService.save(flow)) {
							resultVO = ResultUtil.create(0, "flow保存成功!");
						} else {
							resultVO = ResultUtil.create(-1, "flow保存失败!");
						}
					}
				} catch (IOException e) {
					log.error(e.getMessage());
					e.printStackTrace();
				}
			}
		}

		return resultVO;
	}
}
