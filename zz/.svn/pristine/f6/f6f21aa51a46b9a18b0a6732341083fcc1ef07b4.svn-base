package com.bizdata.app.activity.paoma.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 每个跑马圈活动下的每个参加人员
 * 
 * @author w
 *
 */
@Table(name = "activity_paoma_map_people")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class PaoMaMapPerson extends JpaUUIDBaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7582811449643946369L;

	@Column
	/**
	 * 活动ID关联到跑马圈活动的主键
	 */
	private String activityId;

	@Column
	/**
	 * 用户ID关联到用户表的主键
	 */
	private String userId;

	@Column
	/**
	 * 用户在该活动的中排名
	 */
	private Integer ranking;

	@Column
	/**
	 * 用户在该活动中的里程数
	 * <p>
	 * 应该和用户在运动数据中的数据相关
	 */
	private Float mileage;

	/**
	 * 是否获奖
	 * <p>
	 * 00:活动未结束 01:未获奖 02:获奖
	 */
	@Column
	private String isPrize;

	/**
	 * 是否发货
	 * <p>
	 * 00:活动未结束 01:未发货 02:已发货
	 */
	@Column
	private String isGoods;
}
