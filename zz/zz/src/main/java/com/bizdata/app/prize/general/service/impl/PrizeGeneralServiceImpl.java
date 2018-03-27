package com.bizdata.app.prize.general.service.impl;

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

import com.bizdata.app.prize.general.controller.vo.PrizeGeneralVO;
import com.bizdata.app.prize.general.domain.PrizeGeneral;
import com.bizdata.app.prize.general.repository.PrizeGeneralRepository;
import com.bizdata.app.prize.general.service.PrizeGeneralService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class PrizeGeneralServiceImpl implements PrizeGeneralService {
	private final PrizeGeneralRepository prizeGeneralRepository;

	@Autowired
	public PrizeGeneralServiceImpl(PrizeGeneralRepository prizeGeneralRepository) {
		this.prizeGeneralRepository = prizeGeneralRepository;
	}

	@Override
	public Page<PrizeGeneral> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			PrizeGeneralVO prizeGeneralVO) {
		return prizeGeneralRepository.findAll(listWhereClause(prizeGeneralVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));

	}

	private Specification<PrizeGeneral> listWhereClause(PrizeGeneralVO prizeGeneralVO) {
		return new Specification<PrizeGeneral>() {
			@Override
			public Predicate toPredicate(Root<PrizeGeneral> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果名称存在
				if (StringUtils.isNotBlank(prizeGeneralVO.getGeneralName())) {
					// 添加like时需要加上%
					list.add(criteriaBuilder.like(root.get("generalName").as(String.class),
							"%" + prizeGeneralVO.getGeneralName() + "%"));
				}
				// 如果类型存在
				if (StringUtils.isNotBlank(prizeGeneralVO.getGeneralType())) {
					list.add(criteriaBuilder.equal(root.get("generalType").as(String.class),
							prizeGeneralVO.getGeneralType()));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	@Override
	public boolean save(PrizeGeneral prizeGeneral) {
		boolean state;
        try {
        	prizeGeneralRepository.save(prizeGeneral);
            state = true;
        } catch (Exception e) {
            log.error("保存或更新prizeGeneral失败:", e);
            state = false;
        }
        return state;
	}

	@Override
	public PrizeGeneral findOne(String id) {
		return prizeGeneralRepository.findOne(id);
	}

}
