package com.bizdata.app.activity.hotevents.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 热门活动
 * 
 * @author w
 *
 */
@Table(name = "activity_hots")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class HotEvents extends JpaUUIDBaseEntity {
	/**
	* 
	*/
	private static final long serialVersionUID = 4234534259479812313L;

	/**
	 * 活动名称
	 */
	@Column
	private String eventName;

	/**
	 * 图片
	 */
	@Column
	private String picUrl;

	/**
	 * 活动链接
	 */
	@Column
	private String eventUrl;

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
	 * 参与人数基数
	 */
	@Column
	private Integer joinBaseNum = 0;

	/**
	 * 状态:1:正常-1下线
	 */
	@Column
	private String state;

	/**
	 * 参与人数
	 */
	@Transient
	private Integer joinNum = 0;
	
	/**
	 * 活动是否已经开始
	 */
	@Transient
	private String isStrat;
}
