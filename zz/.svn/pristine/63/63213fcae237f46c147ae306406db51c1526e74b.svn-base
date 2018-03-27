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

import com.bizdata.app.service.reply.controller.vo.ChunyuReplyVO;
import com.bizdata.app.service.reply.domain.ChunyuReply;
import com.bizdata.app.service.reply.repository.ChunyuReplyRepository;
import com.bizdata.app.service.reply.service.ChunyuReplyService;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
public class ChunyuReplyServiceImpl implements ChunyuReplyService {
	private final ChunyuReplyRepository chunyuReplyRepository;

	@Autowired
	public ChunyuReplyServiceImpl(ChunyuReplyRepository chunyuReplyRepository) {
		this.chunyuReplyRepository = chunyuReplyRepository;
	}

	@Override
	public Page<ChunyuReply> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			ChunyuReplyVO chunyuReplyVO) {
		return chunyuReplyRepository.findAll(listWhereClause(chunyuReplyVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<ChunyuReply> listWhereClause(ChunyuReplyVO chunyuReplyVO) {
		return new Specification<ChunyuReply>() {
			@Override
			public Predicate toPredicate(Root<ChunyuReply> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();

				if(StringUtils.isNotBlank(chunyuReplyVO.getProblemId())) {
					list.add(criteriaBuilder.equal(root.get("problemId").as(String.class),
							chunyuReplyVO.getProblemId()));
				}
				
				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}
}
