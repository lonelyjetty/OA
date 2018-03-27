package com.bizdata.app.activity.paoma.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Table(name = "activity_paoma_prize")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class PaoMaMapPrize extends JpaUUIDBaseEntity {
	/**
	* 
	*/
	private static final long serialVersionUID = 8420073956083545386L;

	/**
	 * 奖品id
	 */
	@Column
	private Integer prizeId;

	/**
	 * 排名的开始
	 */
	@Column
	private Integer ranking;

	/**
	 * 排名的结束
	 */
	@Column
	private Integer rankingEnd;

	/**
	 * 对应的活动id
	 */
	@Column
	private String activityId;

	/**
	 * 奖品对应的图片
	 */
	@Column
	private String picUrl;

	/**
	 * 奖励名称
	 */
	@Column
	private String prizeName;
}
