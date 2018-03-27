package com.bizdata.app.service.reply.domain;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import lombok.Data;

@Entity
@Table(name = "chunyu_problem")
@Data
public class ChunyuProblem {

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	/*
	 * 应用ID
	 */
	private String appid;

	/*
	 * 春雨问题id
	 */
	private String problemId;

	/*
	 * profile_id
	 */
	private String profileId;

	/*
	 * 
	 */
	private Integer age;

	/*
	 * 出生多久
	 */
	private String old;

	/*
	 * 性别 1：男 2：女
	 */
	private Integer sex;

	/*
	 * 问题内容
	 */
	private String content;

	/*
	 * 图片地址
	 */
	private String image;

	/*
	 * 音频地址
	 */
	private String audio;

	/*
	 * 春雨科室编号
	 */
	private Integer clinicNo;

	/*
	 * 科室名称
	 */
	private String clinicName;

	/*
	 * 问题状态 1待处理，2新回复(用户未查看 )，3为已回复（用户已经查看），4待评 价(问题已经关闭), 5已评价
	 * "reject"：转诊到非医疗问题，表示拒绝， "close"： 回答完毕后的关闭
	 */
	private String status;

	/*
	 * 问题创建时间
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(updatable = false)
	@org.hibernate.annotations.CreationTimestamp
	private Date addTime;

	/*
	 * 问题关闭时间
	 */
	private Date closeTime;

	/*
	 * 问题关闭原因
	 */
	private String closeMsg;

	/*
	 * 就诊人姓名
	 */
	private String name;

	/*
	 * 就诊人类型（0自己，1老人，2问诊人）
	 */
	private Integer patientType;

	/*
	 * 就诊人主键
	 */
	private Integer patientId;

	/**
	 * 时间戳
	 */
	@Transient
	private Long aTime;

}
