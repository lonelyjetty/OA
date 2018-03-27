package com.bizdata.app.push.service.impl;

import java.util.ArrayList;
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


import com.bizdata.app.push.controller.vo.SearchPushVO;
import com.bizdata.app.push.domain.Push;
import com.bizdata.app.push.repostitory.PushRepository;
import com.bizdata.app.push.service.PushService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class PushServiceImpl implements PushService {

	private final PushRepository pushRepository;

	@Autowired
	public PushServiceImpl(PushRepository pushRepository) {
		this.pushRepository = pushRepository;
	}

	@Override
	public Page<Push> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchPushVO searchPushVO) {
		return pushRepository.findAll(listWhereClause(searchPushVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<Push> listWhereClause(SearchPushVO searchPushVO) {
		return new Specification<Push>() {
			@Override
			public Predicate toPredicate(Root<Push> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
//				// 如果用户ID不为空
//				if (StringUtils.isNotBlank(searchPushVO.getUserId())) {
//					list.add(criteriaBuilder.like(root.get("userId").as(String.class),
//							"%" + searchPushVO.getUserId() + "%"));
//				}
//
//				// 如果昵称号不为空
//				if (StringUtils.isNotBlank(searchPushVO.getUserName())) {
//					list.add(criteriaBuilder.like(root.get("userName").as(String.class),
//							"%" + searchPushVO.getUserName() + "%"));
//				}
//
//				// 如果手机号不为空
//				if (StringUtils.isNotBlank(searchPushVO.getUserPhone())) {
//					list.add(criteriaBuilder.like(root.get("userPhone").as(String.class),
//							"%" + searchPushVO.getUserPhone() + "%"));
//				}
//
//				// 如果开始时间存在
//				if (null != searchPushVO.getStartTime()) {
//					System.out.println(searchPushVO.getStartTime().toGMTString());
//					list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("registrationDate"),
//							searchPushVO.getStartTime()));
//				}
//
//				// 如果结束时间存在
//				if (null != searchPushVO.getEndTime()) {
//					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("registrationDate"),
//							searchPushVO.getEndTime()));
//				}
//
//				// 如果注册IP存在
//				if (null != searchPushVO.getRegisterIp()) {
//					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("registerIp"),
//							searchPushVO.getRegisterIp()));
//				}
//				
//				// 如果渠道号存在
//				if (null != searchPushVO.getDitchNo()) {
//					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("ditchNo"),
//							searchPushVO.getDitchNo()));
//				}
//				
//				// 如果状态存在
//				if (null != searchPushVO.getState()) {
//					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("state"),
//							searchPushVO.getState()));
//				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}
	
	/**
	 * 保存推送
	 */
	@Override
	public boolean save(Push push) {
		boolean state;
		try {
			pushRepository.save(push);
			state=true;
		} catch (Exception e) {
			log.error("新增推送失败",e);
			state = false;
		}
		return state;
		
	}

	@Override
	public Push findOne(String id) {
		return pushRepository.findOne(id);
	}


}
