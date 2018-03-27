package com.bizdata.app.feedback.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.feedback.controller.vo.SearchFeedbackVO;
import com.bizdata.app.feedback.domain.Feedback;


import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface FeedbackService {

	Page<Feedback> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchFeedbackVO searchfeedbackVO);
}
