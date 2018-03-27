package com.bizdata.app.circle.circle_mag.service;

import java.util.Map;

import org.springframework.data.domain.Page;

import com.bizdata.app.circle.circle_classification.domain.CircleClassi;
import com.bizdata.app.circle.circle_mag.controller.vo.SearchCircleVO;
import com.bizdata.app.circle.circle_mag.domain.Circle;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface CircleService {

	/**
     * 分页获取圈子消息
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param bootSearchVO   查询VO
     * @return 分页记录
     */
	Page<Circle> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchCircleVO searchCircleVO);
	/**
	 * 保存圈子
	 * @param circleClass 消息内容
	 * @return 执行反馈 
	 */
	boolean save(Circle circleClass);
	/**
	 * 发布圈子
	 * @param circleClass 消息内容
	 * @return 执行反馈
	 */
	boolean release(Circle circleClass);
	int getMaxcircleid();
	int getCircleid(String id);
	Map<String, String> findNameAndIdByCircleclass(String classid);
	String getNameById(String circleeeid);
	Circle findOne(String id);
	//设置话题数
	public void setTopicnum(int circleId);
}
