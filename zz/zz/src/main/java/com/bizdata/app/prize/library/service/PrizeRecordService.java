package com.bizdata.app.prize.library.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.prize.library.controller.vo.PrizeRecordSearchVO;
import com.bizdata.app.prize.library.domain.PrizeRecord;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface PrizeRecordService {
	/**
	 * 分页查询
	 * @param jpaPageParamVO
	 * @param jpaSortParamVO
	 * @param prizeRecordSearchVO
	 * @return
	 */
	Page<PrizeRecord> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			PrizeRecordSearchVO prizeRecordSearchVO);

}
