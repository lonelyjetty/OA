package com.bizdata.app.prize.sign.controller;

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

import com.bizdata.app.maguser.service.UserProfileService;
import com.bizdata.app.prize.library.service.PrizeLibraryService;
import com.bizdata.app.prize.sign.controller.vo.PrizeSignVO;
import com.bizdata.app.prize.sign.domain.PrizeSign;
import com.bizdata.app.prize.sign.service.PrizeSignService;
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
@RequestMapping("/admin/prize_sign")
public class PrizeSignController {
	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final PrizeSignService prizeSignService;

	private final PrizeLibraryService prizeLibraryService;

	private final UserProfileService userProfileService;

	private final FileUploadConfig fileUploadConfig;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	public PrizeSignController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, PrizeSignService prizeSignService,
			PrizeLibraryService prizeLibraryService, UserProfileService userProfileService,
			FileUploadConfig fileUploadConfig) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.prizeSignService = prizeSignService;
		this.prizeLibraryService = prizeLibraryService;
		this.userProfileService = userProfileService;
		this.fileUploadConfig = fileUploadConfig;
	}

	@RequiresPermissions("prize_sign:view") // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/prize/sign/list");
	}

	@RequiresPermissions("prize_sign:view") // 权限控制
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<PrizeSign, PrizeSign> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			PrizeSignVO prizeSignVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<PrizeSign> prizeSigns = prizeSignService.findAllByPage(jpaPageParamVO, jpaSortParamVO, prizeSignVO);
		for (PrizeSign prizeSign : prizeSigns) {
			String userId = prizeSign.getUserId();
			String userName = userProfileService.findByAccountId(userId).getNickName(); // 用户昵称
			prizeSign.setUserName(userName);
			Integer prizeId = prizeSign.getPrizeId();
			String prizeName = prizeLibraryService.findOne(prizeId).getPrizeName();
			prizeSign.setPrizeName(prizeName);
		}
		return new JpaPageResultVO<>(prizeSigns, PrizeSign.class);
	}

	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO saveOrUpdate(PrizeSign prizeSign) {
		ResultVO resultVO = null;
		prizeSign.setUpdateDate(new Date());
		if (prizeSignService.save(prizeSign)) {
			resultVO = ResultUtil.create(0, "prizeSign保存成功!");
		} else {
			resultVO = ResultUtil.create(-1, "prizeSign保存失败!");
		}
		return resultVO;
	}

	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
	public ModelAndView editView(String id) {
		PrizeSign prizeSign = prizeSignService.findOne(id);
		prizeSign.setPicUrl(fileUploadConfig.getServerPrefix() + prizeSign.getPicUrl());
		return new ModelAndView("app_page/prize/sign/edit", "prizeSign", prizeSign);
	}
}
