package com.bizdata.app.device.devicecata.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.device.devicecata.domain.DeviceCata;

import me.sdevil507.base.JpaBaseRepository;

public interface DeviceCataResitory extends JpaBaseRepository<DeviceCata, String> {

	@Query(value="select d.deviceCataName, d.id from DeviceCata as d where d.isDel = '0'")
	List<Object> findDeviceCataNameAndId();

}
