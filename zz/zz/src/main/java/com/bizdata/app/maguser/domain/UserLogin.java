package com.bizdata.app.maguser.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "usr_login")
public class UserLogin extends JpaUUIDBaseEntity {

	public  UserLogin() {
		this.loginStatus=1;
	}
	// 账户ID（usr_account表主键）
	@Column(nullable = false)
	private String accountId;

	// 用户属性标识（每个用户属性标识对应一个或多个appid）
	private String profileKey;

	// 登录账号（可以为用户名、手机号、邮箱、第三方ID）
	@Column(nullable = false)
	private String loginName;

	/*
	 * 登录令牌（可以为密码、第三方token等）： 登录类型 1.微信 2.微博 3.QQ 4.手机号 1
	 * login_type=4&password=0为MD5(login_token)，如果校验通过，设置password_time，
	 * 并将老密码改为新密码 2 login_type=4&password!=0为MD5(login_token+password_time) 3
	 * login_type!=4 直接保存login_token
	 */
	private String loginToken;

	// 登录类型：1QQ登录、2新浪微博登录、3微信登录、4普通登录（包含用户名登录、手机登录和邮箱登录）、5 SDK登录
	@Column(nullable = false)
	private int loginType;

	@Column(nullable = false)
	private int beVerified;

	// 状态：1正常，-1锁定 （与account的status 有关联关系）
	@Column(columnDefinition = "INT default 1", nullable = false)
	private int loginStatus;

	// 密码设置日期：password_time=0说明是老密码，否则为新密码
	@Column(nullable = false)
	private long passwordTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(updatable = false)
	@org.hibernate.annotations.CreationTimestamp
	private Date createTime;
	
	@org.hibernate.annotations.UpdateTimestamp  
	@Temporal(TemporalType.TIMESTAMP) 
	private Date updateTime;

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getProfileKey() {
		return profileKey;
	}

	public void setProfileKey(String profileKey) {
		this.profileKey = profileKey;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginToken() {
		return loginToken;
	}

	public void setLoginToken(String loginToken) {
		this.loginToken = loginToken;
	}

	public int getLoginType() {
		return loginType;
	}

	public void setLoginType(int loginType) {
		this.loginType = loginType;
	}

	public int getBeVerified() {
		return beVerified;
	}

	public void setBeVerified(int beVerified) {
		this.beVerified = beVerified;
	}

	public int getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(int loginStatus) {
		this.loginStatus = loginStatus;
	}

	public long getPasswordTime() {
		return passwordTime;
	}

	public void setPasswordTime(long passwordTime) {
		this.passwordTime = passwordTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	
}
