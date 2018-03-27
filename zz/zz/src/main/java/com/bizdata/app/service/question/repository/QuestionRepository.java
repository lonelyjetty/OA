package com.bizdata.app.service.question.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.service.question.domain.HaQuestion;

import me.sdevil507.base.JpaBaseRepository;

public interface QuestionRepository extends JpaBaseRepository<HaQuestion, String> {
	
	@Query(value = "select a from HaQuestion as a, HaAssessmentQuestion as b where b.assessmentId = ?1 and b.question = a.id and a.questionCode like ?2 and a.questionName like ?3 and a.description like ?4 and a.state like ?5")
	public Page<HaQuestion> findAll(Pageable pageRequest, String assessmentId, String questionCode, String questionName, String description, String state);

}
