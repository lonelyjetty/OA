package com.bizdata.app.prize.miao.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.prize.miao.controller.vo.PrizeMiaoVO;
import com.bizdata.app.prize.miao.domain.PrizeMiao;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface PrizeMiaoService {

	/**
	 * 分页查询
	 * @param jpaPageParamVO
	 * @param jpaSortParamVO
	 * @param prizeMiaoVO
	 * @return
	 */
	Page<PrizeMiao> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			PrizeMiaoVO prizeMiaoVO);

	/**
	 * 保存或者更新
	 * @param prizeMiao
	 * @return
	 */
	boolean save(PrizeMiao prizeMiao);

	/**
	 * 获取一个对象
	 * @param id
	 * @return
	 */
	PrizeMiao findOne(String id);

}
