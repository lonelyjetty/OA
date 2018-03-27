package com.bizdata.app.content.help.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "app_help")
@Data
@EqualsAndHashCode(callSuper = true)
public class Help extends JpaUUIDBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2253422379354134643L;

	// 问题描述
	private String question;

	// 问题答案
	private String answer;

	// 创建时间
	private Date createDate;

	/**
	 * 状态
	 * <p>
	 * 1:上线
	 * <p>
	 * -1:下线
	 */
	@Column
	private String state;
}
