package com.bizdata.app.shortcutkey.service.impl;

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

import com.bizdata.app.shortcutkey.controller.vo.SearchShortcutKeyVO;
import com.bizdata.app.shortcutkey.domain.ShortcutKey;
import com.bizdata.app.shortcutkey.repository.ShortcutKeyRepository;
import com.bizdata.app.shortcutkey.service.ShortcutKeyService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class ShortcutKeyServiceImpl implements ShortcutKeyService {
	private final ShortcutKeyRepository shortcutKeyRepository;

	@Autowired
	public ShortcutKeyServiceImpl(ShortcutKeyRepository shortcutKeyRepository) {
		this.shortcutKeyRepository = shortcutKeyRepository;
	}

	@Override
	public Page<ShortcutKey> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchShortcutKeyVO searchShortcutKeyVO) {
		return shortcutKeyRepository.findAll(listWhereClause(searchShortcutKeyVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<ShortcutKey> listWhereClause(SearchShortcutKeyVO searchShortcutKeyVO) {
		return new Specification<ShortcutKey>() {
            @Override
            public Predicate toPredicate(Root<ShortcutKey> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();
                //如果类型不为空
                if (StringUtils.isNotBlank(searchShortcutKeyVO.getType())) {
                    list.add(criteriaBuilder.like(root.get("type").as(String.class), "%" + searchShortcutKeyVO.getType() + "%"));
                }

                //如果设备SN号不为空
                if (StringUtils.isNotBlank(searchShortcutKeyVO.getKey())) {
                    list.add(criteriaBuilder.like(root.get("key").as(String.class), "%" + searchShortcutKeyVO.getKey() + "%"));
                }


                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
	}

	@Override
	public boolean save(ShortcutKey shortcutKey) {
		boolean state;
        try {
        	shortcutKeyRepository.save(shortcutKey);
            state = true;
        } catch (Exception e) {
            log.error("保存或更新shortcutKey失败:", e);
            state = false;
        }
        return state;
	}

	@Override
	public ShortcutKey findOne(String id) {
		return shortcutKeyRepository.findOne(id);
	}

}
