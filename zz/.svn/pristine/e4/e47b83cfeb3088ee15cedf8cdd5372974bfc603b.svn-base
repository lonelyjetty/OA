package com.bizdata.app.sleepdata.service.impl;

import com.bizdata.app.sleepdata.controller.vo.SleepSearchVO;
import com.bizdata.app.sleepdata.domain.SleepData;
import com.bizdata.app.sleepdata.repository.SleepDataRepository;
import com.bizdata.app.sleepdata.service.SleepDataService;
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
import java.util.List;

/**
 * SleepDataServiceImpl
 * <p>
 * Created by sdevil507 on 2017/9/6.
 */
@Service
public class SleepDataServiceImpl implements SleepDataService {

    @Autowired
    private SleepDataRepository sleepDataRepository;

    @Override
    public Page<SleepData> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, SleepSearchVO sleepSearchVO) {
        return sleepDataRepository.findAll(listWhereClause(sleepSearchVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
    }

    /**
     * 条件查询
     *
     * @param sleepSearchVO 条件查询VO
     * @return 条件
     */
    private Specification<SleepData> listWhereClause(SleepSearchVO sleepSearchVO) {
        return new Specification<SleepData>() {
            @Override
            public Predicate toPredicate(Root<SleepData> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();
                //如果用户ID不为空
                if (StringUtils.isNotBlank(sleepSearchVO.getProfileId())) {
                    list.add(criteriaBuilder.like(root.get("profileId").as(String.class), "%" + sleepSearchVO.getProfileId() + "%"));
                }

                //如果设备SN号不为空
                if (StringUtils.isNotBlank(sleepSearchVO.getDeviceSn())) {
                    list.add(criteriaBuilder.like(root.get("deviceSn").as(String.class), "%" + sleepSearchVO.getDeviceSn() + "%"));
                }

                //如果设备编号不为空
                if (StringUtils.isNotBlank(sleepSearchVO.getDeviceNo())) {
                    list.add(criteriaBuilder.like(root.get("deviceNo").as(String.class), "%" + sleepSearchVO.getDeviceNo() + "%"));
                }

                //如果开始时间存在
                if (null != sleepSearchVO.getStartTime()) {
                    list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("dateTime"), sleepSearchVO.getStartTime()));
                }

                //如果结束时间存在
                if (null != sleepSearchVO.getEndTime()) {
                    list.add(criteriaBuilder.lessThanOrEqualTo(root.get("dateTime"), sleepSearchVO.getEndTime()));
                }

                //如果睡眠质量不为空
                if (StringUtils.isNotBlank(sleepSearchVO.getQuality())) {
                    list.add(criteriaBuilder.equal(root.get("quality"), sleepSearchVO.getQuality()));
                }

                //如果数据来源存在
                if (StringUtils.isNotBlank(sleepSearchVO.getDataSource())) {
                    list.add(criteriaBuilder.equal(root.get("dataSource"), sleepSearchVO.getDataSource()));
                }

                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
    }
}
