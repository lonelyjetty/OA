package com.bizdata.app.service.option.service;

import com.bizdata.app.service.option.domain.HAQuestionOption;

public interface OptionToQuestionService {

	/**
	 * 获取选项得分
	 * @param id
	 * @param questionId
	 * @return
	 */
	String getSkipCode(String id, String questionId);

	/**
	 * 获取选项对应的问题id
	 * @param id
	 * @param questionId
	 * @return
	 */
	Double getToQuestionCode(String id, String questionId);

	/**
	 * 保存对象
	 * @param hAQuestionOption
	 * @return
	 */
	boolean save(HAQuestionOption hAQuestionOption);

	/**
	 * 根据选择id获取对象
	 * @param id
	 * @return
	 */
	HAQuestionOption findByOptionId(String id);

}
