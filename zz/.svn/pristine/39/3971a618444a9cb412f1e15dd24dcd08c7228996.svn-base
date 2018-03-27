package com.bizdata.app.maguser.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "usr_profile")
@Data
public class UserProfile extends JpaUUIDBaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3466164857862333552L;
	
	@Column(nullable = false)
	/**
	 * 用户主键ID
	 */
	private String accountId;
	
	@Column
	/**
	 * 真实姓名
	 */
	private String realName;
	
	@Column
	/**
	 * 昵称
	 */
	private String nickName;
	// 头像
	@Column
	private String headpic;
	// 渠道
	@Column
	private String pn;
	
	/**
	 * 详细地址
	 */
	@Column
	private String detailedAddress;
	
	/**
	 * 地址
	 */
	@Column
	private  String  address;
	@Column
	private String regIp;
}
