package com.bizdata.app.miaodetail.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "user_miao_detail")
@Data
public class MiaoDetail extends JpaUUIDBaseEntity {
	public MiaoDetail() {
		super();
	}
	public MiaoDetail(String userId,int accountnum,long miaoMoney) {
		super();
		this.setAccountnum(accountnum);
		this.setUserId(userId);
		this.setMiaoMoney((int)miaoMoney);
	}
	/**
	 * 用户ID(accountid)
	 */
	@Column
	private String userId;
	/**
	 * 用户序号
	 */
	@Column
	private int accountnum;
	/**
	 * 任务名称
	 */
	@Column
	private String taskName;
	
	/**
	 * 妙币数量
	 */
	@Column
	private int miaoMoney;
	/**
	 * 妙币增减:1-增加,-1-减少
	 */
	@Column
	private Integer modifytype;

	/**
	 * 操作时间
	 */
	@Column
	@CreationTimestamp
	private Date operationDate;
	/**
	 * 操作时间时间戳
	 */
	@Column(updatable=false)
	private Integer operationdatestamp;
	
}
