package com.bizdata.app.activity.paoma.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.bizdata.app.activity.paoma.controller.vo.PaoMaMapPersonVO;
import com.bizdata.app.activity.paoma.controller.vo.SearchPaoMaVO;
import com.bizdata.app.activity.paoma.domain.PaoMa;
import com.bizdata.app.activity.paoma.domain.PaoMaDetails;
import com.bizdata.app.activity.paoma.domain.PaoMaMapPerson;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface PaoMaDetailsService {
	/**
	 * 根据活动ID获取相应的数据
	 * @param activityId
	 * @return
	 */
	List<PaoMaDetails> findByActivityId(String activityId);
	
	/**
     * 分页查询
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param paoMaMapPersonVO 跑马圈活动查询参数VO
     * @return 分页记录
     */
	Page<PaoMaDetails> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			PaoMaMapPersonVO paoMaMapPersonVO);
}
