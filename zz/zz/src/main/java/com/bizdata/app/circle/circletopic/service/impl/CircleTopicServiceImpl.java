package com.bizdata.app.circle.circletopic.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.bizdata.app.circle.circletopic.controller.vo.CircleTopicSearchVO;
import com.bizdata.app.circle.circletopic.domain.CircleTopic;
import com.bizdata.app.circle.circletopic.repository.CircleTopicRepository;
import com.bizdata.app.circle.circletopic.service.CircleTopicService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 
 * @author Administrator
 *
 */
@Service
@Slf4j
public class CircleTopicServiceImpl implements CircleTopicService {

    private final CircleTopicRepository circleTopicRepository;

    @Autowired
    public CircleTopicServiceImpl(CircleTopicRepository circleTopicRepository) {
        this.circleTopicRepository = circleTopicRepository;
    }

    @Override
    public boolean save(CircleTopic circleTopic) {
        boolean state;
        try {
            circleTopicRepository.save(circleTopic);
            state = true;
        } catch (Exception e) {
            log.error("保存或更新CircleTopic失败:", e);
            state = false;
        }
        return state;
    }

    @Override
    public Page<CircleTopic> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, CircleTopicSearchVO circleTopicSearchVO) {
    	return circleTopicRepository.findAll(listWhereClause(circleTopicSearchVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
    }

    @Override
    public boolean delete(String id) {
        boolean state;
        try {
            circleTopicRepository.delete(id);
            state = true;
        } catch (Exception e) {
            log.error("CircleTopic删除失败:", e);
            state = false;
        }
        return state;
    }

    @Override
    public CircleTopic findOne(String id) {
        return circleTopicRepository.findOne(id);
    }

    /**
     * 条件查询
     *
     * @param circleTopicSearchVO 条件查询VO
     * @return 条件
     */
    private Specification<CircleTopic> listWhereClause(CircleTopicSearchVO circleTopicSearchVO) {
        return new Specification<CircleTopic>() {
            @Override
            public Predicate toPredicate(Root<CircleTopic> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();
                // 如果话题标题不为空
				if (StringUtils.isNotBlank(circleTopicSearchVO.getTitle())) {
					list.add(criteriaBuilder.like(root.get("title").as(String.class),
							"%" + circleTopicSearchVO.getTitle() + "%"));
				}
				// 如果圈子不为空
				if (StringUtils.isNotBlank(circleTopicSearchVO.getClassId())) {
					list.add(criteriaBuilder.like(root.get("classId").as(String.class),
							"%" + circleTopicSearchVO.getClassId() + "%"));
				}
				// 如果圈子分类不为空
				if (StringUtils.isNotBlank(circleTopicSearchVO.getCircleeeid())) {
					list.add(criteriaBuilder.like(root.get("circleeeid").as(String.class),
							"%" + circleTopicSearchVO.getCircleeeid() + "%"));
				}
				// 如果用户id不为空
				if (StringUtils.isNotBlank(circleTopicSearchVO.getUserId())) {
					list.add(criteriaBuilder.like(root.get("userId").as(String.class),
							"%" + circleTopicSearchVO.getUserId() + "%"));
				}
				// 如果状态存在
				if (StringUtils.isNotBlank(circleTopicSearchVO.getState())) {
					list.add(criteriaBuilder.equal(root.get("state"),
							circleTopicSearchVO.getState()));
				}	
				// 如果话题属性存在
				if (StringUtils.isNotBlank(circleTopicSearchVO.getType())) {
					if(circleTopicSearchVO.getType().equals("1")) {
						list.add(criteriaBuilder.equal(root.get("isEssence").as(int.class),1));
					}
					else if(circleTopicSearchVO.getType().equals("2")){
						list.add(criteriaBuilder.lessThanOrEqualTo(root.get("isStick").as(int.class),1));
					}
					else if(circleTopicSearchVO.getType().equals("3")){
						list.add(criteriaBuilder.lessThanOrEqualTo(root.get("isGeneralize").as(int.class),1));
					}
				}	
                //如果开始时间存在
                if (null != circleTopicSearchVO.getStarttime()) {
                    list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("createDate").as(Date.class), 
                    		circleTopicSearchVO.getStarttime()));
                }
                //如果结束时间存在
                if (null != circleTopicSearchVO.getEndtime()) {
                	list.add(criteriaBuilder.lessThanOrEqualTo(root.get("createDate").as(Date.class), 
                			circleTopicSearchVO.getEndtime()));
                }

                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
    }

	@Override
	public int getMaxtopicid() {
		Integer k = circleTopicRepository.getMaxtopicid();
		if(k==null) {
			return 0;
		}else {
			return k.intValue();
		}
	}
	//修改用户发表全部文章的状态
	@Override
	@Transactional
	public boolean setStateByUserid(String userid, String state) {
		try {
			circleTopicRepository.setStateByUserid(userid,state);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}


}
