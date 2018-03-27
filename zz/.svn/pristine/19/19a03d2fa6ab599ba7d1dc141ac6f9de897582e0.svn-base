package com.bizdata.app.circle.sensitive_words.service;


import java.util.List;

import org.springframework.data.domain.Page;

import com.bizdata.app.circle.sensitive_words.controller.vo.SenWordSearchVO;
import com.bizdata.app.circle.sensitive_words.domain.SensitiveWord;
import com.bizdata.app.sleepdata.controller.vo.SleepSearchVO;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 
 * @author Administrator
 *
 */
public interface SensitiveWordService {

    /**
     * 分页展示记录
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param sleepSearchVO  查询参数
     * @return 分页记录
     */
    Page<SensitiveWord> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, SenWordSearchVO senWordSearchVO);
    //检查敏感词是否已存在
	boolean checkIsExist(String word);
	//保存
	boolean save(SensitiveWord sen);
	//全部敏感词
	List<SensitiveWord> findAll();
}
