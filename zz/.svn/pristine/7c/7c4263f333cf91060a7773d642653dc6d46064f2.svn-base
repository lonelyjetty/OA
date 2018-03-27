package com.bizdata.app.homelocation.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.banner.domain.Banner;
import com.bizdata.app.content.article.domain.Article;
import com.bizdata.app.homelocation.controller.vo.SearchHomeLocationVO;
import com.bizdata.app.homelocation.domain.HomeLocation;
import com.bizdata.app.homelocation.service.HomeLocationService;
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
@RequestMapping("/admin/home_location")
public class HomeLocationController {
	private final HomeLocationService homeLocationService;

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final FileUploadConfig fileUploadConfig;

	@Autowired
	public HomeLocationController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, HomeLocationService homeLocationService,FileUploadConfig fileUploadConfig) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.homeLocationService = homeLocationService;
		this.fileUploadConfig = fileUploadConfig;
	}

	/**
	 * 展示对应模板页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("home_location:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/homelocation/list");
	}

	@RequiresPermissions("home_location:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			SearchHomeLocationVO searchHomeLocationVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<HomeLocation> homeLocation = homeLocationService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				searchHomeLocationVO);
		for (HomeLocation home : homeLocation) {
			home.setLocationPicture(fileUploadConfig.getServerPrefix() + home.getLocationPicture());
        }
		return new JpaPageResultVO<>(homeLocation, HomeLocation.class);
	}
	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
    public ModelAndView editView(String id) {
        System.out.println(id);
        HomeLocation home = homeLocationService.findOne(id);
        home.setLocationPicture(fileUploadConfig.getServerPrefix() + home.getLocationPicture());
        return new ModelAndView("app_page/homelocation/edit", "home", home);
    }
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO saveOrUpdate(HomeLocation home) {
        ResultVO resultVO;
        if (homeLocationService.save(home)) {
            resultVO = ResultUtil.create(0, "Banner保存成功!");
        } else {
            resultVO = ResultUtil.create(-1, "Banner保存失败!");
        }
        return resultVO;
    }

}
