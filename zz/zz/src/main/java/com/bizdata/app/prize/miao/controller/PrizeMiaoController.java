package com.bizdata.app.prize.miao.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.prize.miao.controller.vo.PrizeMiaoVO;
import com.bizdata.app.prize.miao.domain.PrizeMiao;
import com.bizdata.app.prize.miao.service.PrizeMiaoService;
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
@RequestMapping("/admin/prize_miao")
public class PrizeMiaoController {

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final PrizeMiaoService prizeMiaoService;

	@Autowired
	public PrizeMiaoController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, PrizeMiaoService prizeMiaoService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.prizeMiaoService = prizeMiaoService;
	}

	@RequiresPermissions("prize_miao:view") // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/prize/miao/list");
	}
	
	/**
	 * 展示列表数据
	 *
	 * @param jqGridPageVO
	 *            分页VO
	 * @param jqGridSortVO
	 *            排序VO
	 * @param prizeGeneralVO
	 *            banner搜索参数
	 * @return 结果list
	 */
	@RequiresPermissions("prize_miao:view") // 权限控制
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<PrizeMiao, PrizeMiao> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			PrizeMiaoVO prizeMiaoVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<PrizeMiao> PrizeMiaos = prizeMiaoService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				prizeMiaoVO);
//		for (PrizeGeneral prizeGeneral : PrizeMiaos) {
//			String[] prizeIds = prizeGeneral.getPrizeId().split(",");
//			StringBuffer prizeNames = new StringBuffer();
//			for (String prizeId : prizeIds) {
//				PrizeLibrary prizeLibrary = prizeLibraryService.findOne(Integer.valueOf(prizeId));
//				if(null != prizeLibrary) {
//					prizeNames.append(prizeLibrary.getPrizeName() + ",");
//				}
//			}
//			prizeGeneral.setPrizeName(prizeNames.substring(0, prizeNames.lastIndexOf(",")));
//		}
		return new JpaPageResultVO<>(PrizeMiaos, PrizeMiao.class);
	}
	
	/**
	 * 跳转至新增页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("prize_general:view") // 权限控制
	@RequestMapping(value = "/add_view", method = RequestMethod.GET)
	public ModelAndView addView() {
		return new ModelAndView("app_page/prize/miao/add");
	}
	
	/**
	 * prize_library新增或修改
	 *
	 * @param paoMa
	 *            实体
	 * @return 执行反馈
	 */
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO saveOrUpdate(PrizeMiao prizeMiao) {
		ResultVO resultVO = null;
		if(prizeMiaoService.save(prizeMiao)) {
			resultVO = ResultUtil.create(0, "paoMa保存成功!");
		} else {
			resultVO = ResultUtil.create(-1, "paoMa保存失败!");
		}
		return resultVO;
	}
	
	/**
	 * 跳转到编辑
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
    public ModelAndView readOne(String id) {
		PrizeMiao prizeMiao = prizeMiaoService.findOne(id);
		//prizeLibrary.setPrizeUrl(fileUploadConfig.getServerPrefix() + prizeLibrary.getPrizeUrl());
        return new ModelAndView("app_page/prize/miao/edit", "prizeMiao", prizeMiao);
    }
}
