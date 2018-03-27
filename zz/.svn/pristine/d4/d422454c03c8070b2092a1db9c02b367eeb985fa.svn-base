package com.bizdata.app.circle.reply.service.impl;

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

import com.bizdata.app.circle.reply.controller.vo.CirReplySearchVO;
import com.bizdata.app.circle.reply.domain.CirReply;
import com.bizdata.app.circle.reply.repository.CirReplyRepository;
import com.bizdata.app.circle.reply.service.CirReplyService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.enum_util.EnumUtils;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 
 * @author Administrator
 *
 */
@Service
@Slf4j
public class CirReplyServiceImpl implements CirReplyService {

    private final CirReplyRepository cirreplyRepository;

    @Autowired
    public CirReplyServiceImpl(CirReplyRepository cirreplyRepository) {
        this.cirreplyRepository = cirreplyRepository;
    }

    @Override
    public boolean save(CirReply cirreply) {
        boolean state;
        try {
            cirreplyRepository.save(cirreply);
            state = true;
        } catch (Exception e) {
            log.error("保存或更新CirReply失败:", e);
            state = false;
        }
        return state;
    }

    @Override
    public Page<CirReply> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, CirReplySearchVO cirreplySearchVO) {
        return cirreplyRepository.findAll(listWhereClause(cirreplySearchVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
    }

    @Override
    public boolean delete(String id) {
        boolean state;
        try {
            cirreplyRepository.delete(id);
            state = true;
        } catch (Exception e) {
            log.error("CirReply删除失败:", e);
            state = false;
        }
        return state;
    }

    @Override
    public CirReply findOne(String id) {
        return cirreplyRepository.findOne(id);
    }

    /**
     * 条件查询
     *
     * @param cirreplySearchVO 条件查询VO
     * @return 条件
     */
    private Specification<CirReply> listWhereClause(CirReplySearchVO cirreplySearchVO) {
        return new Specification<CirReply>() {
            @Override
            public Predicate toPredicate(Root<CirReply> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();

                //如果搜索字段不为空
                if (StringUtils.isNotBlank(cirreplySearchVO.getType())) {
                	//如果关键词不为空
                	if(StringUtils.isNotBlank(cirreplySearchVO.getKey())) {
                		if("1".equals(cirreplySearchVO.getType())) {			//话题标题
                			list.add(criteriaBuilder.like(root.get("title").as(String.class),
        							"%" + cirreplySearchVO.getKey() + "%"));
                		}else if("2".equals(cirreplySearchVO.getType())){		//回复内容
                			list.add(criteriaBuilder.like(root.get("content").as(String.class),
        							"%" + cirreplySearchVO.getKey() + "%"));
                		}else if("3".equals(cirreplySearchVO.getType())){		//回复人昵称
                			list.add(criteriaBuilder.like(root.get("user_name").as(String.class),
        							"%" + cirreplySearchVO.getKey() + "%"));
                		}else if("4".equals(cirreplySearchVO.getType())){		//回复人id
                			list.add(criteriaBuilder.like(root.get("user_id").as(String.class),
        							"%" + cirreplySearchVO.getKey() + "%"));
                		}
                	}
                	
                }
                //如果开始时间存在
                if (null != cirreplySearchVO.getStartTime()) {
                    list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("createtime").as(Date.class), cirreplySearchVO.getStartTime()));
                }

                //如果结束时间存在
                if (null != cirreplySearchVO.getEndTime()) {
                    list.add(criteriaBuilder.lessThanOrEqualTo(root.get("createtime").as(Date.class), cirreplySearchVO.getEndTime()));
                }

                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
    }
    //获取目标已有楼层数
	@Override
	public int getMaxFloorByTypeAndId(int target_num, String target_id) {
		Integer k = cirreplyRepository.getMaxFloorByTypeAndId(target_num,target_id);
		if(k!=null){
			return k.intValue();
		}else{
			return 0;
		}
	}

	@Override
	@Transactional
	public boolean setStateByUserid(String userid, String state) {
		try {
			cirreplyRepository.setStateByUserid(userid,state);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
