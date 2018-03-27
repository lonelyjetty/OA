package com.bizdata.app.homelocation.service.impl;

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

import com.bizdata.app.bpdata.domain.BpData;
import com.bizdata.app.homelocation.controller.vo.SearchHomeLocationVO;
import com.bizdata.app.homelocation.domain.HomeLocation;
import com.bizdata.app.homelocation.repository.HomeLocationRepository;
import com.bizdata.app.homelocation.service.HomeLocationService;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
public class HomeLocationServiceImpl implements HomeLocationService {
	
	private final HomeLocationRepository homeLocationRepository;

    @Autowired
    public HomeLocationServiceImpl(HomeLocationRepository homeLocationRepository) {
        this.homeLocationRepository = homeLocationRepository;
    }

	@Override
	public Page<HomeLocation> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchHomeLocationVO searchHomeLocationVO) {
		return homeLocationRepository.findAll(listWhereClause(searchHomeLocationVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<HomeLocation> listWhereClause(SearchHomeLocationVO searchHomeLocationVO) {
		return new Specification<HomeLocation>() {
            @Override
            public Predicate toPredicate(Root<HomeLocation> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();
//                //如果用户ID不为空
//                if (StringUtils.isNotBlank(searchHomeLocationVO.getProfileId())) {
//                    list.add(criteriaBuilder.like(root.get("profileId").as(String.class), "%" + searchHomeLocationVO.getProfileId() + "%"));
//                }
//
//                //如果设备SN号不为空
//                if (StringUtils.isNotBlank(searchHomeLocationVO.getDeviceSn())) {
//                    list.add(criteriaBuilder.like(root.get("deviceSn").as(String.class), "%" + searchHomeLocationVO.getDeviceSn() + "%"));
//                }
//
//                //如果设备编号不为空
//                if (StringUtils.isNotBlank(searchHomeLocationVO.getDeviceNo())) {
//                    list.add(criteriaBuilder.like(root.get("deviceNo").as(String.class), "%" + searchHomeLocationVO.getDeviceNo() + "%"));
//                }
//
//                //如果开始时间存在
//                if (null != searchHomeLocationVO.getStartTime()) {
//                    list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("measureTime").as(Date.class), searchHomeLocationVO.getStartTime()));
//                }
//
//                //如果结束时间存在
//                if (null != searchHomeLocationVO.getEndTime()) {
//                    list.add(criteriaBuilder.lessThanOrEqualTo(root.get("measureTime").as(Date.class), searchHomeLocationVO.getEndTime()));
//                }
//
//                //如果心率等级不为0
//                if (0 != searchHomeLocationVO.getHeartRateLevel()) {
//                    list.add(criteriaBuilder.equal(root.get("heartRateLevel"), searchHomeLocationVO.getHeartRateLevel()));
//                }
//
//                //如果血压等级不为0
//                if (0 != searchHomeLocationVO.getBloodPressLevel()) {
//                    list.add(criteriaBuilder.equal(root.get("bloodPressLevel"), searchHomeLocationVO.getBloodPressLevel()));
//                }
//
//                //如果血压趋势不为0
//                if (0 != searchHomeLocationVO.getBloodPressTrend()) {
//                    list.add(criteriaBuilder.equal(root.get("bloodPressTrend"), searchHomeLocationVO.getBloodPressTrend()));
//                }
//
//                //如果数据来源存在
//                if (StringUtils.isNotBlank(searchHomeLocationVO.getDataSource())) {
//                    list.add(criteriaBuilder.equal(root.get("dataSource"), searchHomeLocationVO.getDataSource()));
//                }

                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
	}
	@Override
	public HomeLocation findOne(String id) {
		return homeLocationRepository.findOne(id);
	}
	public boolean save(HomeLocation home) {
		boolean state;
        try {
        	homeLocationRepository.save(home);
            state = true;
        } catch (Exception e) {
            state = false;
        }
        return state;
	}
}
