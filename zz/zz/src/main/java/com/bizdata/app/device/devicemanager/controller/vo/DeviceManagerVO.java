package com.bizdata.app.device.devicemanager.controller.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DeviceManagerVO {

	/**
	 * 设备名称
	 */
	private String deviceName;

	/**
	 * 设备分类(设备分类的主键)
	 */
	private String deviceCataId;

	/**
	 * 设备功能类型
	 * <p>
	 * 1:运动2:睡眠3:血压4:血糖5:温度6:行为监测7:瘦身8:心率
	 * <p>
	 * 多选，其中用逗号分割
	 */
	private String functionType;

	/**
	 * 绑定方式(连接类型)
	 */
	private String connectionType;

	/**
	 * 设备状态
	 * <P>
	 * 0:即将上线1:上线-1:下线
	 */
	private String state;

	/**
	 * 开始创建的时间
	 */
	private Date startDate;

	/**
	 * 结束创建
	 */
	private Date endDate;

}
