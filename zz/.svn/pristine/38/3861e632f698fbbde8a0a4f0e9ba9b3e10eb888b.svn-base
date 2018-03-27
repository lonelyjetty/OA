package com.bizdata.app.circle.circle_classification.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.bizdata.app.circle.circle_classification.controller.vo.SearchCircleClassiVO;
import com.bizdata.app.circle.circle_classification.domain.CircleClassi;
import com.bizdata.app.circle.circle_classification.repository.CircleClassiRepository;
import com.bizdata.app.circle.circle_classification.service.CircleClassiService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class CircleClassiServiceImpl implements CircleClassiService {

	private final CircleClassiRepository circleClassRepository;

	@Autowired
	public CircleClassiServiceImpl(CircleClassiRepository circleClassRepository) {
		this.circleClassRepository = circleClassRepository;
	}

	@Override
	public Page<CircleClassi> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchCircleClassiVO searchCircleClassiVO) {
		return circleClassRepository.findAll(listWhereClause(searchCircleClassiVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<CircleClassi> listWhereClause(SearchCircleClassiVO searchCircleClassiVO) {
		return new Specification<CircleClassi>() {
			@Override
			public Predicate toPredicate(Root<CircleClassi> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果分类标题不为空
				if (StringUtils.isNotBlank(searchCircleClassiVO.getTitle())) {
					list.add(criteriaBuilder.like(root.get("title").as(String.class),
							"%" + searchCircleClassiVO.getTitle() + "%"));
				}
				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}
	
	//保存信息
	@Override
	public boolean save(CircleClassi circleClass) {
		boolean state;
		try {
			circleClassRepository.save(circleClass);
			state=true;
		} catch (Exception e) {
			log.error("新增消息失败",e);
			state = false;
		}
		return state;
	}
	
	//发布信息
	@Override
	public boolean release(CircleClassi circleClass) {
		return false;
	}

	@Override
	public Map<String, String> findNameAndId() {
		List<CircleClassi> ss = circleClassRepository.findAll();
		Map<String,String> kk= new HashMap<String, String>();
		if(ss!=null) {
			for (int i = 0; i < ss.size(); i++) {
				kk.put(ss.get(i).getId(), ss.get(i).getTitle());
			}
			return kk;
		}else {
			return null;
		}
	}

	@Override
	public String getNameById(String classId) {
		CircleClassi s = circleClassRepository.findOne(classId);
		if(null==s) {
			return "";
		}
		return s.getTitle();
	}

	@Override
	public CircleClassi findOne(String id) {
		return circleClassRepository.findOne(id);
	}


}
