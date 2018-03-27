package com.bizdata.app.activity.flow.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Table(name = "activity_flow")
@Entity
@Data
public class Flow {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	/**
	 * 充值类型1:单次充值 2:批量充值
	 */
	@Transient
	private String rechargeType;

	/**
	 * 手机号
	 */
	@Column
	private String mobile;

	/**
	 * 面值
	 */
	@Column(columnDefinition = "float(10,2) default '0.00'")
	private Float faceValue;

	/**
	 * 创造时间
	 */
	@Column
	private Date createDate;

	/**
	 * 状态 1：成功 -1：失败
	 */
	@Column
	private String state;

	/**
	 * 金额(添加页面中没有,但是后期肯定会有)
	 */
	@Transient
	private Float money;
}
