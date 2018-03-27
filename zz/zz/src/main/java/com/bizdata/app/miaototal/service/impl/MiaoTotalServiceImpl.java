package com.bizdata.app.miaototal.service.impl;

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

import com.bizdata.app.maguser.service.MagUserService;
import com.bizdata.app.miaototal.controller.vo.SearchMiaoTotalVO;
import com.bizdata.app.miaototal.domain.MiaoTotal;
import com.bizdata.app.miaototal.repository.MiaoTotalRepository;
import com.bizdata.app.miaototal.service.MiaoTotalService;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
public class MiaoTotalServiceImpl implements MiaoTotalService {
	private final MiaoTotalRepository miaoTotalRepository;
	private final MagUserService magUserService;

	@Autowired
	public MiaoTotalServiceImpl(MiaoTotalRepository miaoTotalRepository,MagUserService magUserService) {
		this.miaoTotalRepository = miaoTotalRepository;
		this.magUserService = magUserService;
	}
	@Override
	public Page<MiaoTotal> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchMiaoTotalVO searchMiaoTotalVO) {
		return miaoTotalRepository.findAll(listWhereClause(searchMiaoTotalVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}
	
	private Specification<MiaoTotal> listWhereClause(SearchMiaoTotalVO searchMiaoTotalVO) {
		return new Specification<MiaoTotal>() {
			@Override
			public Predicate toPredicate(Root<MiaoTotal> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果用户ID不为空
				if (StringUtils.isNotBlank(searchMiaoTotalVO.getUserId())) {
					list.add(criteriaBuilder.like(root.get("userId").as(String.class),
							"%" + searchMiaoTotalVO.getUserId() + "%"));
				}


				// 如果开始时间存在
				if (null != searchMiaoTotalVO.getStartTime()) {
					System.out.println(searchMiaoTotalVO.getStartTime().toGMTString());
					list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("registrationDate"),
							searchMiaoTotalVO.getStartTime()));
				}

				// 如果结束时间存在
				if (null != searchMiaoTotalVO.getEndTime()) {
					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("registrationDate"),
							searchMiaoTotalVO.getEndTime()));
				}


				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}
	/*
	 * 修改用户阳光币(non-Javadoc)
	 * @see com.bizdata.app.miaototal.service.MiaoTotalService#updateMiao(int, int)
	 */
	@Override
	public boolean updateMiao(int accountnum, int num) {
		if(miaoTotalRepository.findByAccountnum(accountnum) == null){
			MiaoTotal miao = new MiaoTotal();
			miao.setAccountnum(accountnum);
			miao.setUserId(magUserService.getIdByAccountnum(accountnum));
			if(num<0) {
				return false;
			}
			miao.setMiaoMoney(num);
			miaoTotalRepository.save(miao);
		}else {
			miaoTotalRepository.updateMiao(accountnum, num);
		}
		return true;
	}
}
