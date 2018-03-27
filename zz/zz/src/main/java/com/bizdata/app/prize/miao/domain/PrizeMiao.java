package com.bizdata.app.prize.miao.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "prize_miao")
@Data
@EqualsAndHashCode(callSuper = true)
public class PrizeMiao extends JpaUUIDBaseEntity {/**
	 * 
	 */
	private static final long serialVersionUID = -3898456356524641445L;

	/**
	 * 任务名称
	 */
	@Column
	private String taskName;
	
	/**
	 * 限制类型<p>0：不限制 1：按操作的媒体次数限制  2：按操作的总次数限制
	 */
	@Column
	private String limitType;
	
	/**
	 * 限制次数
	 */
	@Column
	private Integer limitNum;
	
	/**
	 * 妙币
	 */
	@Column
	private Float miaoNum;
	
	/**
	 * 经验
	 */
	@Column
	private Float experience;
	
	/**
	 * 状态<p>1:正常 -1:停用
	 */
	@Column
	private String state;
}
