package com.bizdata.app.service.option.repository;

import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.service.option.domain.HAQuestionOption;

import me.sdevil507.base.JpaBaseRepository;

public interface OptionToQuestionRepository extends JpaBaseRepository<HAQuestionOption, String> {

	/**
	 * 获取选项得分
	 * @param id
	 * @param questionId
	 * @return
	 */
	@Query(value="select a.score from HAQuestionOption as a where a.option.id = ?1 and a.questionId = ?2")
	String findScoreByOptionIdAndQuestionId(String id, String questionId);

	/**
	 * 获取选项对应的问题id
	 * @param id
	 * @param questionId
	 * @return
	 */
	@Query(value="select a.ToQuestionCode from HAQuestionOption as a where a.option.id = ?1 and a.questionId = ?2")
	Double getToQuestionCode(String id, String questionId);

	HAQuestionOption findByOptionId(String id);

}
