package com.bizdata.app.prize.sign.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Table(name = "prize_sign")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class PrizeSign extends JpaUUIDBaseEntity {/**
	 * 
	 */
	private static final long serialVersionUID = -5791852923671311577L;
	
	/**
	 * 名称
	 */
	@Column
	private String signName;

	/**
	 * 奖励
	 */
	@Column
	private Integer prizeId;
	
	/**
	 * 奖励名称
	 */
	@Transient
	private String prizeName;
	
	/**
	 * 奖励说明文案
	 */
	@Column
	private String prizeDesciption;
	
	/**
	 * 背景图片
	 */
	@Column
	private String picUrl;
	
	/**
	 * 更新时间
	 */
	@Column
	private Date updateDate;

	/**
	 * 更新用户
	 */
	@Column
	private String userId;
	
	/**
	 * 更新用户名字
	 */
	@Transient
	private String userName;
}
