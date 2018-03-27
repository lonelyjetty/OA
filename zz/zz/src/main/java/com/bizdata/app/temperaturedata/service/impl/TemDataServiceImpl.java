package com.bizdata.app.temperaturedata.service.impl;

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

import com.bizdata.app.temperaturedata.controller.vo.SearchTemDataVO;
import com.bizdata.app.temperaturedata.domain.TemData;
import com.bizdata.app.temperaturedata.repository.TemDataRepository;
import com.bizdata.app.temperaturedata.service.TemDataService;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 
 * @author 
 *
 */
@Service
public class TemDataServiceImpl implements TemDataService {

	private final TemDataRepository temDataRepository;

	@Autowired
	public TemDataServiceImpl(TemDataRepository temDataRepository) {
		this.temDataRepository = temDataRepository;
	}

	@Override
	public Page<TemData> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchTemDataVO searchTemDataVO) {
		return temDataRepository.findAll(listWhereClause(searchTemDataVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	/**
	 * 条件查询
	 *
	 * @param searchTemDataVO
	 *            条件查询VO
	 * @return 条件
	 */
	private Specification<TemData> listWhereClause(SearchTemDataVO searchTemDataVO) {
		return new Specification<TemData>() {
			@Override
			public Predicate toPredicate(Root<TemData> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果用户ID不为空
				if (StringUtils.isNotBlank(searchTemDataVO.getProfileId())) {
					list.add(criteriaBuilder.like(root.get("profileId").as(String.class),
							"%" + searchTemDataVO.getProfileId() + "%"));
				}
				// 如果开始时间存在
				if (null != searchTemDataVO.getStarttime()) {
					System.out.println(searchTemDataVO.getStarttime().toGMTString());
					list.add(
							criteriaBuilder.greaterThanOrEqualTo(root.get("createTime"), searchTemDataVO.getStarttime()));
				}
				// 如果结束时间存在
				if (null != searchTemDataVO.getEndtime()) {
					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("createTime"), searchTemDataVO.getEndtime()));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

}
