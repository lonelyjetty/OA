package com.bizdata.app.service.option.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.service.option.controller.vo.SearchOptionVO;
import com.bizdata.app.service.option.domain.HaOption;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface OptionService {

	/**
	 * 分页查询
	 * @param jpaPageParamVO
	 * @param jpaSortParamVO
	 * @param searchOptionVO
	 * @return
	 */
	Page<HaOption> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchOptionVO searchOptionVO);

	/**
	 * 保存或者更新对象
	 * @param haOption
	 * @return
	 */
	boolean save(HaOption haOption);

	/**
	 * 根据主键添加内容
	 * @param id
	 * @return
	 */
	HaOption findOne(String id);

	/**
	 * 删除一个对象
	 * @param id
	 * @return
	 */
	boolean delete(String id);

}
