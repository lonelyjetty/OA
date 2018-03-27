package com.bizdata.app.bgdata.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.bgdata.controller.vo.SearchBgDataVO;
import com.bizdata.app.bgdata.domain.BgData;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface BgDataService {
	
	 /**
     * 分页查询
     *
     * @param jpaPageParamVO    分页参数
     * @param jpaSortParamVO    排序参数
     * @param searchBgDataVO 查询参数
     * @return 分页记录
     */
    Page<BgData> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, SearchBgDataVO searchBgDataVO);

}
