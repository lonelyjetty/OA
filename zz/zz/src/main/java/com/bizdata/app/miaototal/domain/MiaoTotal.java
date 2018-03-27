package com.bizdata.app.miaototal.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "user_miao_total")
@Data
public class MiaoTotal extends JpaUUIDBaseEntity {
	/**
	 * 用户ID
	 */
	@Column
	private String userId;
	/*
	 * 用户序号
	 */
	@Column
	private int accountnum;
	/**
	 * 妙币数量(与usr_account的miaoMoney)
	 */
	@Column
	private int miaoMoney = 0;
	/**
	 * 最后操作时间
	 */
	@Column
	@UpdateTimestamp
	private Date operationDate;

}
