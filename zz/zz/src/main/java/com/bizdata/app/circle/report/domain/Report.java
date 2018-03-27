package com.bizdata.app.circle.report.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 
 * @author Administrator
 * 字段给出不明确,后续补充-20171010
 */
@Entity
@Table(name = "app_report")
@Data
@EqualsAndHashCode(callSuper = true)
public class Report extends JpaUUIDBaseEntity {
	/*
	 * 标题
	 */
	private String title;
	/*
	 * 类型
	 */
	private String type;
	/*
	 * 被举报量
	 */
	private String num;
	/*
	 * 状态
	 */
	private String state;
	/*
	 * 被举报时间
	 */
	@Column(updatable=false)
	@CreationTimestamp
	private Date reporttime;
	/*
	 * 举报原因
	 */
	private String reason;
}
