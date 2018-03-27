package com.bizdata.app.bgdata.controller;

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

import com.bizdata.app.bgdata.controller.vo.SearchBgDataVO;
import com.bizdata.app.bgdata.domain.BgData;
import com.bizdata.app.bgdata.service.BgDataService;
import com.bizdata.app.maguser.domain.MagUser;
import com.bizdata.app.maguser.service.MagUserService;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 血糖数据Controller
 * <p>
 * 
 * @author w
 * @version 1.0 Time 2017/9/11
 */
@Controller
@RequestMapping("/admin/bg_data")
public class BgDataController {
	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final BgDataService bgDataService;
	private final MagUserService magUserService;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	public BgDataController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, BgDataService bgDataService,MagUserService magUserService) {
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.bgDataService = bgDataService;
        this.magUserService = magUserService;
	}

	/**
	 * 展示相应的页面
	 * 
	 * @return 血糖数据页面
	 */
	@RequiresPermissions("bg_data:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/bgdata/list");
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
	@RequiresPermissions("bg_data:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SearchBgDataVO searchBgDataVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<BgData> bgData = bgDataService.findAllByPage(jpaPageParamVO, jpaSortParamVO, searchBgDataVO);
		for(BgData s:bgData) {
			Integer m = magUserService.getAccountnumById(s.getProfileId());
			if(m!=null) {
				s.setAccountnum(m);
			}
		}
		return new JpaPageResultVO<>(bgData, BgData.class);
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
