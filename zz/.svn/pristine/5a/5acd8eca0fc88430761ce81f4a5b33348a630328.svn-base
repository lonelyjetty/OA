package com.bizdata.app.feedback.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "app_feedback")
@Data
@EqualsAndHashCode(callSuper = true)
public class Feedback extends JpaUUIDBaseEntity {
	/*
	 * 反馈类型
	 */
	@Column
	private String type;
	/*
	 * 反馈时间
	 */
	@Column
	private Date backdate;
	/*
	 * 反馈描述
	 */
	@Column
	private String description;
	/*
	 * 联系方式
	 */
	@Column
	private String tel;
	/*
	 * 用户ID
	 */
	@Column
	private String userid;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getBackdate() {
		return backdate;
	}
	public void setBackdate(Date backdate) {
		this.backdate = backdate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	
	
	
}
