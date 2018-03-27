package com.bizdata.app.temperaturedata.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.temperaturedata.controller.vo.SearchTemDataVO;
import com.bizdata.app.temperaturedata.domain.TemData;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface TemDataService {
	
	 /**
     * 分页查询
     *
     * @param jpaPageParamVO    分页参数
     * @param jpaSortParamVO    排序参数
     * @param searchTemDataVO 查询参数
     * @return 分页记录
     */
    Page<TemData> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, SearchTemDataVO searchTemDataVO);

}
