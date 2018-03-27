package com.bizdata.app.invite.service.impl;

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

import com.bizdata.app.invite.controller.vo.UserInviteStatisticsVO;
import com.bizdata.app.invite.domain.UserInviteStatistics;
import com.bizdata.app.invite.repository.UserInviteStatisticsRepository;
import com.bizdata.app.invite.service.UserInviteStatisticsService;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
public class UserInviteStatisticsServiceImpl implements UserInviteStatisticsService {

	private final UserInviteStatisticsRepository userInviteStatisticsRepository;

	@Autowired
	public UserInviteStatisticsServiceImpl(UserInviteStatisticsRepository userInviteStatisticsRepository) {
		this.userInviteStatisticsRepository = userInviteStatisticsRepository;
	}

	@Override
	public Page<UserInviteStatistics> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			UserInviteStatisticsVO userInviteStatisticsVO) {
		return userInviteStatisticsRepository.findAll(listWhereClause(userInviteStatisticsVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<UserInviteStatistics> listWhereClause(UserInviteStatisticsVO userInviteStatisticsVO) {
		return new Specification<UserInviteStatistics>() {
			@Override
			public Predicate toPredicate(Root<UserInviteStatistics> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果用户id不为空
				if (StringUtils.isNotBlank(userInviteStatisticsVO.getProfileId())) {
					list.add(criteriaBuilder.like(root.get("inviteProfileId").as(String.class),
							"%" + userInviteStatisticsVO.getProfileId() + "%"));
				}

				// 如果手机号不为空
				if (StringUtils.isNotBlank(userInviteStatisticsVO.getMobile())) {
					list.add(criteriaBuilder.like(root.get("inviteMobile").as(String.class),
							"%" + userInviteStatisticsVO.getMobile() + "%"));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

}
