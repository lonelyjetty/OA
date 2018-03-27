package com.bizdata.app.activity.paoma.service.impl;

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

import com.bizdata.app.activity.paoma.controller.vo.PaoMaMapPersonVO;
import com.bizdata.app.activity.paoma.domain.PaoMaMapPerson;
import com.bizdata.app.activity.paoma.repository.PaoMaMapPersonRepository;
import com.bizdata.app.activity.paoma.service.PaoMaMapPersonService;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
//@Slf4j
public class PaoMaMapPersonServiceImpl implements PaoMaMapPersonService {
	private final PaoMaMapPersonRepository paoMaMapPersonRepository;

	@Autowired
	public PaoMaMapPersonServiceImpl(PaoMaMapPersonRepository paoMaMapPersonRepository) {
		this.paoMaMapPersonRepository = paoMaMapPersonRepository;
	}

	@Override
	public Page<PaoMaMapPerson> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			PaoMaMapPersonVO paoMaMapPersonVO) {
		return paoMaMapPersonRepository.findAll(listWhereClause(paoMaMapPersonVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));

	}

	/**
	 * 过滤条件
	 * @param paoMaMapPersonVO
	 * @return
	 */
	private Specification<PaoMaMapPerson> listWhereClause(PaoMaMapPersonVO paoMaMapPersonVO) {
		return new Specification<PaoMaMapPerson>() {
            @Override
            public Predicate toPredicate(Root<PaoMaMapPerson> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();
                // 如果活动id存在
                if(StringUtils.isNotEmpty(paoMaMapPersonVO.getId())) {
                	list.add(criteriaBuilder.equal(root.get("activityId").as(String.class), paoMaMapPersonVO.getId()));
                }
                //如果昵称存在
                if(StringUtils.isNotEmpty(paoMaMapPersonVO.getNickName())) {
                	list.add(criteriaBuilder.like(root.get("nickName").as(String.class), "%" + paoMaMapPersonVO.getNickName() + "%"));
                }
                // 如果手机号存在
                if(StringUtils.isNotEmpty(paoMaMapPersonVO.getMobile())) {
                	list.add(criteriaBuilder.equal(root.get("mobile").as(String.class), paoMaMapPersonVO.getMobile()));
                }
                

                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
	}

	@Override
	public int getPeople(String id) {
		int result = 0;
		if(!"".equals(id) && null != id) {
			result = paoMaMapPersonRepository.getPeopleNum(id);
		}
		return result;
	}

}
