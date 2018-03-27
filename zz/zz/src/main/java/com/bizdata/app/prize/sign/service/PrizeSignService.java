package com.bizdata.app.prize.sign.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.prize.sign.controller.vo.PrizeSignVO;
import com.bizdata.app.prize.sign.domain.PrizeSign;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface PrizeSignService {

	Page<PrizeSign> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			PrizeSignVO prizeSignVO);

	boolean save(PrizeSign prizeSign);

	PrizeSign findOne(String id);

}
