package com.bizdata.app.sportdata.controller;

import com.bizdata.app.bgdata.domain.BgData;
import com.bizdata.app.maguser.domain.MagUser;
import com.bizdata.app.maguser.service.MagUserService;
import com.bizdata.app.sportdata.controller.vo.SearchSportDataVO;
import com.bizdata.app.sportdata.domain.SportData;
import com.bizdata.app.sportdata.service.SportDataService;
import com.bizdata.commons.utils.*;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;
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

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 运动数据Controller
 * <p>
 * Created by sdevil507 on 2017/9/6.
 */
@Controller
@RequestMapping("/admin/sport_data")
public class SportDataController {

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
        binder.registerCustomEditor(Date.class, new DateEditor());
    }
    
    private final MagUserService magUserService;
    private final SportDataService sportDataService;

    private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

    private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

    @Autowired
    public SportDataController(JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
    		SportDataService sportDataService,MagUserService magUserService) {
        this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
        this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
        this.sportDataService = sportDataService;
        this.magUserService = magUserService;
    }

    /**
     * 展示对应模板页面
     *
     * @return 模板页面
     */
    @RequiresPermissions("sport_data:view")
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView view() {
        return new ModelAndView("app_page/sportdata/list");
    }

    /**
     * 查询分页记录
     *
     * @param jqGridPageVO      分页参数
     * @param jqGridSortVO      排序参数
     * @param searchSportDataVO 查询参数
     * @return 分页记录
     */
    @RequiresPermissions("sport_data:view")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SearchSportDataVO searchSportDataVO) {
        JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
        JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
        Page<SportData> sportData = sportDataService.findAllByPage(jpaPageParamVO, jpaSortParamVO, searchSportDataVO);
        for(SportData s:sportData) {
			Integer m = magUserService.getAccountnumById(s.getProfileId());
			if(m!=null) {
				s.setAccountnum(m);
			}
		}
        return new JpaPageResultVO<>(sportData, SportData.class);
    }

    /**
     * 根据ID获取详细运动记录
     *
     * @param id id
     * @return 模板页面
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView detail(String id) {
        SportData sportData = sportDataService.findOne(id);
        return new ModelAndView("app_page/sportdata/detail", "data", sportData);
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
