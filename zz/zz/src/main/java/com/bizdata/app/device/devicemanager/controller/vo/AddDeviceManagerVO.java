package com.bizdata.app.device.devicemanager.controller.vo;

import java.util.Map;

import com.bizdata.app.device.devicesource.domain.DeviceSource;

import lombok.Data;

/**
 * 新增的设备信息
 * @author w
 *
 */
@Data
public class AddDeviceManagerVO {
	
	private DeviceSource deviceSource;
	
	private Map<String, String> deviceCatas;

}
