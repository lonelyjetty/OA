package com.bizdata.app.activity.flow.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.activity.flow.controller.vo.FlowVO;
import com.bizdata.app.activity.flow.domain.Flow;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface FlowService {

	Page<Flow> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, FlowVO flowVO);

	boolean save(Flow flow);

}
