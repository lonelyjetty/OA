package com.bizdata.app.activity.lotto.controller;

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

import com.bizdata.app.activity.lotto.controller.vo.LottoVO;
import com.bizdata.app.activity.lotto.domain.Lotto;
import com.bizdata.app.activity.lotto.service.LottoService;
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
@Slf4j
@RequestMapping("/admin/lotto") // 声明路径
public class LottoController {

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final LottoService lottoService;

	private final FileUploadConfig fileUploadConfig;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	public LottoController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, LottoService lottoService,
			FileUploadConfig fileUploadConfig) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.lottoService = lottoService;
		this.fileUploadConfig = fileUploadConfig;
	}

	@RequiresPermissions("lotto:view") // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/activity/lotto/list");
	}

	@RequiresPermissions("lotto:view") // 权限控制
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<Lotto, Lotto> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, LottoVO LottoVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);

		Page<Lotto> lottoes = lottoService.findAllByPage(jpaPageParamVO, jpaSortParamVO, LottoVO);
		for (Lotto lotto : lottoes) {
			lotto.setPicUrl(fileUploadConfig.getServerPrefix() + lotto.getPicUrl());
		}
		return new JpaPageResultVO<>(lottoes, Lotto.class);
	}

	@RequiresPermissions("lotto:view") // 权限控制
	@RequestMapping(value = "/add_view", method = RequestMethod.GET)
	public ModelAndView addView() {
		return new ModelAndView("app_page/activity/lotto/add");
	}

	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO saveOrUpdate(Lotto lotto) {
		ResultVO resultVO = null;
		if (lottoService.save(lotto)) {
			resultVO = ResultUtil.create(0, "lotto保存成功!");
		} else {
			resultVO = ResultUtil.create(-1, "lotto保存失败!");
		}
		return resultVO;
	}

	@RequiresPermissions("lotto:view")
	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
	public ModelAndView readOne(String id) {
		Lotto lotto = lottoService.findOne(id);
		lotto.setPicUrl(fileUploadConfig.getServerPrefix() + lotto.getPicUrl());
		return new ModelAndView("app_page/activity/lotto/edit", "lotto", lotto);
	}

	@RequestMapping(value = "/del", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO del(String id) {
		ResultVO resultVO;

		Lotto lotto = lottoService.findOne(id);
		if (null != lotto) {
			if ("1".equals(lotto.getState())) {
				System.out.println("该活动由上线变为下线");
				lotto.setState("-1");
			} else if ("-1".equals(lotto.getState())) {
				System.out.println("该活动由下线变为上线");
				lotto.setState("1");
			}

			boolean result = lottoService.save(lotto);
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
	
	/**
	 * 判断序号是否存在
	 * @param value
	 * @return
	 */
	@RequestMapping(value = "/sortNoRetition", method = RequestMethod.POST)
	@ResponseBody
	public String sortNoRetition(String value) {
		Lotto lotto = lottoService.findFirstBySortNo(Integer.valueOf(value));
		if(null == lotto) {
			return "true";
		} else {
			return "false";
		}
	}
}
