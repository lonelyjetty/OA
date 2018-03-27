package com.bizdata.app.loseweightdata.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.bgdata.domain.BgData;
import com.bizdata.app.loseweightdata.controller.vo.SearchLoseWeightDataVO;
import com.bizdata.app.loseweightdata.domain.LoseWeightData;
import com.bizdata.app.loseweightdata.service.LoseWeightDataService;
import com.bizdata.app.maguser.domain.MagUser;
import com.bizdata.app.maguser.service.MagUserService;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 血压数据Controller
 * <p>
 * Created by sdevil507 on 2017/9/7.
 */
@Controller
@RequestMapping("/admin/loseweight_data")
public class LoseWeightDataController {

    private final LoseWeightDataService loseWeightDataService;

    private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

    private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;
    private final MagUserService magUserService;

    @Autowired
    public LoseWeightDataController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO, JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO,
    		LoseWeightDataService loseWeightDataService,MagUserService magUserService) {
        this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
        this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
        this.loseWeightDataService = loseWeightDataService;
        this.magUserService = magUserService;
    }

    /**
     * 展示对应模板页面
     *
     * @return 模板页面
     */
    @RequiresPermissions("loseweight_data:view")
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView view() {
        return new ModelAndView("app_page/loseweightdata/list");
    }

    @RequiresPermissions("loseweight_data:view")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SearchLoseWeightDataVO searchLoseWeightDataVO) {
        JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
        JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
        Page<LoseWeightData> loseWeightData = loseWeightDataService.findAllByPage(jpaPageParamVO, jpaSortParamVO, searchLoseWeightDataVO);
        for(LoseWeightData s:loseWeightData) {
			Integer m = magUserService.getAccountnumById(s.getProfileId());
			if(m!=null) {
				s.setAccountnum(m);
			}
		}
        return new JpaPageResultVO<>(loseWeightData, LoseWeightData.class);
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
    	return new ModelAndView("app_page/loseweightdata/userinfo", "data", user);
    }
}
