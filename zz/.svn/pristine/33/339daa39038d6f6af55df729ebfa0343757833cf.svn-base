package com.bizdata.app.circle.reply.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

import javax.persistence.*;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedBy;

import java.util.Date;

/**
 * 
 * @author Administrator
 *
 */
@Table(name = "app_art_criticism")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class CirReply extends JpaUUIDBaseEntity {
	//楼层,回复类别,标题,用户id,回复内容,回复人昵称,ip,状态,创建日期
	/*
	 * 楼层
	 */
	private int floor;
	/*
	 * 回复内容
	 */
	private String content;
	/*
	 * 回复圈子标题
	 */
	private String title;
	/*
	 * 回复目标id
	 */
	private String target_id;
	/*
	 * 用户id
	 */
	private String user_id;
	/*
	 * 用户头像
	 */
	private String user_img;
	/*
	 * 用户昵称
	 */
	private String user_name;
	/*
	 * 被回复数
	 */
	private int num;
	/*
	 * 回复类型
	 */
	private int target_num;
	/*
	 * 创建时间
	 */
	@Column(updatable=false)
	@CreationTimestamp
	private Date createtime;
	/*
	 * ip
	 */
	private String ip;
	/*
	 * 状态0:正常 1:删除2:锁定
	 */
	private String state;
	/*
	 * 评论账号序号
	 */
	@Transient
	private Integer user_num;
}
