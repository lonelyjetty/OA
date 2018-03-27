package com.bizdata.app.miaodetail.service;

import org.springframework.data.domain.Page;


import com.bizdata.app.miaodetail.controller.vo.SearchMiaoDetailVO;
import com.bizdata.app.miaodetail.domain.MiaoDetail;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface MiaoDetailService {
	Page<MiaoDetail> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchMiaoDetailVO searchMiaoDetailVO);
	boolean save(MiaoDetail miaoDetail);
}
