package com.bizdata.app.prize.general.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "prize_general")
@Data
@EqualsAndHashCode(callSuper = true)
public class PrizeGeneral extends JpaUUIDBaseEntity {/**
	 * 
	 */
	private static final long serialVersionUID = -2756112210023506541L;
	
	/**
	 * 名称
	 */
	@Column
	private String generalName;
	
	/**
	 * 奖品类别<p>1:新手礼包
	 */
	@Column
	private String generalType = "1";
	
	/**
	 * 奖品id
	 */
	@Column
	private String prizeId;
	
	/**
	 * 奖品名称
	 */
	@Transient
	private String prizeName;
	
	/**
	 * 开始时间
	 */
	@Column
	private Date startDate;
	
	/**
	 * 结束时间
	 */
	@Column
	private Date endDate;
	
	/**
	 * 更新时间
	 */
	@Column
	private Date updateDate;

}
