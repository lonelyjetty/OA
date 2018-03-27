package com.bizdata.app.device.devicesource.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bizdata.app.device.devicesource.constant.AccreditTypeEnum;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Table(name = "device_source")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class DeviceSource extends JpaUUIDBaseEntity {
	/**
	* 
	*/
	private static final long serialVersionUID = -5788820403653516393L;

	/**
	 * 设备编号
	 */
	@Column
	private String deviceNo;

	/**
	 * 设备名称
	 */
	@Column
	private String deviceName;
	
	/**
	 * 设备编码
	 */
	@Column
	private String deviceCode;
	
	/**
	 * 授权方式
	 */
	@Enumerated(EnumType.STRING)
	@Column
	private AccreditTypeEnum accreditType;
	
	/**
	 * 设备描述
	 */
	@Column
	private String description;
	
	/**
	 * 设备功能类型<p>
	 * 1:运动2:睡眠3:血压4:血糖5:温度6:行为监测7:瘦身8:心率<p>
	 * 多选，其中用逗号分割
	 */
	@Column
	private String functionType;

	/**
	 * 设备id(由第三方传递过来)
	 */
	@Column
	private String connectionType;
	
	/**
	 * 连接类型(1:蓝牙连接,2:扫描二维码,3:auth2授权)
	 */
	@Column
	private String linkType;

	/**
	 * 设备Logo
	 */
	@Column
	private String deviceLogo;
	
	/**
	 * 描述图片
	 */
	@Column
	private String descriptionUrl;

	/**
	 * 设备分类主键
	 */
	@Column
	private String typeId;
	
	@Column
	private String functionTypeDes;
	
	/**
	 * 复选框是否已经被选中
	 */
	@Transient
	private List<Boolean> isChecked;
}