package com.bizdata.app.circle.circle_classification.service;

import java.util.Map;

import org.springframework.data.domain.Page;

import com.bizdata.app.circle.circle_classification.controller.vo.SearchCircleClassiVO;
import com.bizdata.app.circle.circle_classification.domain.CircleClassi;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface CircleClassiService {

	/**
     * 分页获取圈子消息
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param bootSearchVO   查询VO
     * @return 分页记录
     */
	Page<CircleClassi> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchCircleClassiVO searchCircleClassiVO);
	/**
	 * 保存圈子
	 * @param circleClass 消息内容
	 * @return 执行反馈 
	 */
	boolean save(CircleClassi circleClass);
	/**
	 * 发布圈子
	 * @param circleClass 消息内容
	 * @return 执行反馈
	 */
	boolean release(CircleClassi circleClass);
	Map<String, String> findNameAndId();
	String getNameById(String classId);
	CircleClassi findOne(String id);
}
