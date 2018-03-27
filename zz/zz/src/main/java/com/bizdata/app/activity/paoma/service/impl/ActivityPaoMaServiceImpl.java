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

import com.bizdata.app.activity.paoma.controller.vo.SearchPaoMaVO;
import com.bizdata.app.activity.paoma.domain.PaoMa;
import com.bizdata.app.activity.paoma.repository.ActivityPaoMaRepository;
import com.bizdata.app.activity.paoma.service.ActivityPaoMaService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class ActivityPaoMaServiceImpl implements ActivityPaoMaService{

	private final ActivityPaoMaRepository activityPaoMaRepository;
	
	@Autowired
    public ActivityPaoMaServiceImpl(ActivityPaoMaRepository activityPaoMaRepository) {
        this.activityPaoMaRepository = activityPaoMaRepository;
    }
	
	@Override
	public Page<PaoMa> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchPaoMaVO searchPaoMaVO) {
		return activityPaoMaRepository.findAll(listWhereClause(searchPaoMaVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	    
	}
	
	 /**
     * 条件查询
     *
     * @param searchPaoMaVO 条件查询VO
     * @return 条件
     */
    private Specification<PaoMa> listWhereClause(SearchPaoMaVO searchPaoMaVO) {
        return new Specification<PaoMa>() {
            @Override
            public Predicate toPredicate(Root<PaoMa> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();
                // 如果活动名称存在
                if(StringUtils.isNotBlank(searchPaoMaVO.getActivityName())) {
                	// 添加like时需要加上%
                	list.add(criteriaBuilder.like(root.get("actionName").as(String.class), "%" + searchPaoMaVO.getActivityName() + "%"));
                }
                // 如果活动状态存在
                if(StringUtils.isNotBlank(searchPaoMaVO.getActivityType())) {
                	list.add(criteriaBuilder.equal(root.get("state").as(String.class), searchPaoMaVO.getActivityType()));
                }
//                //如果位置信息是枚举中值
//                if (EnumUtils.contains(searchPaoMaVO.getBannerPositionEnum(), BannerPositionEnum.class)) {
//                    list.add(criteriaBuilder.equal(root.get("bannerPositionEnum").as(String.class), searchPaoMaVO.getBannerPositionEnum()));
//                }
//
//                //如果开始时间存在
//                if (null != searchPaoMaVO.getStartTime()) {
//                    list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("startTime").as(Date.class), searchPaoMaVO.getStartTime()));
//                }
//
//                //如果结束时间存在
//                if (null != searchPaoMaVO.getEndTime()) {
//                    list.add(criteriaBuilder.lessThanOrEqualTo(root.get("endTime").as(Date.class), searchPaoMaVO.getEndTime()));
//                }

                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
    }

	@Override
	public boolean save(PaoMa paoMa) {
		boolean state;
        try {
        	activityPaoMaRepository.save(paoMa);
            state = true;
        } catch (Exception e) {
            log.error("保存或更新PaoMa失败:", e);
            state = false;
        }
        return state;
	}

	@Override
	public PaoMa findOne(String id) {
		return activityPaoMaRepository.findOne(id);
	}

	@Override
	public String getMaxNo() {
		Integer maxNo = null;
		String no = activityPaoMaRepository.getMaxNO();
		if("".equals(no) || null == no) {
			maxNo = Integer.valueOf(1);// 序号不存在,即表中无记录
		} else {
			maxNo = Integer.valueOf(no) + 1;
		} 
		return String.valueOf(maxNo);
	}

}
