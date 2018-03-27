package com.bizdata.app.service.question.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.service.assess.domain.HaAssessment;
import com.bizdata.app.service.question.controller.vo.SearchQuestionVO;
import com.bizdata.app.service.question.domain.HaQuestion;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface QuestionService {
	/**
	 * 分页查询
	 *
	 * @param jpaPageParamVO
	 *            分页参数
	 * @param jpaSortParamVO
	 *            排序参数
	 * @param searchQuestionVO
	 *            问题参数VO
	 * @return 分页记录
	 */
	Page<HaQuestion> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchQuestionVO searchQuestionVO);

	 /**
     * 执行更新操作
     *
     * @param Ha 问题
     * @return 执行反馈
     */
    boolean save(HaQuestion haQuestion);

    /**
     * 获取一个对象
     * @param id
     * @return
     */
	HaQuestion findOne(String id);
}
