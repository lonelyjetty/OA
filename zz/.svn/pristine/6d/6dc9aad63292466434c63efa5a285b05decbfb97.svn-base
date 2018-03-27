package com.bizdata.app.information.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

import com.bizdata.app.information.constant.InformationStateEnum;
import com.bizdata.app.information.constant.InformationTargetEnum;
import com.bizdata.app.information.constant.InformationTypeEnum;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "app_information")
@Data
@EqualsAndHashCode(callSuper = true)
public class Information extends JpaUUIDBaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2382487726578387433L;
	/*
	 * 消息主题
	 */
	@Column
	private String theme;
	/*
	 * 消息类型
	 */
	@Enumerated(EnumType.STRING)
	@Column
	private InformationTypeEnum informationTypeEnum;
	/*
	 * 消息对象类型
	 */
	@Enumerated(EnumType.STRING)
	@Column
	private InformationTargetEnum informationTargetEnum;
	/*
	 * 消息对象
	 */
	@Column
	private String userinf;
	/*
	 * 消息创建时间
	 */
	@Column
	private Date createdate;
	/*
	 * 消息实际推送时间
	 */
	@Column
	private Date pushdate;
	/*
	 * 消息内容
	 */
	@Column
	private String informationcontent;
	/*
	 * 状态
	 */
	@Enumerated(EnumType.STRING)
	@Column
	private InformationStateEnum state;
	
	/**
	 * 已读用户
	 */
	@Column
	private String readUsers = "";
}
