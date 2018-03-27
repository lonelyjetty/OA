package com.bizdata.app.prize.general.controller;

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

import com.bizdata.app.prize.general.controller.vo.PrizeGeneralVO;
import com.bizdata.app.prize.general.domain.PrizeGeneral;
import com.bizdata.app.prize.general.service.PrizeGeneralService;
import com.bizdata.app.prize.library.domain.PrizeLibrary;
import com.bizdata.app.prize.library.service.PrizeLibraryService;
import com.bizdata.commons.utils.DateEditor;
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
@RequestMapping("/admin/prize_general")
public class PrizeGeneralController {
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final PrizeGeneralService prizeGeneralService;

	private final PrizeLibraryService prizeLibraryService;

	@Autowired
	public PrizeGeneralController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, PrizeGeneralService prizeGeneralService,
			PrizeLibraryService prizeLibraryService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.prizeGeneralService = prizeGeneralService;
		this.prizeLibraryService = prizeLibraryService;
	}

	@RequiresPermissions("prize_general:view") // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/prize/general/list");
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
	@RequiresPermissions("prize_general:view") // 权限控制
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<PrizeGeneral, PrizeGeneral> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			PrizeGeneralVO prizeGeneralVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<PrizeGeneral> prizeGenerals = prizeGeneralService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				prizeGeneralVO);
		for (PrizeGeneral prizeGeneral : prizeGenerals) {
			String[] prizeIds = prizeGeneral.getPrizeId().split(",");
			StringBuffer prizeNames = new StringBuffer();
			for (String prizeId : prizeIds) {
				PrizeLibrary prizeLibrary = prizeLibraryService.findOne(Integer.valueOf(prizeId));
				if(null != prizeLibrary) {
					prizeNames.append(prizeLibrary.getPrizeName() + ",");
				}
			}
			prizeGeneral.setPrizeName(prizeNames.substring(0, prizeNames.lastIndexOf(",")));
		}
		return new JpaPageResultVO<>(prizeGenerals, PrizeGeneral.class);
	}
	
	/**
	 * 跳转至新增页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("prize_general:view") // 权限控制
	@RequestMapping(value = "/add_view", method = RequestMethod.GET)
	public ModelAndView addView() {
		return new ModelAndView("app_page/prize/general/add");
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
	public ResultVO saveOrUpdate(PrizeGeneral prizeGeneral) {
		ResultVO resultVO = null;
//		if(null == prizeLibrary.getCreateDate()) {
//			prizeLibrary.setCreateDate(new Date());
//		}
//		String prizeContent = prizeGeneral.getPrizeContent();
//		if(null != prizeContent) {
//			String[] temp = prizeContent.split(",");	//分割字符串
//			for(int i = 0; i < temp.length; i++) {
//				if(!StringUtils.isBlank(temp[i])) { //如果该字符串不为''则必为有值
//					prizeLibrary.setPrizeContent(temp[i]);
//					break;
//				}
//			}
//					
//		}
		prizeGeneral.setUpdateDate(new Date()); //设置更新时间
		if(prizeGeneralService.save(prizeGeneral)) {
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
		PrizeGeneral prizeGeneral = prizeGeneralService.findOne(id);
		//prizeLibrary.setPrizeUrl(fileUploadConfig.getServerPrefix() + prizeLibrary.getPrizeUrl());
        return new ModelAndView("app_page/prize/general/edit", "prizeGeneral", prizeGeneral);
    }

}
