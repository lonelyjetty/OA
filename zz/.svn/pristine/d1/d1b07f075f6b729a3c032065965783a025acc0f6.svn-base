package com.bizdata.app.service.question.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.bizdata.app.service.question.controller.vo.SearchQuestionVO;
import com.bizdata.app.service.question.domain.HaQuestion;
import com.bizdata.app.service.question.repository.QuestionRepository;
import com.bizdata.app.service.question.service.QuestionService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class QuestionServiceImpl implements QuestionService {
	private final QuestionRepository questionRepository;

	@Autowired
	public QuestionServiceImpl(QuestionRepository questionRepository) {
		this.questionRepository = questionRepository;
	}

	@Override
	public Page<HaQuestion> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchQuestionVO searchQuestionVO) {
		String questionCode = "%%";
		String questionName = "%%";
		String description = "%%";
		String state = "%%"; // 默认情况则查看所有的
		String assessmentId = "";
		// 如果问题编号存在
		if (StringUtils.isNotBlank(searchQuestionVO.getQuestionCode())) {
			questionCode = "%" + searchQuestionVO.getQuestionCode() + "%";
		}
		// 如果题目名称存在
		if (StringUtils.isNotBlank(searchQuestionVO.getQuestionName())) {
			questionName = "%" + searchQuestionVO.getQuestionName() + "%";
		}
		// 如果题目描述存在
		if (StringUtils.isNotBlank(searchQuestionVO.getDescription())) {
			description = "%" + searchQuestionVO.getDescription() + "%";
		}
		// 如果状态存在
		if (StringUtils.isNotBlank(searchQuestionVO.getState())) {
			state = searchQuestionVO.getState();
		}
		if (StringUtils.isNotBlank(searchQuestionVO.getAssessmentId())) {
			assessmentId = searchQuestionVO.getAssessmentId();
		}
		log.debug(assessmentId + "\n" + state + "\n" + questionName);
		return questionRepository.findAll(jpaPageParamVO.getPageable(jpaSortParamVO.getSort()), assessmentId,
				questionCode, questionName, description, state);

	}

	@Override
	public boolean save(HaQuestion haQuestion) {
		boolean state;
		try {
			questionRepository.save(haQuestion);
			state = true;
		} catch (Exception e) {
			log.error("保存或更新haQuestion失败:", e);
			state = false;
		}
		return state;
	}

	@Override
	public HaQuestion findOne(String id) {
		return questionRepository.findOne(id);
	}
}
