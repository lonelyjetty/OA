package com.bizdata.app.content.help.service.impl;

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

import com.bizdata.app.content.help.controller.vo.SearchHelpFAQVO;
import com.bizdata.app.content.help.domain.Help;
import com.bizdata.app.content.help.repository.ContentHelpRepository;
import com.bizdata.app.content.help.service.ContentHelpService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class ContentHelpServiceImpl implements ContentHelpService {

	private final ContentHelpRepository contentHelpRepository;

	@Autowired
	public ContentHelpServiceImpl(ContentHelpRepository contentHelpRepository) {
		this.contentHelpRepository = contentHelpRepository;
	}

	@Override
	public Page<Help> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchHelpFAQVO searchHelpVO) {
		return contentHelpRepository.findAll(listWhereClause(searchHelpVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	/**
	 * 条件查询
	 *
	 * @param searchHelpFAQVO
	 *            条件查询VO
	 * @return 条件
	 */
	private Specification<Help> listWhereClause(SearchHelpFAQVO searchHelpFAQVO) {
		return new Specification<Help>() {
			@Override
			public Predicate toPredicate(Root<Help> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果问题名称不为空
				if (StringUtils.isNotBlank(searchHelpFAQVO.getQuestion())) {
					list.add(criteriaBuilder.like(root.get("question").as(String.class),
							"%" + searchHelpFAQVO.getQuestion() + "%"));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	@Override
	public boolean save(Help help) {
		boolean state;
        try {
        	contentHelpRepository.save(help);
            state = true;
        } catch (Exception e) {
            log.error("保存或更新Banner失败:", e);
            state = false;
        }
        return state;
	}
	
	@Override
    public Help findOne(String id) {
        return contentHelpRepository.findOne(id);
    }
}
