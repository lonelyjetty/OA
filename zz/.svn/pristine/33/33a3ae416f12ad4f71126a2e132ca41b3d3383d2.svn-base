package com.bizdata.app.circle.report.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.bizdata.app.circle.report.domain.Report;
import com.bizdata.app.circle.report.repository.ReportRepository;
import com.bizdata.app.circle.report.service.ReportService;
import com.bizdata.app.sleepdata.controller.vo.SleepSearchVO;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 
 * @author Administrator
 *
 */
@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private ReportRepository reportRepository;

    @Override
    public Page<Report> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, SleepSearchVO sleepSearchVO) {
        return reportRepository.findAll(listWhereClause(sleepSearchVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
    }

    /**
     * 条件查询
     *
     * @param sleepSearchVO 条件查询VO
     * @return 条件
     */
    private Specification<Report> listWhereClause(SleepSearchVO sleepSearchVO) {
        return new Specification<Report>() {
            @Override
            public Predicate toPredicate(Root<Report> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();

//
//                //如果数据来源存在
//                if (StringUtils.isNotBlank(sleepSearchVO.getDataSource())) {
//                    list.add(criteriaBuilder.equal(root.get("dataSource"), sleepSearchVO.getDataSource()));
//                }

                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
    }
}
