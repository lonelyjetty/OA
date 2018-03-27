package com.bizdata.app.circle.sensitive_words.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.bizdata.app.circle.sensitive_words.controller.vo.SenWordSearchVO;
import com.bizdata.app.circle.sensitive_words.domain.SensitiveWord;
import com.bizdata.app.circle.sensitive_words.repository.SensitiveWordRepository;
import com.bizdata.app.circle.sensitive_words.service.SensitiveWordService;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 
 * @author Administrator
 *
 */
@Service
public class SensitiveWordServiceImpl implements SensitiveWordService {

    @Autowired
    private SensitiveWordRepository sensitiveWordRepository;

    @Override
    public Page<SensitiveWord> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, SenWordSearchVO senWordSearchVO) {
        return sensitiveWordRepository.findAll(listWhereClause(senWordSearchVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
    }

    /**
     * 条件查询
     *
     * @param sleepSearchVO 条件查询VO
     * @return 条件
     */
    private Specification<SensitiveWord> listWhereClause(SenWordSearchVO senWordSearchVO) {
        return new Specification<SensitiveWord>() {
            @Override
            public Predicate toPredicate(Root<SensitiveWord> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();

                //如果关键词存在
                if (StringUtils.isNotBlank(senWordSearchVO.getWord())) {
                    list.add(criteriaBuilder.like(root.get("word"), "%"+senWordSearchVO.getWord()+"%"));
                }

                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
    }

	@Override
	public boolean checkIsExist(String word) {
		List<SensitiveWord> k = sensitiveWordRepository.findAllByWord(word);
		if(k!=null && k.size() != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean save(SensitiveWord sen) {
		try {
			sensitiveWordRepository.save(sen);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	//全部敏感词
	@Override
	public List<SensitiveWord> findAll() {
		return sensitiveWordRepository.findAll();
	}
}
