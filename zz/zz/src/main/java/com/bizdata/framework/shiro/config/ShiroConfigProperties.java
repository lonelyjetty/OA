package com.bizdata.framework.shiro.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

/**
 * Shiro相关配置(读取application.yml中配置项)
 * <p>
 * Created by sdevil507 on 2017/8/18.
 */
@Component
@ConfigurationProperties(prefix = "shiro")
@Data
public class ShiroConfigProperties {

	/**
	 * 是否支持集群(默认单机环境[true:集群,false:单机])
	 */
	private boolean cluster = false;

	/**
	 * 控制密码相关配置
	 */
	private PasswordProperties password;

	/**
	 * 控制cookie相关配置
	 */
	private CookieProperties cookie;

	/**
	 * 控制session相关配置
	 */
	private SessionProperties session;

	public boolean isCluster() {
		return cluster;
	}

	public void setCluster(boolean cluster) {
		this.cluster = cluster;
	}

	public PasswordProperties getPassword() {
		return password;
	}

	public void setPassword(PasswordProperties password) {
		this.password = password;
	}

	public CookieProperties getCookie() {
		return cookie;
	}

	public void setCookie(CookieProperties cookie) {
		this.cookie = cookie;
	}

	public SessionProperties getSession() {
		return session;
	}

	public void setSession(SessionProperties session) {
		this.session = session;
	}

}
