package com.bizdata.app.sleepdata.service;


import com.bizdata.app.sleepdata.controller.vo.SleepSearchVO;
import com.bizdata.app.sleepdata.domain.SleepData;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;
import org.springframework.data.domain.Page;

/**
 * SleepDataService
 * <p>
 * Created by sdevil507 on 2017/9/6.
 */
public interface SleepDataService {

    /**
     * 分页展示记录
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param sleepSearchVO  查询参数
     * @return 分页记录
     */
    Page<SleepData> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, SleepSearchVO sleepSearchVO);
}
