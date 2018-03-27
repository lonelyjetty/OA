package com.bizdata.app.circle.report.controller;

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

import com.bizdata.app.circle.report.domain.Report;
import com.bizdata.app.circle.report.service.ReportService;
import com.bizdata.app.sleepdata.controller.vo.SleepSearchVO;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 举报管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/admin/report")
public class ReportController {

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
        binder.registerCustomEditor(Date.class, new DateEditor());
    }

    private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

    private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

    private final ReportService reportService;

    @Autowired
    public ReportController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO, JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, ReportService reportService) {
        this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
        this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
        this.reportService = reportService;
    }


    /**
     * 展示对应模板页面
     *
     * @return 模板页面
     */
    @RequiresPermissions("report:view")
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView view() {
        return new ModelAndView("app_page/circle/report/list");
    }

    /**
     * 分页查询记录
     *
     * @param jqGridPageVO  分页参数
     * @param jqGridSortVO  排序参数
     * @param sleepSearchVO 查询参数
     * @return 分页记录
     */
    @RequiresPermissions("report:view")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SleepSearchVO sleepSearchVO) {
        JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
        JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
        Page<Report> dataPage = reportService.findAllByPage(jpaPageParamVO, jpaSortParamVO, sleepSearchVO);
        return new JpaPageResultVO<>(dataPage, Report.class);
    }

}
