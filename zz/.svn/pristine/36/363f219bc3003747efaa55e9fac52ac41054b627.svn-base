package com.bizdata.app.activity.paoma.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Table(name = "activity_paoma")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class PaoMa extends JpaUUIDBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6746204081881461723L;

	/**
	 * 活动序号
	 */
	private String activityNo;

	private String actionName;

	private String picUrl;

	private Date startDate;

	private Date endDate;

	/**
	 * 活动状态
	 * <p>
	 * 0：上线 1：下线
	 */
	@Column
	private String state;

	private Date deadline;

	private String rankingType;

	private String rankingLimit;

	private String prizeUrl;

	/**
	 * 奖品库的id
	 * 
	 */
	@Column
	private Integer prizeId;

	/**
	 * 是否置顶
	 * <p>
	 * 1:置顶 0:不置顶
	 */
	@Column
	private String isStick;

	/**
	 * 报名人数
	 */
	@Transient
	private Integer peopleNum;

}
