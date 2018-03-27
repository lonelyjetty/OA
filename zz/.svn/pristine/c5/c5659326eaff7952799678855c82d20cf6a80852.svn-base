package com.bizdata.app.miaototal.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.miaototal.controller.vo.SearchMiaoTotalVO;
import com.bizdata.app.miaototal.domain.MiaoTotal;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface MiaoTotalService {
	Page<MiaoTotal> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchMiaoTotalVO searchMiaoTotalVO);
	/**
	 * 根据用户序号修改阳光币
	 * @param accountnum
	 * @param num
	 * @return
	 */
	boolean updateMiao(int accountnum,int num);
}