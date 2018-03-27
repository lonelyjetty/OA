package com.bizdata.app.service.assess.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.service.assess.controller.vo.SearchAssessVO;
import com.bizdata.app.service.assess.domain.HaAssessment;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface AssessService {
	/**
	 * 分页查询
	 *
	 * @param jpaPageParamVO
	 *            分页参数
	 * @param jpaSortParamVO
	 *            排序参数
	 * @param searchPaoMaVO
	 *            跑马圈查询参数VO
	 * @return 分页记录
	 */
	Page<HaAssessment> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchAssessVO searchAssessVO);

	 /**
     * 执行更新操作
     *
     * @param Ha 跑马圈实体
     * @return 执行反馈
     */
    boolean save(HaAssessment haAssessment);

    /**
     * 获取一个对象
     * @param id
     * @return
     */
	HaAssessment findOne(String id);
}
