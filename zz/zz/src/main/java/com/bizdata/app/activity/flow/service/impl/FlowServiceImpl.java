package com.bizdata.app.activity.flow.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.bizdata.app.activity.flow.controller.vo.FlowVO;
import com.bizdata.app.activity.flow.domain.Flow;
import com.bizdata.app.activity.flow.respository.FlowRepository;
import com.bizdata.app.activity.flow.service.FlowService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class FlowServiceImpl implements FlowService {

	private final FlowRepository flowRepository;

	@Autowired
	public FlowServiceImpl(FlowRepository flowRepository) {
		this.flowRepository = flowRepository;
	}

	@Override
	public Page<Flow> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, FlowVO flowVO) {
		return flowRepository.findAll(listWhereClause(flowVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<Flow> listWhereClause(FlowVO flowVO) {
		return new Specification<Flow>() {
			@Override
			public Predicate toPredicate(Root<Flow> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果手机号码存在
				if (StringUtils.isNotBlank(flowVO.getMobile())) {
					// 添加like时需要加上%
					list.add(criteriaBuilder.like(root.get("mobile").as(String.class), "%" + flowVO.getMobile() + "%"));
				}
				// 如果状态存在
				if (StringUtils.isNotBlank(flowVO.getState())) {
					// 添加like时需要加上%
					list.add(criteriaBuilder.equal(root.get("state").as(String.class), flowVO.getState()));
				}
				// 如果面额存在
				if (null != flowVO.getFaceValue()) {
					list.add(criteriaBuilder.equal(root.get("faceValue").as(Float.class), flowVO.getFaceValue()));
				}
				// 如果开始时间存在
				if (null != flowVO.getStartDate()) {
					list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("createDate").as(Date.class),
							flowVO.getStartDate()));
				}
				// 如果结束时间存在
				if (null != flowVO.getEndDate()) {
					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("createDate").as(Date.class),
							flowVO.getEndDate()));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	@Override
	public boolean save(Flow flow) {
		boolean state;
		try {
			flowRepository.save(flow);
			state = true;
		} catch (Exception e) {
			log.error("保存或更新flow失败:", e);
			state = false;
		}
		return state;
	}
}
