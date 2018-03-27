package com.bizdata.app.informlocation.serivce.impl;

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

import com.bizdata.app.informlocation.constant.Location;
import com.bizdata.app.informlocation.controller.vo.SearchInformLocationVO;
import com.bizdata.app.informlocation.domain.InformLocation;
import com.bizdata.app.informlocation.repository.InformLocationRepository;
import com.bizdata.app.informlocation.serivce.InformLocationService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.enum_util.EnumUtils;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class InformLocationServiceImpl implements InformLocationService {

	private final InformLocationRepository informLocationRepository;

	@Autowired
	public InformLocationServiceImpl(InformLocationRepository informLocationRepository) {
		this.informLocationRepository = informLocationRepository;
	}

	@Override
	public Page<InformLocation> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchInformLocationVO searchInformLcationVO) {
		return informLocationRepository.findAll(listWhereClause(searchInformLcationVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<InformLocation> listWhereClause(SearchInformLocationVO searchInformLcationVO) {
		return new Specification<InformLocation>() {
			@Override
			public Predicate toPredicate(Root<InformLocation> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();

				// 如果位置类型存在
				if (EnumUtils.contains(searchInformLcationVO.getLocationType(), Location.class)) {
					list.add(criteriaBuilder.equal(root.get("location").as(String.class),
							searchInformLcationVO.getLocationType()));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	@Override
	public boolean save(InformLocation informLocation) {
		boolean state;
		try {
			informLocationRepository.save(informLocation);
			state = true;
		} catch (Exception e) {
			log.error("新增app配置失败", e);
			state = false;
		}
		return state;
	}

	@Override
	public InformLocation findOne(String id) {
		return informLocationRepository.findOne(id);
	}

}
