package com.bizdata.app.maguser.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 用户信息表
 * @author w
 *
 */
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "usr_account")
@Data
public class MagUser extends JpaUUIDBaseEntity {
	
	/**
	 * 昵称
	 */
	@Column
	private String accountName="";
	/*
	 * 用户编号
	 */
	@Column
	private Integer accountnum = 0;
	
	/**
	 * 手机号码
	 */
	@Column
	private String mobile="";
	
	/**
	 * 注册时间
	 */
	@Column
	private Date createTime;
	
	/**
	 * 注册IP
	 */
	@Column(nullable = false)
	private int accountSource = 1;
	
	/**
	 * 阳光币(修改时更新user_miao_total中的miaoMoney)
	 */
	@Column(nullable = false)
	private int miaoMoney = 0;
	
	/**
	 * 状态(1正常   -1 锁定)
	 */
	@Column(nullable = false) 
	private int accountStatus = 1;
	/**
	 * 邀请人手机号
	 */
	@Column
	private String invitedphone="无";
	/**
	 * 邀请人序号
	 */
	@Column
	private String invitedaccountnum="无";
	/**
	 * 被邀请时间
	 */
	@Column
	private Date invitedtime;
	/**
	 * 邮箱
	 */
	@Column
	private String email="无";
	/**
	 * 类UserProfile
	 * 头像
	 */
	@Transient
	private String headpic="";
	/**
	 * 类UserProfile
	 * 昵称
	 */
	@Transient
	private String nickname="";
	/**
	 * 类UserProfile
	 * 渠道
	 */
	@Transient
	private String pn;
	/**
	 * 类UserProfileExtension
	 * 等级
	 */
	@Transient
	private int levelId;
	/**
	 * 类UserProfileExtension
	 * 经验
	 */
	@Transient
	private int exp;
	/**
	 * 类UserLogin
	 * 状态
	 */
	@Transient
	private int loginStatus;
	/**
	 * 真实姓名
	 * 类UserProfile
	 */
	@Transient
	private String realname;
	/**
	 * 注册ip
	 */
	@Transient
	private String regip;
}
