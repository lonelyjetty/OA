package com.bizdata.app.invite.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 邀请统计表
 * @author w
 *
 */
@Entity
@Table(name = "usr_invite_statistics")
@Data
@EqualsAndHashCode(callSuper = true)
public class UserInviteStatistics extends JpaUUIDBaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2024778789641703839L;
	
	/**
	 * 邀请人id
	 */
	@Column
	private Integer inviteProfileId;
	
	/**
	 * 暂时用不上
	 */
	@Column
	private Integer	appid;

	/**
	 * 邀请人手机号码
	 */
	@Column
	private String inviteMobile;

	/**
	 * 邀请人昵称
	 */
	@Transient
	private String inviteAccountName;
	
	/**
	 * 实际注册数
	 */
	@Column
	private Integer realRegTotal;

	/**
	 * 邀请成功数
	 */
	@Column
	private Integer inviteSuccessTotal;
	
	/**
	 * 获取奖励总数
	 */
	@Column
	private Integer rewardSum;
	
	/**
	 * 领取奖励总数
	 */
	@Column
	private Integer receiveNumber;
	
	/**
	 * 未领取奖励次数
	 */
	@Column
	private Integer withoutReceiveNumber;
}
