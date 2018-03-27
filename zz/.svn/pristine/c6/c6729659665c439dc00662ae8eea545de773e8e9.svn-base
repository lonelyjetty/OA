package com.bizdata.app.miaototal.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.miaototal.controller.vo.SearchMiaoTotalVO;
import com.bizdata.app.miaototal.page.JQGridResponse;
import com.bizdata.app.miaototal.page.JQGridSearchMiaoService;
import com.bizdata.app.miaototal.page.MiaoVO;
import com.bizdata.app.miaototal.service.MiaoTotalService;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;

@Controller
@RequestMapping("/admin/miao_total")
public class MiaoTotalController {
//	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;
//
//	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;
//	
//	private final MiaoTotalService miaoTotalService;
	private final JQGridSearchMiaoService jQGridSearchService;
	
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}
	
	@Autowired
	public MiaoTotalController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, MiaoTotalService miaoTotalService,
			JQGridSearchMiaoService jQGridSearchService) {
//		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
//		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
//		this.miaoTotalService = miaoTotalService;
		this.jQGridSearchService = jQGridSearchService;
	}
	
	@RequiresPermissions("miao_total:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/miaototal/list");
	}
	
	@RequiresPermissions("miao_total:view")
	@RequestMapping(method = RequestMethod.GET,value = "/userdetal")
	public ModelAndView userdetalview(int accountnum) {
		return new ModelAndView("app_page/miaototal/userdetal","accountnum",accountnum);
	}
	
	/**
	 * 查询分页记录
	 *
	 * @param jqGridPageVO
	 *            分页参数
	 * @param jqGridSortVO
	 *            排序参数
	 * @param searchLoseWeightDataVO
	 *            查询参数
	 * @return 分页记录
	 */
	@RequiresPermissions("miao_total:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JQGridResponse<MiaoVO> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SearchMiaoTotalVO searchMiaoTotalVO) {
		JQGridResponse response = jQGridSearchService.search(jqGridPageVO, jqGridSortVO, searchMiaoTotalVO);
		return response;
	}
	
//	/**
//	 * 查询分页记录
//	 *
//	 * @param jqGridPageVO
//	 *            分页参数
//	 * @param jqGridSortVO
//	 *            排序参数
//	 * @param searchLoseWeightDataVO
//	 *            查询参数
//	 * @return 分页记录
//	 */
//	@RequiresPermissions("miao_total:view")
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	@ResponseBody
//	public JpaPageResultVO<MiaoTotal, MiaoTotal> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SearchMiaoTotalVO searchMiaoTotalVO) {
//		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
//		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
//		Page<MiaoTotal> miaoTotal = miaoTotalService.findAllByPage(jpaPageParamVO, jpaSortParamVO, searchMiaoTotalVO);
//		
//		return new JpaPageResultVO<>(miaoTotal, MiaoTotal.class);
//	}
	
}
