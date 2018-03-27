package com.bizdata.app.device.devicecata.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.bizdata.app.device.devicecata.controller.vo.DeviceCataVO;
import com.bizdata.app.device.devicecata.domain.DeviceCata;
import com.bizdata.app.device.devicecata.repository.DeviceCataResitory;
import com.bizdata.app.device.devicecata.service.DeviceCataService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class DeviceCataServiceImpl implements DeviceCataService {
	private final DeviceCataResitory deviceCataResitory;

	@Autowired
	public DeviceCataServiceImpl(DeviceCataResitory deviceCataResitory) {
		this.deviceCataResitory = deviceCataResitory;
	}

	@Override
	public Page<DeviceCata> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			DeviceCataVO deviceCataVO) {
		return deviceCataResitory.findAll(listWhereClause(deviceCataVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<DeviceCata> listWhereClause(DeviceCataVO deviceCataVO) {
		return new Specification<DeviceCata>() {
			@Override
			public Predicate toPredicate(Root<DeviceCata> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果设备分类名称存在
				if (!StringUtils.isBlank(deviceCataVO.getDeviceCataName())) {
					list.add(criteriaBuilder.like(root.get("deviceCataName").as(String.class),
							"%" + deviceCataVO.getDeviceCataName() + "%"));

				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	@Override
	public boolean save(DeviceCata deviceCata) {
		boolean state;
		try {
			deviceCataResitory.save(deviceCata);
			state = true;
		} catch (Exception e) {
			log.error("新增设备分类数据失败:", e);
			state = false;
		}
		return state;
	}

	@Override
	public DeviceCata findOne(String id) {
		return deviceCataResitory.findOne(id);
	}

	@Override
	public Map<String, String> findNameAndId() {
		Map<String, String> map = new HashMap<String, String>();
		List<Object> ss = deviceCataResitory.findDeviceCataNameAndId();
		if (ss == null) {
			return null;
		}
		for (int i = 0; i < ss.size(); i++) {
			Object[] kk = (Object[]) ss.get(i);
			map.put(kk[1].toString(), kk[0].toString());
		}
		return map;
	}

	@Override
	public List<DeviceCata> findAll() {
		return deviceCataResitory.findAll();
	}

}
