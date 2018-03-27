package com.bizdata.app.device.devicemanager.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.device.devicemanager.controller.vo.DeviceManagerVO;
import com.bizdata.app.device.devicemanager.domain.DeviceManager;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface DeviceManagerService {

	/**
	 * 显示分页信息
	 * 
	 * @param jpaPageParamVO
	 * @param jpaSortParamVO
	 * @param deviceManagerVO
	 * @return
	 */
	Page<DeviceManager> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			DeviceManagerVO deviceManagerVO);

	/**
	 * 保存对象或者修改对象
	 * 
	 * @param deviceManager
	 * @return
	 */
	boolean save(DeviceManager deviceManager);

	/**
	 * 根据主键查找对象
	 * 
	 * @param id
	 * @return
	 */
	DeviceManager findOne(String id);

}
