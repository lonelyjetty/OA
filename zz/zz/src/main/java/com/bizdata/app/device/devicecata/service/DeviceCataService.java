package com.bizdata.app.device.devicecata.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;

import com.bizdata.app.device.devicecata.controller.vo.DeviceCataVO;
import com.bizdata.app.device.devicecata.domain.DeviceCata;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface DeviceCataService {

	/**
	 * 分页列表显示
	 * 
	 * @param jpaPageParamVO
	 * @param jpaSortParamVO
	 * @param deviceCataVO
	 * @return
	 */
	Page<DeviceCata> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			DeviceCataVO deviceCataVO);

	/**
	 * 保存对象或者更新对象
	 * 
	 * @param deviceCata
	 * @return
	 */
	boolean save(DeviceCata deviceCata);

	/**
	 * 根据主键获取相应的对象
	 * 
	 * @param id
	 * @return
	 */
	DeviceCata findOne(String id);

	/**
	 * 获取分类的名称和主键
	 * 
	 * @return
	 */
	Map<String, String> findNameAndId();

	/**
	 * 获取所有设备分类信息
	 * 
	 * @return
	 */
	List<DeviceCata> findAll();

}
