package com.bizdata.app.service.question.service;

import com.bizdata.app.service.question.domain.HaAssessmentQuestion;

public interface AssessToQuestionService {
	 /**
     * 执行更新操作
     *
     * @param Ha 问题
     * @return 执行反馈
     */
    boolean save(HaAssessmentQuestion haAssessmentQuestion);

    /**
     * 根据评估主键获取相应的对象
     * @param assessmentId
     * @return
     */
	HaAssessmentQuestion findById(String questionId);
}
