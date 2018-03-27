package com.bizdata.app.miaodetail.service.impl;

import java.util.ArrayList;
import java.util.Date;
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

import com.bizdata.app.miaodetail.controller.vo.SearchMiaoDetailVO;
import com.bizdata.app.miaodetail.domain.MiaoDetail;
import com.bizdata.app.miaodetail.repository.MiaoDetailRepository;
import com.bizdata.app.miaodetail.service.MiaoDetailService;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
public class MiaoDetailServiceImpl implements MiaoDetailService {

	private final MiaoDetailRepository miaoDetailRepository;

	@Autowired
	public MiaoDetailServiceImpl(MiaoDetailRepository miaoDetailRepository) {
		this.miaoDetailRepository = miaoDetailRepository;
	}
	@Override
	public Page<MiaoDetail> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchMiaoDetailVO searchMiaoDetailVO) {
		return miaoDetailRepository.findAll(listWhereClause(searchMiaoDetailVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}
	
	private Specification<MiaoDetail> listWhereClause(SearchMiaoDetailVO searchMiaoDetailVO) {
		return new Specification<MiaoDetail>() {
			@Override
			public Predicate toPredicate(Root<MiaoDetail> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果用户ID不为空
				if (StringUtils.isNotBlank(searchMiaoDetailVO.getUserId())) {
					list.add(criteriaBuilder.equal(root.get("accountnum").as(int.class),Integer.parseInt(searchMiaoDetailVO.getUserId())));
				}
				// 如果任务名称不为空
				if (StringUtils.isNotBlank(searchMiaoDetailVO.getTaskName())) {
					list.add(criteriaBuilder.like(root.get("taskName").as(String.class),"%"+searchMiaoDetailVO.getTaskName()+"%"));
				}
				//如果开始时间存在
				if (null != searchMiaoDetailVO.getStartTime()) {
					list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("operationdatestamp").as(int.class),
							new Long(searchMiaoDetailVO.getStartTime().getTime()/1000).intValue()));
				}
				// 如果结束时间存在
				if (null != searchMiaoDetailVO.getEndTime()) {
					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("registrationDate"),
							new Long(searchMiaoDetailVO.getEndTime().getTime()/1000).intValue()));
				}
				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}
	@Override
	public boolean save(MiaoDetail miaoDetail) {
		// TODO Auto-generated method stub
		miaoDetail.setOperationdatestamp((int)(new Date().getTime()/1000));
		if(miaoDetailRepository.save(miaoDetail)==null) {
			return true;
		}else return false;
	}

}
