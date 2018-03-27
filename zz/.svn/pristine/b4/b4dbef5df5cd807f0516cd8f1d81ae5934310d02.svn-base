package com.bizdata.app.homelocation.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.homelocation.controller.vo.SearchHomeLocationVO;
import com.bizdata.app.homelocation.domain.HomeLocation;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface HomeLocationService {
	Page<HomeLocation> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchHomeLocationVO searchHomeLocationVO);

	HomeLocation findOne(String id);

	boolean save(HomeLocation home);
}
