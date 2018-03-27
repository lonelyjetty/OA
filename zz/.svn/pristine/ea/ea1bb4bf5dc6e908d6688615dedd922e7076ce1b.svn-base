package com.bizdata.app.sleepdata.controller;

import com.bizdata.app.bgdata.domain.BgData;
import com.bizdata.app.maguser.domain.MagUser;
import com.bizdata.app.maguser.service.MagUserService;
import com.bizdata.app.sleepdata.controller.vo.SleepSearchVO;
import com.bizdata.app.sleepdata.domain.SleepData;
import com.bizdata.app.sleepdata.service.SleepDataService;
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
 * 睡眠数据Controller
 * <p>
 * Created by sdevil507 on 2017/9/6.
 */
@Controller
@RequestMapping("/admin/sleep_data")
public class SleepDataController {

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
        binder.registerCustomEditor(Date.class, new DateEditor());
    }

    private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

    private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

    private final SleepDataService sleepDataService;
    private final MagUserService magUserService;

    @Autowired
    public SleepDataController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
    		JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, SleepDataService sleepDataService,MagUserService magUserService) {
        this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
        this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
        this.sleepDataService = sleepDataService;
        this.magUserService = magUserService;
    }


    /**
     * 展示对应模板页面
     *
     * @return 模板页面
     */
    @RequiresPermissions("sleep_data:view")
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView view() {
        return new ModelAndView("app_page/sleepdata/list");
    }

    /**
     * 分页查询记录
     *
     * @param jqGridPageVO  分页参数
     * @param jqGridSortVO  排序参数
     * @param sleepSearchVO 查询参数
     * @return 分页记录
     */
    @RequiresPermissions("sleep_data:view")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SleepSearchVO sleepSearchVO) {
        JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
        JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
        Page<SleepData> dataPage = sleepDataService.findAllByPage(jpaPageParamVO, jpaSortParamVO, sleepSearchVO);
        for(SleepData s:dataPage) {
			Integer m = magUserService.getAccountnumById(s.getProfileId());
			if(m!=null) {
				s.setAccountnum(m);
			}
		}
        return new JpaPageResultVO<>(dataPage, SleepData.class);
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
