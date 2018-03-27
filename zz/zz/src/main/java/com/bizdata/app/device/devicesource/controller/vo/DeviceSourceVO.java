package com.bizdata.app.device.devicesource.controller.vo;

import javax.persistence.Transient;

import lombok.Data;

@Data
public class DeviceSourceVO {
	/**
	 * 设备名称
	 */
	private String deviceName;

	/**
	 * 设备功能类型<p>
	 * 1:运动2:睡眠3:血压4:血糖5:温度6:行为监测7:瘦身8:心率<p>
	 */
	private String functionType;
	
	/**
	 * 连接类型(绑定方式)
	 */
	@Transient
	private String linkType;
}
