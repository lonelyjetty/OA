package com.bizdata.app.circle.sensitive_words.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 
 * @author Administrator
 *
 */
@Entity
@Table(name = "app_sensitive_word")
@Data
@EqualsAndHashCode(callSuper = true)
public class SensitiveWord extends JpaUUIDBaseEntity {
	/*
	 * 敏感词
	 */
	private String word;
	/*
	 * 类型
	 */
	private String type = "0";
	/*
	 * 更新时间
	 */
	private Date updatetime;
}
