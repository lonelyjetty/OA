package com.bizdata.app.app_mag.service.impl;

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


import com.bizdata.app.app_mag.controller.vo.SearchApp_magVO;
import com.bizdata.app.app_mag.domain.App_mag;
import com.bizdata.app.app_mag.repostitory.App_magRepository;
import com.bizdata.app.app_mag.service.App_magService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class App_magServiceImpl implements App_magService {

	private final App_magRepository app_magRepository;

	@Autowired
	public App_magServiceImpl(App_magRepository app_magRepository) {
		this.app_magRepository = app_magRepository;
	}

	@Override
	public Page<App_mag> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchApp_magVO searchApp_magVO) {
		return app_magRepository.findAll(listWhereClause(searchApp_magVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<App_mag> listWhereClause(SearchApp_magVO searchApp_magVO) {
		return new Specification<App_mag>() {
			@Override
			public Predicate toPredicate(Root<App_mag> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
//				// 如果用户ID不为空
//				if (StringUtils.isNotBlank(searchApp_magVO.getUserId())) {
//					list.add(criteriaBuilder.like(root.get("userId").as(String.class),
//							"%" + searchApp_magVO.getUserId() + "%"));
//				}
//
//				// 如果昵称号不为空
//				if (StringUtils.isNotBlank(searchApp_magVO.getUserName())) {
//					list.add(criteriaBuilder.like(root.get("userName").as(String.class),
//							"%" + searchApp_magVO.getUserName() + "%"));
//				}
//
//				// 如果手机号不为空
//				if (StringUtils.isNotBlank(searchApp_magVO.getUserPhone())) {
//					list.add(criteriaBuilder.like(root.get("userPhone").as(String.class),
//							"%" + searchApp_magVO.getUserPhone() + "%"));
//				}
//
//				// 如果开始时间存在
//				if (null != searchApp_magVO.getStartTime()) {
//					System.out.println(searchApp_magVO.getStartTime().toGMTString());
//					list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("registrationDate"),
//							searchApp_magVO.getStartTime()));
//				}
//
//				// 如果结束时间存在
//				if (null != searchApp_magVO.getEndTime()) {
//					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("registrationDate"),
//							searchApp_magVO.getEndTime()));
//				}
//
//				// 如果注册IP存在
//				if (null != searchApp_magVO.getRegisterIp()) {
//					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("registerIp"),
//							searchApp_magVO.getRegisterIp()));
//				}
//				
//				// 如果渠道号存在
//				if (null != searchApp_magVO.getDitchNo()) {
//					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("ditchNo"),
//							searchApp_magVO.getDitchNo()));
//				}
//				
//				// 如果状态存在
//				if (null != searchApp_magVO.getState()) {
//					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("state"),
//							searchApp_magVO.getState()));
//				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	@Override
	public boolean save(App_mag app_mag) {
		boolean state;
		try {
			app_magRepository.save(app_mag);
			state=true;
		} catch (Exception e) {
			log.error("新增app配置失败",e);
			state = false;
		}
		return state;
	}


}
