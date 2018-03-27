package com.bizdata.app.circle.circle_classification.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicUpdate;

import com.bizdata.app.circle.circle_classification.constant.StateEnum;


import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Table(name = "app_circleClass")
@Entity
@DynamicUpdate
@Data
@EqualsAndHashCode(callSuper = true)
public class CircleClassi extends JpaUUIDBaseEntity {
	/*
	 * 圈子状态
	 */
	@Enumerated(EnumType.STRING)
	@Column
	private StateEnum stateEnum;
	/*
	 * 圈子标题
	 */
	@Column
	private String title;
	/*
	 * 圈子序号
	 */
	@Column
	private int serialNum;
	/*
	 * 创建人姓名
	 */
	@Column
	private String createname;
	/*
	 * 圈子创建时间
	 */
	@Column(updatable=false)
	@CreationTimestamp
	private Date createdate;
	
	
}
