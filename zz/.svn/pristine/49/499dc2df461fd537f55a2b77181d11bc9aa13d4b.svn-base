package com.bizdata.app.app_mag.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.app_mag.controller.vo.SearchApp_magVO;
import com.bizdata.app.app_mag.domain.App_mag;


import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface App_magService {

	Page<App_mag> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchApp_magVO searchApp_magVO);

	boolean save(App_mag app_mag);
}
