package com.bizdata.app.service.option.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bizdata.app.service.option.domain.HAQuestionOption;
import com.bizdata.app.service.option.repository.OptionToQuestionRepository;
import com.bizdata.app.service.option.service.OptionToQuestionService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OptionToQuestionServiceImpl implements OptionToQuestionService {
	private final OptionToQuestionRepository optionToQuestionRepository;

	@Autowired
	public OptionToQuestionServiceImpl(OptionToQuestionRepository optionToQuestionRepository) {
		this.optionToQuestionRepository = optionToQuestionRepository;
	}

	@Override
	public String getSkipCode(String id, String questionId) {
		return optionToQuestionRepository.findScoreByOptionIdAndQuestionId(id, questionId);
	}

	@Override
	public Double getToQuestionCode(String id, String questionId) {
		// TODO Auto-generated method stub
		return optionToQuestionRepository.getToQuestionCode(id, questionId);
	}

	@Override
	public boolean save(HAQuestionOption hAQuestionOption) {
		boolean state;
		try {
			optionToQuestionRepository.save(hAQuestionOption);
			state = true;
		} catch (Exception e) {
			log.error("保存或更新hAQuestionOption失败:", e);
			state = false;
		}
		return state;
	}

	@Override
	public HAQuestionOption findByOptionId(String id) {
		return optionToQuestionRepository.findByOptionId(id);
	}

}
