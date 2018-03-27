package com.bizdata.app.device.devicecata.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Table(name = "device_cata")
@Entity
@Data
public class DeviceCata {
	
	@Id
	@Column(name = "id")
	protected String id;

	/**
	 * 设备分类名称
	 */
	@Column
	private String deviceCataName;
	
	/**
	 * 设备分类描述
	 */
	@Column
	private String description;
	
	/**
	 * 类型编码<P>
	 * 1:老人类2:手环类3:手表类
	 */
	@Column
	private String typeCode;
	
	/**
	 * 是否删除(状态)<p>
	 * 0:否 1:是
	 */
	@Column
	private String isDel;
	
	/**
	 * 排序号
	 */
	@Column
	private Integer sortNo;
	
	/**
	 * 分类Logo
	 */
	@Column
	private String cataLogo;
	
	/**
	 * 创建时间
	 */
	@Column
	private Date createDate;
}
