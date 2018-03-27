package com.bizdata.app.device.devicesource.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.bizdata.app.device.devicesource.controller.vo.DeviceSourceVO;
import com.bizdata.app.device.devicesource.domain.DeviceSource;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface DeviceSourceService {

	/**
	 * 分页
	 * @param jpaPageParamVO
	 * @param jpaSortParamVO
	 * @param deviceSourceVO
	 * @return
	 */
	Page<DeviceSource> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			DeviceSourceVO deviceSourceVO);

	/**
	 * 保存对象
	 * @param deviceSource
	 * @return
	 */
	boolean save(DeviceSource deviceSource);

	/**
	 * 
	 * @param id
	 * @return
	 */
	DeviceSource findOne(String id);

	/**
	 * 获取所有的数据
	 * @return
	 */
	List<DeviceSource> findAll();

}
