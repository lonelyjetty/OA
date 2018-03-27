package com.bizdata.app.content.column.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.bizdata.app.content.article.controller.vo.SearchArticleVO;
import com.bizdata.app.content.article.domain.Article;
import com.bizdata.app.content.article.repository.ArticleRepository;
import com.bizdata.app.content.article.service.ArticleService;
import com.bizdata.app.content.column.controller.vo.SearchColumnVO;
import com.bizdata.app.content.column.domain.Columnart;
import com.bizdata.app.content.column.repository.ColumnRepository;
import com.bizdata.app.content.column.service.ColumnService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class ColumnServiceImpl implements ColumnService {

	private final ColumnRepository columnRepository;

	@Autowired
	public ColumnServiceImpl(ColumnRepository columnRepository) {
		this.columnRepository = columnRepository;
	}

	@Override
	public Page<Columnart> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchColumnVO searchColumnVO) {
		return columnRepository.findAll(listWhereClause(searchColumnVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<Columnart> listWhereClause(SearchColumnVO searchColumnVO) {
		return new Specification<Columnart>() {
			@Override
			public Predicate toPredicate(Root<Columnart> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
//				// 如果用户ID不为空
//				if (StringUtils.isNotBlank(searchArticleVO.getUserId())) {
//					list.add(criteriaBuilder.like(root.get("userId").as(String.class),
//							"%" + searchArticleVO.getUserId() + "%"));
//				}
//
//				// 如果昵称号不为空
//				if (StringUtils.isNotBlank(searchArticleVO.getUserName())) {
//					list.add(criteriaBuilder.like(root.get("userName").as(String.class),
//							"%" + searchArticleVO.getUserName() + "%"));
//				}
//
//				// 如果手机号不为空
//				if (StringUtils.isNotBlank(searchArticleVO.getUserPhone())) {
//					list.add(criteriaBuilder.like(root.get("userPhone").as(String.class),
//							"%" + searchArticleVO.getUserPhone() + "%"));
//				}
//
//				// 如果开始时间存在
//				if (null != searchArticleVO.getStartTime()) {
//					System.out.println(searchArticleVO.getStartTime().toGMTString());
//					list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("registrationDate"),
//							searchArticleVO.getStartTime()));
//				}
//
//				// 如果结束时间存在
//				if (null != searchArticleVO.getEndTime()) {
//					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("registrationDate"),
//							searchArticleVO.getEndTime()));
//				}
//
//				// 如果注册IP存在
//				if (null != searchArticleVO.getRegisterIp()) {
//					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("registerIp"),
//							searchArticleVO.getRegisterIp()));
//				}
//				
//				// 如果渠道号存在
//				if (null != searchArticleVO.getDitchNo()) {
//					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("ditchNo"),
//							searchArticleVO.getDitchNo()));
//				}
//				
//				// 如果状态存在
//				if (null != searchArticleVO.getState()) {
//					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("state"),
//							searchArticleVO.getState()));
//				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}
	
	//保存信息
	@Override
	public boolean save(Columnart columnart) {
		boolean state;
		try {
			columnRepository.save(columnart);
			state=true;
		} catch (Exception e) {
			log.error("新增消息失败",e);
			state = false;
		}
		return state;
	}
	
	//发布信息
	@Override
	public boolean release(Columnart columnart) {
		
		return false;
	}
	@Override
	public Columnart findBySort_no(int sort_no) {
		return columnRepository.findBySort_no(sort_no);
	}
	@Override
	public Integer findMaxid() {
		return columnRepository.findMaxid();
	}
	@Override
	public Map<String, String> findNameAndId(){
		Map<String, String> map = new HashMap<String, String>();
		List<Object> ss= columnRepository.findNameAndId();
		if(ss==null) {
			return null;
		}
		for(int i=0;i<ss.size();i++) {
			Object[] kk = (Object[])ss.get(i);
			map.put(kk[0].toString(),kk[1].toString());
		}
		return map;
	}
	@Override
	public Columnart findOne(String id) {
		return columnRepository.findOne(id);
	}

	@Override
	public boolean delete(String id) {
		Columnart s = columnRepository.findOne(id);
		if(s.getState().equals("1")) {
			s.setState("0");
		}else {
			s.setState("1");
		}
		try {
			columnRepository.save(s);
			return true;
		}catch(Exception e) {
			return false;
		}
	}
}
