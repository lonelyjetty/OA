package com.bizdata.app.circle.circletopic.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.circle.circletopic.controller.vo.CircleTopicSearchVO;
import com.bizdata.app.circle.circletopic.domain.CircleTopic;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 
 * @author Administrator
 *
 */
public interface CircleTopicService {

    /**
     * 执行更新操作
     *
     * @param circleTopic circleTopic实体
     * @return 执行反馈
     */
    boolean save(CircleTopic circleTopic);

    /**
     * 分页查询
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param circleTopicSearchVO circleTopic查询参数VO
     * @return 分页记录
     */
    Page<CircleTopic> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, CircleTopicSearchVO circleTopicSearchVO);

    /**
     * 根据ID删除
     *
     * @param id id
     * @return 执行反馈
     */
    boolean delete(String id);

    /**
     * 根据ID获取CircleTopic记录
     *
     * @param id id
     * @return circleTopic记录
     */
    CircleTopic findOne(String id);

	int getMaxtopicid();
	//修改用户的文章状态
	boolean setStateByUserid(String id, String state);

}
