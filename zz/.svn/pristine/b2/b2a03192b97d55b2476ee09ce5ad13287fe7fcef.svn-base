package com.bizdata.app.prize.miao.service.impl;

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

import com.bizdata.app.prize.miao.controller.vo.PrizeMiaoVO;
import com.bizdata.app.prize.miao.domain.PrizeMiao;
import com.bizdata.app.prize.miao.repository.PrizeMiaoRepository;
import com.bizdata.app.prize.miao.service.PrizeMiaoService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class PrizeMiaoServiceImpl implements PrizeMiaoService {

	private final PrizeMiaoRepository prizeMiaoRepository;

	@Autowired
	public PrizeMiaoServiceImpl(PrizeMiaoRepository prizeMiaoRepository) {
		this.prizeMiaoRepository = prizeMiaoRepository;
	}
	
	@Override
	public Page<PrizeMiao> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			PrizeMiaoVO prizeMiaoVO) {
		return prizeMiaoRepository.findAll(listWhereClause(prizeMiaoVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<PrizeMiao> listWhereClause(PrizeMiaoVO prizeMiaoVO) {
		return new Specification<PrizeMiao>() {
			@Override
			public Predicate toPredicate(Root<PrizeMiao> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果任务名称存在
				if (StringUtils.isNotBlank(prizeMiaoVO.getTaskName())) {
					// 添加like时需要加上%
					list.add(criteriaBuilder.like(root.get("taskName").as(String.class),
							"%" + prizeMiaoVO.getTaskName() + "%"));
				}
				// 如果类型存在
				if (StringUtils.isNotBlank(prizeMiaoVO.getState())) {
					list.add(criteriaBuilder.equal(root.get("state").as(String.class),
							prizeMiaoVO.getState()));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	@Override
	public boolean save(PrizeMiao prizeMiao) {
		boolean state;
        try {
        	prizeMiaoRepository.save(prizeMiao);
            state = true;
        } catch (Exception e) {
            log.error("保存或更新prizeMiao失败:", e);
            state = false;
        }
        return state;
	}

	@Override
	public PrizeMiao findOne(String id) {
		return prizeMiaoRepository.findOne(id);
	}

}
