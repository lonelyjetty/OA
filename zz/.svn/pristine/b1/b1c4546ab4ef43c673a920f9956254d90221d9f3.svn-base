package com.bizdata.app.activity.lotto.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 抽奖活动
 * 
 * @author w
 *
 */
@Table(name = "activity_lotto")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class Lotto extends JpaUUIDBaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1338193645734458445L;

	/**
	 * 活动名称
	 */
	@Column
	private String lottoName;

	/**
	 * 图片
	 */
	@Column
	private String picUrl;

	/**
	 * 活动链接
	 */
	@Column
	private String lottoUrl;

	@Column
	private Date startDate;

	@Column
	private Date endDate;

	/**
	 * 活动状态 1：正常 -1 停用
	 */
	@Column
	private String state;

	/**
	 * 排序
	 */
	@Column
	private Integer sortNo;
}
