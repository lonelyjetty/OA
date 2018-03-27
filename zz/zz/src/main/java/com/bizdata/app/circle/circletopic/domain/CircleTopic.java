package com.bizdata.app.circle.circletopic.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 
 * @author Administrator
 *
 */
@Table(name = "app_circle_topic")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class CircleTopic extends JpaUUIDBaseEntity {
	/*
	 * 话题id(非主键)
	 */
	private int topicid;
	/*
	 * 话题内容
	 */
	private String content;
	/**
	 * 话题标题
	 */
	@Column
	private String title;

	/**
	 * 作者id即用户id
	 */
	@Column
	private String userId;

	/**
	 * 回复数
	 */
	@Column
	private int reply;

	/**
	 * 分享数
	 */
	@Column
	private int share;

	/**
	 * 查看数
	 */
	@Column
	private int examine;

	/**
	 * 点赞数
	 */
	@Column
	private int praiseNum;

	/**
	 * 板块即圈子分类
	 */
	@Column
	private String classId;

	/**
	 * 圈子id
	 */
	@Column
	private int circleId;
	private String circleeeid;

	/**
	 * 是否是精华
	 * <p>
	 * 1 是 -1 不是
	 */
	@Column
	private int isEssence;

	/**
	 * 是否是置顶
	 * <p>
	 * 1 是 -1 不是
	 */
	@Column
	private int isStick;

	/**
	 * 是否是推广
	 * <p>
	 * 1 是 -1 不是
	 */
	@Column
	private int isGeneralize;

	/**
	 * 状态
	 * <p>
	 * 1 正常 2 锁定 3 删除
	 */
	@Column
	private String state;

	/**
	 * 创建日期
	 */
	@Column(updatable=false)
	@CreationTimestamp
	private Date createDate;

	/**
	 * 分享文案
	 */
	@Column
	private String shareCopy;

	/**
	 * 分享图片url
	 */
	@Column
	private String sharePic;

	/**
	 * 首页排序
	 */
	@Column
	private int homeSort;
	/**
	 * 昵称（不是数据库字段）
	 */
	@Transient
	private String userName;
	/**
	 * 用户头像（不是数据库字段）
	 */
	@Transient
	private String userPic;
	/*
	 * 分类名称
	 */
	@Transient
	private String circleclassname;
	/*
	 * 圈子名称
	 */
	@Transient
	private String circlename;
	/*
	 * 用户序号id 
	 */
	@Transient
	private Integer accountnum;

}
