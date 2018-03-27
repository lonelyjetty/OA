package com.bizdata.app.service.assess.service.impl;

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

import com.bizdata.app.service.assess.controller.vo.SearchAssessVO;
import com.bizdata.app.service.assess.domain.HaAssessment;
import com.bizdata.app.service.assess.repository.AssessRepository;
import com.bizdata.app.service.assess.service.AssessService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class AssessServiceImpl implements AssessService {

	private final AssessRepository assessRepository;

	@Autowired
	public AssessServiceImpl(AssessRepository assessRepository) {
		this.assessRepository = assessRepository;
	}

	@Override
	public Page<HaAssessment> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchAssessVO searchAssessVO) {
		return assessRepository.findAll(listWhereClause(searchAssessVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));

	}

	/**
	 * 条件查询
	 *
	 * @param searchPaoMaVO
	 *            条件查询VO
	 * @return 条件
	 */
	private Specification<HaAssessment> listWhereClause(SearchAssessVO searchAssessVO) {
		return new Specification<HaAssessment>() {
			@Override
			public Predicate toPredicate(Root<HaAssessment> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				//如果评估名称存在
				if (StringUtils.isNotBlank(searchAssessVO.getAssessName())) {
					list.add(criteriaBuilder.equal(root.get("assessmentName").as(String.class),
							searchAssessVO.getAssessName()));
				}

				// 如果评估编码存在
				if (StringUtils.isNotBlank(searchAssessVO.getAssessmentCode())) {
					list.add(criteriaBuilder.equal(root.get("assessmentCode").as(String.class),
							searchAssessVO.getAssessmentCode()));
				}

				// 如果一句话描述存在
				if (StringUtils.isNotBlank(searchAssessVO.getShortDesci())) {
					list.add(criteriaBuilder.equal(root.get("shortDescription").as(String.class),
							searchAssessVO.getShortDesci()));
				}

				// 如果评估类型存在
				if (StringUtils.isNotBlank(searchAssessVO.getType())) {
					list.add(criteriaBuilder.equal(root.get("type").as(String.class),
							searchAssessVO.getType()));
				}
				
				// 如果评估对象存在
				if (StringUtils.isNotBlank(searchAssessVO.getSex())) {
					list.add(criteriaBuilder.equal(root.get("sex").as(String.class),
							searchAssessVO.getSex()));
				}
				
				// 如果来源存在
				if (StringUtils.isNotBlank(searchAssessVO.getSource())) {
					list.add(criteriaBuilder.equal(root.get("source").as(String.class),
							searchAssessVO.getSource()));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	@Override
	public boolean save(HaAssessment haAssessment) {
		boolean state;
        try {
        	assessRepository.save(haAssessment);
            state = true;
        } catch (Exception e) {
            log.error("保存或更新haAssessment失败:", e);
            state = false;
        }
        return state;
	}

	@Override
	public HaAssessment findOne(String id) {
		return assessRepository.findOne(id);
	}
}
