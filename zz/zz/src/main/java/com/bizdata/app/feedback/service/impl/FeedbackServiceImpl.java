package com.bizdata.app.feedback.service.impl;

import java.util.ArrayList;
import java.util.Date;
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

import com.bizdata.app.banner.constant.BannerPositionEnum;
import com.bizdata.app.banner.service.impl.BannerServiceImpl;
import com.bizdata.app.feedback.controller.vo.SearchFeedbackVO;
import com.bizdata.app.feedback.domain.Feedback;
import com.bizdata.app.feedback.repository.FeedbackRepository;
import com.bizdata.app.feedback.service.FeedbackService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.enum_util.EnumUtils;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class FeedbackServiceImpl implements FeedbackService {

	private final FeedbackRepository feedbackRepository;

	@Autowired
	public FeedbackServiceImpl(FeedbackRepository feedbackRepository) {
		this.feedbackRepository = feedbackRepository;
	}

	@Override
	public Page<Feedback> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchFeedbackVO searchFeedbackVO) {
		return feedbackRepository.findAll(listWhereClause(searchFeedbackVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<Feedback> listWhereClause(SearchFeedbackVO searchFeedbackVO) {
		return new Specification<Feedback>() {
			@Override
			public Predicate toPredicate(Root<Feedback> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();

				if("全部".equals(searchFeedbackVO.getType())) {
					searchFeedbackVO.setType(null);
				}
				//如果反馈类型存在
                if (null != searchFeedbackVO.getType()) {
                    list.add(criteriaBuilder.equal(root.get("type").as(String.class), searchFeedbackVO.getType()));
                }

				//如果联系方式存在
                if (null != searchFeedbackVO.getTel()&& !"".equals(searchFeedbackVO.getTel())) {
                    list.add(criteriaBuilder.equal(root.get("tel").as(String.class), searchFeedbackVO.getTel()));
                }

                //如果开始时间存在
                if (null != searchFeedbackVO.getStartTime()) {
                    list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("startTime").as(Date.class), searchFeedbackVO.getStartTime()));
                }

                //如果结束时间存在
                if (null != searchFeedbackVO.getEndTime()) {
                    list.add(criteriaBuilder.lessThanOrEqualTo(root.get("endTime").as(Date.class), searchFeedbackVO.getEndTime()));
                }

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}


}
