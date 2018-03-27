package com.bizdata.app.device.devicesource.service.impl;

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

import com.bizdata.app.device.devicesource.controller.vo.DeviceSourceVO;
import com.bizdata.app.device.devicesource.domain.DeviceSource;
import com.bizdata.app.device.devicesource.repository.DeviceSourceRepository;
import com.bizdata.app.device.devicesource.service.DeviceSourceService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class DeviceSourceServiceImpl implements DeviceSourceService {
	private final DeviceSourceRepository deviceSourceRepository;

	@Autowired
	public DeviceSourceServiceImpl(DeviceSourceRepository deviceSourceRepository) {
		this.deviceSourceRepository = deviceSourceRepository;
	}

	@Override
	public Page<DeviceSource> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			DeviceSourceVO deviceSourceVO) {
		return deviceSourceRepository.findAll(listWhereClause(deviceSourceVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	/**
	 * 设置过滤参数
	 * 
	 * @param deviceSourceVO
	 * @return
	 */
	private Specification<DeviceSource> listWhereClause(DeviceSourceVO deviceSourceVO) {
		return new Specification<DeviceSource>() {
			@Override
			public Predicate toPredicate(Root<DeviceSource> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果设备名称存在
				if (!StringUtils.isBlank(deviceSourceVO.getDeviceName())) {
					list.add(criteriaBuilder.like(root.get("deviceName").as(String.class),
							"%" + deviceSourceVO.getDeviceName() + "%"));

				}
				// 如果设备功能存在
				if (!StringUtils.isBlank(deviceSourceVO.getFunctionType())) {
					list.add(criteriaBuilder.like(root.get("functionType").as(String.class),
							"%" + deviceSourceVO.getFunctionType() + "%"));
				}

				// 如果设备连接方式存在
				if (!StringUtils.isBlank(deviceSourceVO.getFunctionType())) {
					list.add(
							criteriaBuilder.equal(root.get("linkType").as(String.class), deviceSourceVO.getLinkType()));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	@Override
	public boolean save(DeviceSource deviceSource) {
		boolean state;
		try {
			deviceSourceRepository.save(deviceSource);
			state = true;
		} catch (Exception e) {
			log.error("新增设备库数据失败:", e);
			state = false;
		}
		return state;
	}

	@Override
	public DeviceSource findOne(String id) {
		return deviceSourceRepository.findOne(id);
	}

	@Override
	public List<DeviceSource> findAll() {
		return deviceSourceRepository.findAll();
	}

}
