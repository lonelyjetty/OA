package com.bizdata.app.content.article.service.impl;

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

import com.bizdata.app.content.article.controller.vo.SearchArticleVO;
import com.bizdata.app.content.article.domain.Article;
import com.bizdata.app.content.article.repository.ArticleRepository;
import com.bizdata.app.content.article.service.ArticleService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class ArticleServiceImpl implements ArticleService {

	private final ArticleRepository ArticleClassRepository;

	@Autowired
	public ArticleServiceImpl(ArticleRepository ArticleClassRepository) {
		this.ArticleClassRepository = ArticleClassRepository;
	}

	@Override
	public Page<Article> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchArticleVO searchArticleVO) {
		return ArticleClassRepository.findAll(listWhereClause(searchArticleVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<Article> listWhereClause(SearchArticleVO searchArticleVO) {
		return new Specification<Article>() {
			@Override
			public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果用户ID不为空
				if (StringUtils.isNotBlank(searchArticleVO.getColumnid())) {
					list.add(criteriaBuilder.equal(root.get("columnart_id").as(String.class),
							searchArticleVO.getColumnid()));
				}

				// 如果昵称号不为空
				if (StringUtils.isNotBlank(searchArticleVO.getTitle())) {
					list.add(criteriaBuilder.like(root.get("article_title").as(String.class),
							"%" + searchArticleVO.getTitle() + "%"));
				}

				// 如果推荐不为空
				if (StringUtils.isNotBlank(searchArticleVO.getIs_recommend())) {
					list.add(criteriaBuilder.equal(root.get("is_recommend").as(String.class),
							searchArticleVO.getIs_recommend()));
				}

				// 如果开始时间存在
				if (null != searchArticleVO.getStartTime()) {
					System.out.println(searchArticleVO.getStartTime().toGMTString());
					list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("create_date"),
							searchArticleVO.getStartTime()));
				}

				// 如果结束时间存在
				if (null != searchArticleVO.getEndTime()) {
					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("create_date"),
							searchArticleVO.getEndTime()));
				}
				// 如果状态存在
				if (StringUtils.isNotBlank(searchArticleVO.getState())) {
					list.add(criteriaBuilder.equal(root.get("state").as(String.class),
							searchArticleVO.getState()));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}
	
	//保存信息
	@Override
	public boolean save(Article ArticleClass) {
		boolean state;
		try {
			ArticleClassRepository.save(ArticleClass);
			state=true;
		} catch (Exception e) {
			log.error("新增消息失败",e);
			state = false;
		}
		return state;
	}
	
	//发布信息
	@Override
	public boolean release(Article ArticleClass) {
		return false;
	}
	@Override
	public Integer findMaxid() {
		return ArticleClassRepository.findMaxid();
	}
	@Override
	public int getpraisenum(String article_id) {
		Integer i = ArticleClassRepository.getpraisenum(article_id);
		if(i==null) {
			return 0;
		}
		return i.intValue();
	}
	@Override
	public int getcrinum(String article_id) {
		Integer i = ArticleClassRepository.getcrinum(article_id);
		if(i==null) {
			return 0;
		}
		return i.intValue();
	}

	@Override
	public boolean delete(String id) {
		Article s = ArticleClassRepository.findOne(id);
		if(s.getState().equals("1")) {
			s.setState("0");
		}else {
			s.setState("1");
		}
		try {
			ArticleClassRepository.save(s);
			return true;
		}catch(Exception e) {
			return false;
		}
	}

	@Override
	public Article findOne(String id) {
		return ArticleClassRepository.findOne(id);
	}

	@Override
	public int getMaxcircleid() {
		Integer d = ArticleClassRepository.findMaxid();
		if(d != null) {
			return d.intValue();
		}else {
			return 0;
		}
	}

	@Override
	public Integer getNumByColumnartid(String columnartid) {
		return ArticleClassRepository.getNumByColumnartid(columnartid);
	}

}
