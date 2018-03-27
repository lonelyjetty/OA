package com.bizdata.app.content.column.domain;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import groovy.transform.EqualsAndHashCode;
import lombok.Data;
import me.sdevil507.base.JpaUUIDBaseEntity;


/**
 * 
 * @author wpj
 *
 * @time2017年9月21日
 */
@Table(name = "app_column")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class Columnart extends JpaUUIDBaseEntity{
	
	/*
	 * 栏目id
	 */
	private int column_id;
	/*
	 * 上级栏目
	 */
	private int parent_column_id;
	/*
	 * 文章数量
	 */
	private int article_num;
	/*
	 * 排序号
	 */
	private int sort_no;
	/*
	 * 上级栏目名称
	 */
	private String parent_column_name;
	/*
	 * 栏目简称
	 */
	private String column_short_name;
	/*
	 * 栏目名称
	 */
	private String column_name;
	/*
	 * 栏目图标
	 */
	private String column_ico;
	/*
	 * 栏目banner
	 */
	private String columnbanner;
	/*
	 * 状态(0:正常 , 1:下线)
	 */
	private String state;
	/*
	 * 栏目描述(最多120个字)
	 */
	private String descripiton;

}
