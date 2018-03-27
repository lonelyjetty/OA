package com.bizdata.app.service.question.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bizdata.app.service.question.domain.HaAssessmentQuestion;
import com.bizdata.app.service.question.repository.AssessToQuestionRepository;
import com.bizdata.app.service.question.service.AssessToQuestionService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AssessToQuestionServiceImpl implements AssessToQuestionService {
	private final AssessToQuestionRepository assessToQuestionRepository;

	@Autowired
	public AssessToQuestionServiceImpl(AssessToQuestionRepository assessToQuestionRepository) {
		this.assessToQuestionRepository = assessToQuestionRepository;
	}
	@Override
	public boolean save(HaAssessmentQuestion haAssessmentQuestion) {
		boolean state;
		try {
			assessToQuestionRepository.save(haAssessmentQuestion);
			state = true;
		} catch (Exception e) {
			log.error("保存或更新haAssessmentQuestion失败:", e);
			state = false;
		}
		return state;
	}
	@Override
	public HaAssessmentQuestion findById(String questionId) {
		return assessToQuestionRepository.findByQuestionId(questionId);
	}

}
