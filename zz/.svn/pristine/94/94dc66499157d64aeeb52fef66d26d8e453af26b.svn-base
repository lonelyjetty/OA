package com.bizdata.app.temperaturedata.controller;

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

import com.bizdata.app.bgdata.domain.BgData;
import com.bizdata.app.maguser.domain.MagUser;
import com.bizdata.app.maguser.service.MagUserService;
import com.bizdata.app.temperaturedata.controller.vo.SearchTemDataVO;
import com.bizdata.app.temperaturedata.domain.TemData;
import com.bizdata.app.temperaturedata.service.TemDataService;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 体温数据Controller
 * <p>
 * 
 * @author 
 */
@Controller
@RequestMapping("/admin/temperature_data")
public class TemDataController {
	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final TemDataService temDataService;
	private final MagUserService magUserService;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	public TemDataController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, TemDataService temDataService,MagUserService magUserService) {
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.temDataService = temDataService;
        this.magUserService = magUserService;
	}

	/**
	 * 展示相应的页面
	 * 
	 * @return 血糖数据页面
	 */
	@RequiresPermissions("temperature_data:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/temperature/list");
	}

	/**
	 * 查询分页记录
	 *
	 * @param jqGridPageVO
	 *            分页参数
	 * @param jqGridSortVO
	 *            排序参数
	 * @param searchSportDataVO
	 *            查询参数
	 * @return 分页记录
	 */
	@RequiresPermissions("temperature_data:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<TemData, TemData> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SearchTemDataVO searchTemDataVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		System.out.println("数据列表开始！");
		Page<TemData> temData = temDataService.findAllByPage(jpaPageParamVO, jpaSortParamVO, searchTemDataVO);
		for(TemData s:temData) {
			Integer m = magUserService.getAccountnumById(s.getProfileId());
			if(m!=null) {
				s.setAccountnum(m);
			}
		}
		return new JpaPageResultVO<>(temData, TemData.class);
	}
	/**
     * 根据ID获取详细用户信息详情
     *
     * @param id id
     * @return 模板页面
     */
    @RequestMapping(value = "/UserInfo", method = RequestMethod.GET)
    public ModelAndView UserInfo(String id) {
    	MagUser user = magUserService.getUserInfo(id);
    	return new ModelAndView("app_page/sportdata/userinfo", "data", user);
    }
}
