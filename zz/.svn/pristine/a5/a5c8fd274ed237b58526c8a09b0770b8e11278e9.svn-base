package com.bizdata.app.prize.sign.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.bizdata.app.prize.sign.controller.vo.PrizeSignVO;
import com.bizdata.app.prize.sign.domain.PrizeSign;
import com.bizdata.app.prize.sign.repository.PrizeSignRepository;
import com.bizdata.app.prize.sign.service.PrizeSignService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class PrizeSignServiceImpl implements PrizeSignService {

	private final PrizeSignRepository prizeSignRepository;

	@Autowired
	public PrizeSignServiceImpl(PrizeSignRepository prizeSignRepository) {
		this.prizeSignRepository = prizeSignRepository;
	}

	@Override
	public Page<PrizeSign> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			PrizeSignVO prizeSignVO) {
		return prizeSignRepository.findAll(listWhereClause(prizeSignVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
}

	private Specification<PrizeSign> listWhereClause(PrizeSignVO prizeSignVO) {
		return new Specification<PrizeSign>() {
            @Override
            public Predicate toPredicate(Root<PrizeSign> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();

                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
	}

	@Override
	public boolean save(PrizeSign prizeSign) {
		boolean state;
        try {
        	prizeSignRepository.save(prizeSign);
            state = true;
        } catch (Exception e) {
            log.error("保存或更新prizeSign失败:", e);
            state = false;
        }
        return state;
	}

	@Override
	public PrizeSign findOne(String id) {
		return prizeSignRepository.findOne(id);
	}
}
