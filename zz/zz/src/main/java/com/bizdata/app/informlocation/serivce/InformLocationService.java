package com.bizdata.app.informlocation.serivce;

import org.springframework.data.domain.Page;

import com.bizdata.app.informlocation.controller.vo.SearchInformLocationVO;
import com.bizdata.app.informlocation.domain.InformLocation;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface InformLocationService {
	Page<InformLocation> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchInformLocationVO searchInformLcationVO);

	boolean save(InformLocation informLocation);

	InformLocation findOne(String id);
}
