package com.bizdata.app.information.serivce.impl;

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

import com.bizdata.app.information.constant.InformationTypeEnum;
import com.bizdata.app.information.controller.vo.SearchInformationVO;
import com.bizdata.app.information.domain.Information;
import com.bizdata.app.information.repository.InformationRepository;
import com.bizdata.app.information.serivce.InformationService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.enum_util.EnumUtils;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class InformationServiceImpl implements InformationService {

	private final InformationRepository informationRepository;

	@Autowired
	public InformationServiceImpl(InformationRepository informationRepository) {
		this.informationRepository = informationRepository;
	}

	@Override
	public Page<Information> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchInformationVO searchInformationVO) {
		return informationRepository.findAll(listWhereClause(searchInformationVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<Information> listWhereClause(SearchInformationVO searchInformationVO) {
		return new Specification<Information>() {
			@Override
			public Predicate toPredicate(Root<Information> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果消息主题不为空
				if (StringUtils.isNotBlank(searchInformationVO.getTheme())) {
					list.add(criteriaBuilder.like(root.get("theme").as(String.class),
							"%" + searchInformationVO.getTheme() + "%"));
				}
				// 如果消息类型不为空
				if (EnumUtils.contains(searchInformationVO.getTypeEnum(), InformationTypeEnum.class)) {
					list.add(criteriaBuilder.equal(root.get("informationTypeEnum").as(String.class),
							searchInformationVO.getTypeEnum()));
				}
				// // 如果用户ID不为空
				// if (StringUtils.isNotBlank(searchInformationVO.getUserId()))
				// {
				// list.add(criteriaBuilder.like(root.get("userId").as(String.class),
				// "%" + searchInformationVO.getUserId() + "%"));
				// }
				//
				// // 如果昵称号不为空
				// if
				// (StringUtils.isNotBlank(searchInformationVO.getUserName())) {
				// list.add(criteriaBuilder.like(root.get("userName").as(String.class),
				// "%" + searchInformationVO.getUserName() + "%"));
				// }
				//
				// // 如果手机号不为空
				// if
				// (StringUtils.isNotBlank(searchInformationVO.getUserPhone()))
				// {
				// list.add(criteriaBuilder.like(root.get("userPhone").as(String.class),
				// "%" + searchInformationVO.getUserPhone() + "%"));
				// }
				//
				// // 如果开始时间存在
				// if (null != searchInformationVO.getStartTime()) {
				// System.out.println(searchInformationVO.getStartTime().toGMTString());
				// list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("registrationDate"),
				// searchInformationVO.getStartTime()));
				// }
				//
				// // 如果结束时间存在
				// if (null != searchInformationVO.getEndTime()) {
				// list.add(criteriaBuilder.lessThanOrEqualTo(root.get("registrationDate"),
				// searchInformationVO.getEndTime()));
				// }
				//
				// // 如果注册IP存在
				// if (null != searchInformationVO.getRegisterIp()) {
				// list.add(criteriaBuilder.lessThanOrEqualTo(root.get("registerIp"),
				// searchInformationVO.getRegisterIp()));
				// }
				//
				// // 如果渠道号存在
				// if (null != searchInformationVO.getDitchNo()) {
				// list.add(criteriaBuilder.lessThanOrEqualTo(root.get("ditchNo"),
				// searchInformationVO.getDitchNo()));
				// }
				//
				// // 如果状态存在
				// if (null != searchInformationVO.getState()) {
				// list.add(criteriaBuilder.lessThanOrEqualTo(root.get("state"),
				// searchInformationVO.getState()));
				// }

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	// 保存信息
	@Override
	public boolean save(Information information) {
		boolean state;
		try {
			informationRepository.save(information);
			state = true;
		} catch (Exception e) {
			log.error("新增消息失败", e);
			state = false;
		}
		return state;
	}

	// 发布信息
	@Override
	public boolean release(Information information) {

		return false;
	}

	@Override
	public Information findOne(String id) {
		return informationRepository.findOne(id);
	}

}
