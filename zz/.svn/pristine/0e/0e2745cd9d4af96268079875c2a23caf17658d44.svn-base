package com.bizdata.app.shortcutkey.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "app_key")
@Data
@EqualsAndHashCode(callSuper = true)
public class ShortcutKey extends JpaUUIDBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6292766019444230982L;

	/**
	 * 排序号
	 */
	@Column
	private Integer sortNo;
	
	/**
	 * 类型<p>
	 * 1:在线咨询提问快捷词 2:妙加搜索快捷搜索词
	 */
	@Column
	private String types;
	
	/**
	 * 关键词
	 */
	@Column
	private String keyes;
	
	/**
	 * 更新时间
	 */
	@Column
	private Date updateDate;
	
	/**
	 * 设备SN码(对应设备中设备编号)(只有type=2时才有)
	 */
	@Column
	private String deviceSn;
	
	/**
	 * 关键词描述(只有type=1时才有)
	 */
	@Column
	private String description;
}
