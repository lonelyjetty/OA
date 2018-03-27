package com.bizdata.app.circle.sensitive_words.repository;

import java.util.List;

import com.bizdata.app.circle.sensitive_words.domain.SensitiveWord;

import me.sdevil507.base.JpaBaseRepository;

/**
 * 
 * @author Administrator
 *
 */
public interface SensitiveWordRepository extends JpaBaseRepository<SensitiveWord, String> {
	//返回敏感词
	List<SensitiveWord> findAllByWord(String s);
}
