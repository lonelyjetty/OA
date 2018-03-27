package com.bizdata.app.service.option.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "ha_option")
@Data
@EqualsAndHashCode(callSuper = true)
public class HaOption extends JpaUUIDBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 131188793693070026L;

	private String optionCode;

	private String optionName;

	private String description;

	// @Temporal(TemporalType.TIMESTAMP)
	// @Column(updatable = false)
	// @org.hibernate.annotations.CreationTimestamp
	private Date createTime;

	/**
	 * 选择得分
	 */
	@Transient
	private Double ToQuestionCode;

	/**
	 * 跳转问题编号
	 */
	@Transient
	private String skipCode;
	
	/**
	 * 对应问题的id
	 */
	@Transient
	private String questionId;

}
