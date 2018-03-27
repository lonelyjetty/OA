package com.bizdata.app.prize.general.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.prize.general.controller.vo.PrizeGeneralVO;
import com.bizdata.app.prize.general.domain.PrizeGeneral;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface PrizeGeneralService {

	/**
	 * 分页查询
	 * @param jpaPageParamVO
	 * @param jpaSortParamVO
	 * @param prizeGeneralVO
	 * @return
	 */
	Page<PrizeGeneral> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			PrizeGeneralVO prizeGeneralVO);

	/**
	 * 保存或者更新
	 * @param prizeGeneral
	 * @return
	 */
	boolean save(PrizeGeneral prizeGeneral);

	/**
	 * 获取一个对象
	 * @param id
	 * @return
	 */
	PrizeGeneral findOne(String id);

}
