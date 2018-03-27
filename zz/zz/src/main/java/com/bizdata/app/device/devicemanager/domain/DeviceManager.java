package com.bizdata.app.device.devicemanager.domain;

import java.util.Date;
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

@Table(name = "device_manager")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class DeviceManager extends JpaUUIDBaseEntity {
	/**
	* 
	*/
	private static final long serialVersionUID = -1622249428529625234L;

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
	 * 设备功能类型
	 * <p>
	 * 1:运动2:睡眠3:血压4:血糖5:温度6:行为监测7:瘦身8:心率
	 * <p>
	 * 多选，其中用逗号分割
	 */
	@Column
	private String functionType;

	/**
	 * 连接类型
	 */
	@Column
	private String linkType;

	/**
	 * 设备分类(存放的分类是主键)
	 */
	@Column
	private String deviceCataId;
	
	/**
	 * 设备名称
	 */
	@Transient
	private String deviceCataName;

	/**
	 * 支持的版本号
	 */
	@Transient
	private String supportVersion;

	/**
	 * 设备状态
	 * <P>
	 * 0:即将上线1:上线-1:下线
	 */
	@Column
	private String state;

	/**
	 * 商品编号
	 */
	@Column
	private String commodityNo;

	/**
	 * 绑定人数
	 */
	@Transient
	private Integer bindingNum;

	/**
	 * 是否推荐
	 * <P>
	 * 0:否1:是
	 */
	@Column
	private String isRecommend;

	/**
	 * 设备绑定描述(以图片形式描述)
	 */
	@Column
	private String bingingImg;

	/**
	 * 排序号
	 */
	@Column
	private Integer sortNo;

	/**
	 * 设备Logo
	 */
	@Column
	private String deviceLogo;

	/**
	 * 创建时间
	 */
	@Column
	private Date createDate;
	
	/**
	 * 设备id = connect_type
	 */
	@Column
	private String connectType;
	
	/**
	 * 设备功能类型分类
	 */
	@Column
	private String functionTypeDes;
	
	/**
	 * 复选框是否已经被选中
	 */
	@Transient
	private List<Boolean> isChecked;
}
