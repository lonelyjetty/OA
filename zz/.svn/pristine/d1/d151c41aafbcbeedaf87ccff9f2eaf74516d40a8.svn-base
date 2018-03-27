package com.bizdata.app.push.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

import com.bizdata.app.push.constant.PushEnum;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "app_push")
@Data
@EqualsAndHashCode(callSuper = true)
public class Push extends JpaUUIDBaseEntity {
	/*
	 * 推送标题
	 */
	@Column
	private String title;
	/*
	 *推送内容
	 */
	@Column
	private String content;
	/*
	 * 提示音
	 */
	@Column
	private String sound;
	/*
	 * 应用角标
	 */
	@Column
	private String icon;
	/*
	 * 跳转类型
	 */
	@Column
	@Enumerated(EnumType.STRING)
	private PushEnum pushEnum;
	/*
	 * 跳转app地址
	 */
	@Column
	private String addAdress;
	
	/*
	 * 发送数
	 */
	@Column
	private int countsend;
	/*
	 * 接受成功数
	 */
	@Column
	private int countsucc;
	/*
	 * 结果
	 */
	@Column
	private String result;
	/*
	 * 创建时间
	 */
	@Column
	private Date createdate;
	/*
	 * 更新时间
	 */
	@Column
	private Date updatedate;
}
