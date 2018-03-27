package com.bizdata.app.service.option.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.service.option.domain.HaOption;

import me.sdevil507.base.JpaBaseRepository;

public interface OptionRepository extends JpaBaseRepository<HaOption, String> {
	
	@Query(value = "select a from HaOption as a, HAQuestionOption as b where b.questionId = ?1 and a.optionCode like ?2 and a.optionName like ?3 and b.ToQuestionCode like ?4 and b.option = a.id")
	Page<HaOption> findAll(Pageable pageable, String questionId, String optionCode, String optionName, String skipCode);
}
