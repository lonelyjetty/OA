package com.bizdata.admin.domain;

import com.bizdata.commons.constant.LoginLogoutType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

import javax.persistence.*;
import java.util.Date;

/**
 * 登录登出日志实体类
 *
 * @author sdevil507
 * @version 1.0
 */
@Entity
@Table(name = "admin_login_logout")
@Data
@EqualsAndHashCode(callSuper = true)
public class LoginLogout extends JpaUUIDBaseEntity {
    /**
     * 用户名
     */
    @Column(nullable = false)
    private String username;

    /**
     * ip地址
     */
    @Column(nullable = false)
    private String ip;

    /**
     * 日志内容
     */
    @Column(nullable = false)
    private String content;

    /**
     * 登录登出类型
     */
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private LoginLogoutType type;

    /**
     * 时间
     */
    @Column(nullable = false)
    private Date date;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LoginLogoutType getType() {
		return type;
	}

	public void setType(LoginLogoutType type) {
		this.type = type;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
    
    
}
