package com.bizdata.app.activity.hotevents.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.activity.hotevents.controller.vo.HotEventsVO;
import com.bizdata.app.activity.hotevents.domain.HotEvents;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface HotEventsService {

	Page<HotEvents> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			HotEventsVO hotEventsVO);

	boolean save(HotEvents hotevents);

	HotEvents findOne(String id);

}
