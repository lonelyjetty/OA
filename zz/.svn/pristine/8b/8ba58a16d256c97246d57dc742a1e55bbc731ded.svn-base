package com.bizdata.app.loseweightdata.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.loseweightdata.controller.vo.SearchLoseWeightDataVO;
import com.bizdata.app.loseweightdata.domain.LoseWeightData;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface LoseWeightDataService {

	/**
	 * 分页查询
	 * 
	 * @param jpaPageParamVO   分页参数
	 * @param jpaSortParamVO   排序参数
	 * @param searchLoseWeightDataVO   查询参数
	 * @return
	 */
	Page<LoseWeightData> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchLoseWeightDataVO searchLoseWeightDataVO);
}
