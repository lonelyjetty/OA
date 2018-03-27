package com.bizdata.app.circle.circle_mag.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;

import com.bizdata.app.circle.circle_classification.constant.StateEnum;


import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "app_circle")
@Data
@EqualsAndHashCode(callSuper = true)
public class Circle extends JpaUUIDBaseEntity {

	/*
	 * 圈子id
	 */
	@Column
	private int circle_id;
	/*
	 * 标题
	 */
	@Column
	private String title;
	/*
	 * logo
	 */
	@Column
	private String logo;
	/*
	 * 描述
	 */
	@Column
	private String description;
	/*
	 * 圈主(账号id)
	 */
	@Column
	private String lord_id;
	/*
	 * 圈子分类(圈子分类标题)
	 */
	@Column
	private String circle_class;
	/*
	 * 圈子分类主键值
	 */
	@Column
	private String circleclassid;
	/*
	 * 创建者
	 */
	@Column
	private String create_name;
	/*
	 * 状态(正常:1,删除:0)
	 */
	@Column
	private int state = 1;
	/*
	 * 创建时间
	 */
	@Column(updatable=false)
	@CreationTimestamp
	private Date createtime;
	@Transient
	private String classiname;
	/*
	 * 话题数量
	 */
	@Column
	private Integer topicnum=0;
}
