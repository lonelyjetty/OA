package com.bizdata.app.informlocation.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

import com.bizdata.app.informlocation.constant.Location;
import com.bizdata.app.informlocation.constant.State;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "app_informlocation")
@Data
@EqualsAndHashCode(callSuper = true)
public class InformLocation extends JpaUUIDBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5445197931660983510L;
	/*
	 * 资讯位置
	 */
	@Column
	@Enumerated(EnumType.STRING)
	private Location location;
	/*
	 * 资讯ID
	 */
	@Column
	private int informId;
	/*
	 * 资讯标题
	 */
	@Column
	private String title;
	/*
	 * 添加时间
	 */
	@Column
	private Date createTime;
	/*
	 * 资讯排序号
	 */
	@Column
	private int sort;
	/*
	 * 文章分类
	 */
	@Column
	@Enumerated(EnumType.STRING)
	private State state;
}
