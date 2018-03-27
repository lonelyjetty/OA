package com.bizdata.app.prize.library.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.prize.library.controller.vo.PrizeLibrarySearchVO;
import com.bizdata.app.prize.library.domain.PrizeLibrary;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface PrizeLibraryService {

	/**
	 * 分页查询
	 * @param jpaPageParamVO
	 * @param jpaSortParamVO
	 * @param prizeLibrarySearchVO
	 * @return
	 */
	Page<PrizeLibrary> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			PrizeLibrarySearchVO prizeLibrarySearchVO);

	/**
	 * 统计领奖人数
	 * @param prizeId
	 * @return
	 */
	Integer getAcceptNum(Integer prizeId);
	
	/**
	 * 统计兑换人数
	 * @param prizeId
	 * @return
	 */
	Integer getExchangeNum(Integer prizeId);

	/**
	 * 保存数据
	 * @param prizeLibrary
	 * @return
	 */
	boolean save(PrizeLibrary prizeLibrary);

	/**
	 * 根据主键获取对象
	 * @param id
	 * @return
	 */
	PrizeLibrary findOne(Integer id);
}
