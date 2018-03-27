package com.bizdata.app.activity.paoma.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import com.bizdata.app.activity.paoma.controller.vo.PaoMaVO;
import com.bizdata.app.activity.paoma.controller.vo.SearchPaoMaVO;
import com.bizdata.app.activity.paoma.domain.PaoMa;
import com.bizdata.app.activity.paoma.domain.PaoMaMapPrize;
import com.bizdata.app.activity.paoma.service.ActivityPaoMaService;
import com.bizdata.app.activity.paoma.service.PaoMaMapPersonService;
import com.bizdata.app.activity.paoma.service.PaoMaMapPrizeService;
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
@RequestMapping("/admin/paoma") // 声明路径
@Slf4j
public class ActivityPaoMaController {
	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final ActivityPaoMaService activityPaoMaService;

	private final PaoMaMapPersonService paoMaMapPersonService;

	private final PaoMaMapPrizeService paoMaMapPrizeService;

	private final FileUploadConfig fileUploadConfig;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	public ActivityPaoMaController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, ActivityPaoMaService activityPaoMaService,
			FileUploadConfig fileUploadConfig, PaoMaMapPersonService paoMaMapPersonService,
			PaoMaMapPrizeService paoMaMapPrizeService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.fileUploadConfig = fileUploadConfig;
		this.activityPaoMaService = activityPaoMaService;
		this.paoMaMapPersonService = paoMaMapPersonService;
		this.paoMaMapPrizeService = paoMaMapPrizeService;
	}

	@RequiresPermissions("paoma:view") // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/activity/paoma/list");
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
	@RequiresPermissions("paoma:view") // 权限控制
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<PaoMa, PaoMa> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			SearchPaoMaVO searchPaoMaVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<PaoMa> paoMas = activityPaoMaService.findAllByPage(jpaPageParamVO, jpaSortParamVO, searchPaoMaVO);
		for (PaoMa paoMa : paoMas) {
			paoMa.setPicUrl(fileUploadConfig.getServerPrefix() + paoMa.getPicUrl());
			int peopleNum = paoMaMapPersonService.getPeople(paoMa.getId());
			paoMa.setPeopleNum(peopleNum);
		}
		return new JpaPageResultVO<>(paoMas, PaoMa.class);
	}

	/**
	 * 跳转至新增页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("paoma:view") // 权限控制
	@RequestMapping(value = "/add_view", method = RequestMethod.GET)
	public ModelAndView addView() {
		System.out.println("========新建活动问题=========");
		String no = activityPaoMaService.getMaxNo(); // 获取当前跑马圈表中最大的NO
		// 为号码添加前缀
		char[] noes = no.toCharArray();
		if (noes.length == 1) {
			no = "00" + no;
		} else if (noes.length == 2) {
			no = "0" + no;
		}
		// 为页面中传活动序号
		Map<String, String> map = new HashMap<String, String>();
		map.put("no", no);
		System.out.println(no);
		return new ModelAndView("app_page/activity/paoma/add", map);
	}

	/**
	 * PaoMa新增或修改
	 *
	 * @param paoMa
	 *            实体
	 * @return 执行反馈
	 */
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO saveOrUpdate(PaoMa PaoMa) {
		ResultVO resultVO = null;

		if (activityPaoMaService.save(PaoMa)) {
			resultVO = ResultUtil.create(0, "paoMa保存成功!");
		} else {
			resultVO = ResultUtil.create(-1, "paoMa保存失败!");
		}
		return resultVO;
	}

	/**
	 * PaoMa新增或修改
	 *
	 * @param paoMa
	 *            实体
	 * @return 执行反馈
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO save(PaoMaVO paoMaVO) {
		ResultVO resultVO = null;
		// System.out.println(prizeLibrary.getPrizeName());
		if (activityPaoMaService.save(paoMaVO.getPaoMa())) {
			List<PaoMaMapPrize> prizes = paoMaVO.getPaoMaMapPrizes();
			for (PaoMaMapPrize temp : prizes) {
				// 为其赋值活动id 进行关联
				if(null != temp.getPrizeName()) {
					temp.setActivityId(paoMaVO.getPaoMa().getId());
					if (!paoMaMapPrizeService.saveOrUpdate(temp)) {
						resultVO = ResultUtil.create(-1, "paoMa保存失败!");
					} else {
						resultVO = ResultUtil.create(0, "paoMa保存成功!");
					}
				}
			}
		} else {
			resultVO = ResultUtil.create(-1, "paoMa保存失败!");
		}
		return resultVO;
	}

	/**
	 * 进入具体一个编辑页面
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
	public ModelAndView readOne(String id) {
		PaoMa paoMa = activityPaoMaService.findOne(id);
		paoMa.setPrizeUrl(fileUploadConfig.getServerPrefix() + paoMa.getPrizeUrl());
		paoMa.setPicUrl(fileUploadConfig.getServerPrefix() + paoMa.getPicUrl());
		List<PaoMaMapPrize> paoMaMapPrizes = paoMaMapPrizeService.findByActivityId(id);
		for(PaoMaMapPrize paoMaMapPrize : paoMaMapPrizes) {
			paoMaMapPrize.setPicUrl(fileUploadConfig.getServerPrefix() + paoMaMapPrize.getPicUrl());
		}
		PaoMaVO paoMaVO = new PaoMaVO();
		paoMaVO.setPaoMa(paoMa);
		if(null != paoMaMapPrizes && !paoMaMapPrizes.isEmpty()) {
			paoMaVO.setPaoMaMapPrizes(paoMaMapPrizes);
		}
		return new ModelAndView("app_page/activity/paoma/edit", "paoMaVO", paoMaVO);
	}

	/**
	 * 置顶操作
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/stick", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO stick(String id) {
		ResultVO resultVO;

		PaoMa paoMa = activityPaoMaService.findOne(id);
		if (null != paoMa) {
			if ("0".equals(paoMa.getIsStick())) {
				System.out.println("该活动由不置顶变为置顶");
				paoMa.setIsStick("1");
			} else if ("1".equals(paoMa.getIsStick())) {
				System.out.println("该活动由置顶变为不置顶");
				paoMa.setIsStick("0");
			} else {
				// 如果都没有则默认设置为不置顶
				paoMa.setIsStick("0");
			}

			boolean result = activityPaoMaService.save(paoMa);
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
	 * 上下线功能
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/line", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO line(String id) {
		ResultVO resultVO;

		PaoMa paoMa = activityPaoMaService.findOne(id);
		if (null != paoMa) {
			if ("1".equals(paoMa.getState())) {
				System.out.println("该活动由下线变为上线");
				paoMa.setState("0");
			} else if ("0".equals(paoMa.getState())) {
				System.out.println("该活动由上线变为下线");
				paoMa.setState("1");
			} else {
				// 如果都没有则默认设置上线
				paoMa.setState("0");
			}

			boolean result = activityPaoMaService.save(paoMa);
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
