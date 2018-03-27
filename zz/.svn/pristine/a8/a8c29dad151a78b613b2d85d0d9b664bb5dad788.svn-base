package com.bizdata.app.invite.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "usr_invite_record")
@Data
@EqualsAndHashCode(callSuper = true)
public class UserInviteRecord extends JpaUUIDBaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6128768387418969426L;
	
	/**
	 * 被邀请人id(数字格式)
	 */
	@Column
	private Integer profileId;
	
	/**
	 * 邀请人id
	 */
	@Column
	private Integer inviteProfileId; 
	
	/**
	 * 邀请状态<p>
	 * 0:未邀请成功1:邀请成功(被邀请人首次登录即为成功)
	 */
	@Column
	private String inviteStatus;
	
	/**
	 * 邀请码
	 */
	@Column
	private String inviteCode;

	/**
	 * 创建时间
	 */
	@Column
	private Date createDate;

	/**
	 * 更新时间
	 */
	@Column
	private Date updateDate;
}
