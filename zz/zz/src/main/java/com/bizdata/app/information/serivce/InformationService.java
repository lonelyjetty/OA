package com.bizdata.app.information.serivce;

import org.springframework.data.domain.Page;

import com.bizdata.app.information.controller.vo.SearchInformationVO;
import com.bizdata.app.information.domain.Information;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface InformationService {

	/**
     * 分页获取消息
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param bootSearchVO   查询VO
     * @return 分页记录
     */
	Page<Information> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchInformationVO searchInformationVO);
	/**
	 * 保存消息
	 * @param information 消息内容
	 * @return 执行反馈 
	 */
	boolean save(Information information);
	
	/**
	 * 发布信息
	 * @param information 消息内容
	 * @return 执行反馈
	 */
	boolean release(Information information);
	
	/**
	 * 根据主键查询对象
	 * @param id
	 * @return
	 */
	Information findOne(String id);
}
