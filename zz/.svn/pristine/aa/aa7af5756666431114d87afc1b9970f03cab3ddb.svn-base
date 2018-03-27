package com.bizdata.app.circle.report.service;


import org.springframework.data.domain.Page;

import com.bizdata.app.circle.report.domain.Report;
import com.bizdata.app.sleepdata.controller.vo.SleepSearchVO;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 
 * @author Administrator
 *
 */
public interface ReportService {

    /**
     * 分页展示记录
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param sleepSearchVO  查询参数
     * @return 分页记录
     */
    Page<Report> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, SleepSearchVO sleepSearchVO);
}
