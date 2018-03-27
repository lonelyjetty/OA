package com.bizdata.app.service.reply.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 春雨回复表
 * 
 * @author w
 *
 */
@Entity
@Table(name = "chunyu_reply")
@Data
@EqualsAndHashCode(callSuper = true)
public class ChunyuReply extends JpaUUIDBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3719032550218673390L;

	/**
	 * 回复类型,默认情况为1
	 * <p>
	 * 0：医生回复
	 * <p>
	 * 1：问题追问(即用户自己的回复)
	 */
	@Column(nullable = false, columnDefinition = "INT default 1")
	private Integer replyType;

	/**
	 * 用户id
	 */
	@Column
	private String profileId;

	/**
	 * 问题id（数字格式）
	 */
	@Column
	private Integer problemId;

	/**
	 * 医生id
	 */
	@Column
	private String doctorId;

	/**
	 * 回复内容（包含追加）
	 */
	@Column
	private String content;

	/**
	 * 签名（由第三方传递过来）
	 */
	@Column
	private String sign;

	/**
	 * 签名时间戳（如:137322417）由第三方提供
	 */
	@Column
	private Long atime;

	/**
	 * 状态,用于识别该回复是否是最新的,用于轮询
	 * <p>
	 * 0:未读
	 * <p>
	 * 1:已读
	 */
	@Column(nullable = false, columnDefinition = "INT default 0")
	private String state;

}
