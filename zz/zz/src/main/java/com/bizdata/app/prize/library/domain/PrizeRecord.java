package com.bizdata.app.prize.library.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 奖品领奖记录表
 * @author w
 *
 */
@Table(name = "prize_accept_details")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class PrizeRecord extends JpaUUIDBaseEntity {/**
	 * 
	 */
	private static final long serialVersionUID = -8457422904186856835L;
	
	/**
	 * 领奖用户id
	 */
	@Column
	private String userId;
	
	/**
	 * 昵称
	 */
	@Transient
	private String nickName;
	
	/**
	 * 领奖时间
	 */
	@Column
	private Date acceptDate;
	
	/**
	 * 是否兑换奖品<P>
	 * YES NO
	 */
	@Column
	private String isExchange;
	
	/**
	 * 兑换时间
	 */
	@Column
	private Date exchange;

	/**
	 * 奖品id
	 */
	@Column
	private Integer prizeId;

}
