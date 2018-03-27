package com.bizdata.app.prize.library.service.impl;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.bizdata.app.prize.library.controller.vo.PrizeRecordSearchVO;
import com.bizdata.app.prize.library.domain.PrizeRecord;
import com.bizdata.app.prize.library.service.PrizeRecordService;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
public class PrizeRecordServiceImpl implements PrizeRecordService {

	@Override
	public Page<PrizeRecord> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			PrizeRecordSearchVO prizeRecordSearchVO) {
		return null;
	}

}
