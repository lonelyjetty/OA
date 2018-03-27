package com.bizdata.app.service.reply.service.impl;

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

import com.bizdata.app.service.reply.controller.vo.ChunyuProblemVO;
import com.bizdata.app.service.reply.domain.ChunyuProblem;
import com.bizdata.app.service.reply.repository.ChunyuProblemRepository;
import com.bizdata.app.service.reply.service.ChunyuProblemService;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
public class ChunyuProblemServiceImpl implements ChunyuProblemService {
	private final ChunyuProblemRepository chunyuProblemRepository;

	@Autowired
	public ChunyuProblemServiceImpl(ChunyuProblemRepository chunyuProblemRepository) {
		this.chunyuProblemRepository = chunyuProblemRepository;
	}

	@Override
	public Page<ChunyuProblem> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			ChunyuProblemVO chunyuProblemVO) {
		return chunyuProblemRepository.findAll(listWhereClause(chunyuProblemVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));

	}

	private Specification<ChunyuProblem> listWhereClause(ChunyuProblemVO chunyuProblemVO) {
		return new Specification<ChunyuProblem>() {
			@Override
			public Predicate toPredicate(Root<ChunyuProblem> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果用户id存在
				if (StringUtils.isNotBlank(chunyuProblemVO.getProfileId())) {
					list.add(criteriaBuilder.like(root.get("profileId").as(String.class),
							"%" + chunyuProblemVO.getProfileId() + "%"));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}
}
