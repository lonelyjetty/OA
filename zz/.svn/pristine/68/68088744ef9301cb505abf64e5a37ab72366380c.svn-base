package com.bizdata.app.service.question.repository;

import com.bizdata.app.service.question.domain.HaAssessmentQuestion;

import me.sdevil507.base.JpaBaseRepository;

public interface AssessToQuestionRepository extends JpaBaseRepository<HaAssessmentQuestion, String> {

	/**
	 * 根据评估主键获取对象
	 * 
	 * @param assessmentId
	 * @return
	 */
	HaAssessmentQuestion findByQuestionId(String questionId);

}
