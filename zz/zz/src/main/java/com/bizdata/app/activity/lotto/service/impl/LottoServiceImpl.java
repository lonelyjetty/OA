package com.bizdata.app.activity.lotto.service.impl;

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

import com.bizdata.app.activity.lotto.controller.vo.LottoVO;
import com.bizdata.app.activity.lotto.domain.Lotto;
import com.bizdata.app.activity.lotto.respository.LottoRepository;
import com.bizdata.app.activity.lotto.service.LottoService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class LottoServiceImpl implements LottoService {

	private final LottoRepository lottoRepository;

	@Autowired
	public LottoServiceImpl(LottoRepository lottoRepository) {
		this.lottoRepository = lottoRepository;
	}

	@Override
	public Page<Lotto> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, LottoVO lottoVO) {
		return lottoRepository.findAll(listWhereClause(lottoVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<Lotto> listWhereClause(LottoVO lottoVO) {
		return new Specification<Lotto>() {
			@Override
			public Predicate toPredicate(Root<Lotto> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果活动名称存在
				if (StringUtils.isNotBlank(lottoVO.getLottoName())) {
					// 添加like时需要加上%
					list.add(criteriaBuilder.like(root.get("lottoName").as(String.class),
							"%" + lottoVO.getLottoName() + "%"));
				}
				// 如果活动状态存在
				if (StringUtils.isNotBlank(lottoVO.getState())) {
					list.add(criteriaBuilder.equal(root.get("state").as(String.class), lottoVO.getState()));
				}
				// 如果开始时间存在
				if (null != lottoVO.getStartDate()) {
					list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("startDate").as(Date.class),
							lottoVO.getStartDate()));
				}

				// 如果结束时间存在
				if (null != lottoVO.getEndDate()) {
					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("startDate").as(Date.class),
							lottoVO.getEndDate()));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	@Override
	public boolean save(Lotto lotto) {
		boolean state;
		try {
			lottoRepository.save(lotto);
			state = true;
		} catch (Exception e) {
			log.error("保存或更新lotto失败:", e);
			state = false;
		}
		return state;
	}

	@Override
	public Lotto findOne(String id) {
		return lottoRepository.findOne(id);
	}

	@Override
	public Lotto findFirstBySortNo(Integer value) {
		// TODO Auto-generated method stub
		return lottoRepository.findFirstBySortNo(value);
	}
}
