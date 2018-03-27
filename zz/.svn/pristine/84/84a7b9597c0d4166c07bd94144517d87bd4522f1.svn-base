package com.bizdata.app.device.devicemanager.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.bizdata.app.device.devicemanager.controller.vo.DeviceManagerVO;
import com.bizdata.app.device.devicemanager.domain.DeviceManager;
import com.bizdata.app.device.devicemanager.repository.DeviceManagerRepository;
import com.bizdata.app.device.devicemanager.service.DeviceManagerService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class DeviceManagerServiceImpl implements DeviceManagerService {

	private final DeviceManagerRepository deviceManagerRepository;

	@Autowired
	public DeviceManagerServiceImpl(DeviceManagerRepository deviceManagerRepository) {
		this.deviceManagerRepository = deviceManagerRepository;
	}

	@Override
	public Page<DeviceManager> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			DeviceManagerVO deviceManagerVO) {
		return deviceManagerRepository.findAll(listWhereClause(deviceManagerVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<DeviceManager> listWhereClause(DeviceManagerVO deviceManagerVO) {
		return new Specification<DeviceManager>() {
			@Override
			public Predicate toPredicate(Root<DeviceManager> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果设备名称存在
				if (!StringUtils.isBlank(deviceManagerVO.getDeviceName())) {
					list.add(criteriaBuilder.like(root.get("deviceName").as(String.class),
							"%" + deviceManagerVO.getDeviceName() + "%"));

				}
				// 如果设备功能存在
				if (!StringUtils.isBlank(deviceManagerVO.getFunctionType())) {
					list.add(criteriaBuilder.like(root.get("functionType").as(String.class),
							"%" + deviceManagerVO.getFunctionType() + "%"));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	@Override
	public boolean save(DeviceManager deviceManager) {
		boolean state;
		try {
			deviceManagerRepository.save(deviceManager);
			state = true;
		} catch (Exception e) {
			log.error("新增设备管理库数据失败:", e);
			state = false;
		}
		return state;
	}

	@Override
	public DeviceManager findOne(String id) {
		return deviceManagerRepository.findOne(id);
	}

}
