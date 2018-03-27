package com.bizdata.app.bpdata.service.impl;

import com.bizdata.app.bpdata.controller.vo.SearchBpDataVO;
import com.bizdata.app.bpdata.domain.BpData;
import com.bizdata.app.bpdata.repository.BpDataRepository;
import com.bizdata.app.bpdata.service.BpDataService;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * BpDataServiceImpl
 * <p>
 * Created by sdevil507 on 2017/9/7.
 */
@Service
public class BpDataServiceImpl implements BpDataService {

    private final BpDataRepository bpDataRepository;

    @Autowired
    public BpDataServiceImpl(BpDataRepository bpDataRepository) {
        this.bpDataRepository = bpDataRepository;
    }

    @Override
    public Page<BpData> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, SearchBpDataVO searchBpDataVO) {
        return bpDataRepository.findAll(listWhereClause(searchBpDataVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
    }

    /**
     * 条件查询
     *
     * @param searchBpDataVO 条件查询VO
     * @return 条件
     */
    private Specification<BpData> listWhereClause(SearchBpDataVO searchBpDataVO) {
        return new Specification<BpData>() {
            @Override
            public Predicate toPredicate(Root<BpData> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();
                //如果用户ID不为空
                if (StringUtils.isNotBlank(searchBpDataVO.getProfileId())) {
                    list.add(criteriaBuilder.like(root.get("profileId").as(String.class), "%" + searchBpDataVO.getProfileId() + "%"));
                }

                //如果设备SN号不为空
                if (StringUtils.isNotBlank(searchBpDataVO.getDeviceSn())) {
                    list.add(criteriaBuilder.like(root.get("deviceSn").as(String.class), "%" + searchBpDataVO.getDeviceSn() + "%"));
                }

                //如果设备编号不为空
                if (StringUtils.isNotBlank(searchBpDataVO.getDeviceNo())) {
                    list.add(criteriaBuilder.like(root.get("deviceNo").as(String.class), "%" + searchBpDataVO.getDeviceNo() + "%"));
                }

                //如果开始时间存在
                if (null != searchBpDataVO.getStartTime()) {
                    list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("measureTime").as(Date.class), searchBpDataVO.getStartTime()));
                }

                //如果结束时间存在
                if (null != searchBpDataVO.getEndTime()) {
                    list.add(criteriaBuilder.lessThanOrEqualTo(root.get("measureTime").as(Date.class), searchBpDataVO.getEndTime()));
                }

                //如果心率等级不为0
                if (0 != searchBpDataVO.getHeartRateLevel()) {
                    list.add(criteriaBuilder.equal(root.get("heartRateLevel"), searchBpDataVO.getHeartRateLevel()));
                }

                //如果血压等级不为0
                if (0 != searchBpDataVO.getBloodPressLevel()) {
                    list.add(criteriaBuilder.equal(root.get("bloodPressLevel"), searchBpDataVO.getBloodPressLevel()));
                }

                //如果血压趋势不为0
                if (0 != searchBpDataVO.getBloodPressTrend()) {
                    list.add(criteriaBuilder.equal(root.get("bloodPressTrend"), searchBpDataVO.getBloodPressTrend()));
                }

                //如果数据来源存在
                if (StringUtils.isNotBlank(searchBpDataVO.getDataSource())) {
                    list.add(criteriaBuilder.equal(root.get("dataSource"), searchBpDataVO.getDataSource()));
                }

                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
    }
}
