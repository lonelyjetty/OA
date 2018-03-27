package com.bizdata.app.content.article.domain;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;

import groovy.transform.EqualsAndHashCode;
import lombok.Data;


/**
 * 
 * @author wpj
 *
 * @time2017年9月21日
 */
@Table(name = "app_article")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class Article {
	@Id
	@GenericGenerator(name = "idGenerator", strategy = "uuid")
	@GeneratedValue(generator = "idGenerator")
	@Column(name = "id")
	private String id;
	/*
	 * 序号
	 */
	private int no;
	/*
	 * 栏目名称
	 */
	private String column_name;
	/*
	 * 栏目id
	 */
	private String columnart_id;
	/*
	 * 文章id
	 */
	private int column_id;
	/*
	 * 文章标签
	 */
	private String label;
	/*
	 * 简介
	 */
	private String intro;
	/*
	 * 更新时间
	 */
	@Column
	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date update_date;
	/*
	 * 创建时间
	 */
	@Column(updatable=false)
	@CreationTimestamp
	private Date create_date;
	/*
	 * 排序号
	 */
	private int sort_no;
	/*
	 * 是否首页推荐
	 */
	private String is_recommend;
	/*
	 * 首页排序号
	 */
	private int home_sort_no;
	/*
	 * 点赞数
	 */
	private int praise_num=0;
	/*
	 * 评论数
	 */
	private int comment_num=0;
	/*
	 * 分享文案
	 */
	private String share_content;
	/*
	 * 分享缩略图
	 */
	private String share_ico;
	/*
	 * 状态
	 */
	private String state = "1";
	/*
	 * 文章内容
	 */
	private String article_content;
	/*
	 * 文章标题
	 */
	private String article_title;
	/*
	 * 猜你喜欢
	 */
	private String guess_id;
	/*
	 * 文章logo
	 */
	private String logoUrl;
	/*
	 * 板块(只有资讯选项:1)
	 */
	private String plate;
	@Transient
	private String imgaddress;
	public String getImgaddress() {
		return imgaddress;
	}
	public void setImgaddress(String imgaddress) {
		this.imgaddress = imgaddress;
	}

}
