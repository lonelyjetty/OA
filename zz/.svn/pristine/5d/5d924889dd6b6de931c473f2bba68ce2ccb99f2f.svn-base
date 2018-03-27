package com.bizdata.app.circle.circle_mag.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.bizdata.app.circle.circle_classification.domain.CircleClassi;
import com.bizdata.app.circle.circle_mag.controller.vo.SearchCircleVO;
import com.bizdata.app.circle.circle_mag.domain.Circle;
import com.bizdata.app.circle.circle_mag.respository.CircleRepository;
import com.bizdata.app.circle.circle_mag.service.CircleService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class CircleServiceImpl implements CircleService {

	private final CircleRepository circleClassRepository;

	@Autowired
	public CircleServiceImpl(CircleRepository circleClassRepository) {
		this.circleClassRepository = circleClassRepository;
	}

	@Override
	public Page<Circle> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchCircleVO searchCircleVO) {
		return circleClassRepository.findAll(listWhereClause(searchCircleVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<Circle> listWhereClause(SearchCircleVO searchCircleVO) {
		return new Specification<Circle>() {
			@Override
			public Predicate toPredicate(Root<Circle> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果状态不为null
				if (null!=searchCircleVO.getState()) {
					list.add(criteriaBuilder.equal(root.get("state").as(int.class),searchCircleVO.getState()));
				}

				// 如果圈子分类不为空
				if (StringUtils.isNotBlank(searchCircleVO.getCircleclassid())) {
					list.add(criteriaBuilder.equal(root.get("circleclassid").as(String.class),searchCircleVO.getCircleclassid()));
				}
				// 如果圈子标题不为空
				if (StringUtils.isNotBlank(searchCircleVO.getTitle())) {
					list.add(criteriaBuilder.like(root.get("title").as(String.class),
							"%" + searchCircleVO.getTitle() + "%"));
				}
				
				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}
	
	//保存信息
	@Override
	public boolean save(Circle circleClass) {
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
	public boolean release(Circle circleClass) {
		return false;
	}

	@Override
	public int getMaxcircleid() {
		Integer k = circleClassRepository.getMaxcircleid();
		if(k!=null) {
			return k.intValue();
		}else {
			return 0;
		}
	}

	@Override
	public Map<String, String> findNameAndIdByCircleclass(String classid) {
		List<Circle> cirs = circleClassRepository.findByCircleclassid(classid);
		if(cirs != null) {
			Map<String,String> ss = new HashMap<String,String>();
			for(Circle cir:cirs) {
				ss.put(cir.getId(), cir.getTitle());}
			return ss;
		}else {
			return null;
		}
	}

	@Override
	public String getNameById(String circleeeid) {
		Circle c = circleClassRepository.findOne(circleeeid);
		if(null==c) {
			return "";
		}
		return c.getTitle();
	}
	//id查询
	@Override
	public Circle findOne(String id) {	
		return circleClassRepository.findOne(id);
	}
	//根据id返回circle_id
	@Override
	public int getCircleid(String id) {
		return circleClassRepository.findOne(id).getCircle_id();
	}
	//设置话题数
	@Transactional
	@Override
	public void setTopicnum(int circleId) {
		Circle cir = findByCircleid(circleId);
		if(null==cir.getTopicnum()) {
			cir.setTopicnum(1);
			save(cir);
		}else {
			circleClassRepository.setTopicnum(circleId);
		}
	}
	//circle_id查询
	private Circle findByCircleid(int circleId) {
		return circleClassRepository.findByCircleid(circleId);
	}
	
}
