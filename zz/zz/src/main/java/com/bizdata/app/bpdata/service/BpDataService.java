package com.bizdata.app.bpdata.service;

import com.bizdata.app.bpdata.controller.vo.SearchBpDataVO;
import com.bizdata.app.bpdata.domain.BpData;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;
import org.springframework.data.domain.Page;

/**
 * BpDataService
 * <p>
 * Created by sdevil507 on 2017/9/7.
 */
public interface BpDataService {

    /**
     * 分页展示记录
     *
     * @param jpaPageParamVO 分页入参
     * @param jpaSortParamVO 排序入参
     * @param searchBpDataVO 查询条件
     * @return 分页记录
     */
    Page<BpData> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, SearchBpDataVO searchBpDataVO);
}
