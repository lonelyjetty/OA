package com.bizdata.app.boot.service.impl;

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

import com.bizdata.app.boot.constant.BootOnlineStateEnum;
import com.bizdata.app.boot.controller.vo.BootSearchVO;
import com.bizdata.app.boot.domain.Boot;
import com.bizdata.app.boot.repository.BootRepository;
import com.bizdata.app.boot.service.BootService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.enum_util.EnumUtils;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * BootServiceImpl
 * <p>
 * Created by sdevil507 on 2017/9/5.
 */
@Service
@Slf4j
public class BootServiceImpl implements BootService {

    private final BootRepository bootRepository;

    @Autowired
    public BootServiceImpl(BootRepository bootRepository) {
        this.bootRepository = bootRepository;
    }

    @Override
    public Page<Boot> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, BootSearchVO bootSearchVO) {
        return bootRepository.findAll(listWhereClause(bootSearchVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
    }

    @Override
    public boolean save(Boot boot) {
        boolean state;
        try {
            bootRepository.save(boot);
            state = true;
        } catch (Exception e) {
            log.error("新增启动页数据失败:", e);
            state = false;
        }
        return state;
    }

    @Override
    public boolean delete(String id) {
        boolean state;
        try {
            bootRepository.delete(id);
            state = true;
        } catch (Exception e) {
            log.error("删除启动页失败:", e);
            state = false;
        }
        return state;
    }

    @Override
    public Boot findOne(String id) {
        return bootRepository.findOne(id);
    }

    /**
     * 条件查询
     *
     * @param bootSearchVO 条件查询VO
     * @return 条件
     */
    private Specification<Boot> listWhereClause(BootSearchVO bootSearchVO) {
        return new Specification<Boot>() {
            @Override
            public Predicate toPredicate(Root<Boot> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();
                //如果备注名称不为空
                if (StringUtils.isNotBlank(bootSearchVO.getRemarkName())) {
                    list.add(criteriaBuilder.like(root.get("remarkName").as(String.class), "%" + bootSearchVO.getRemarkName() + "%"));
                }

                //如果状态条件符合
                if (EnumUtils.contains(bootSearchVO.getBootOnlineStateEnum(), BootOnlineStateEnum.class)) {
                    list.add(criteriaBuilder.equal(root.get("bootOnlineStateEnum").as(String.class), bootSearchVO.getBootOnlineStateEnum()));
                }

                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
    }
}
