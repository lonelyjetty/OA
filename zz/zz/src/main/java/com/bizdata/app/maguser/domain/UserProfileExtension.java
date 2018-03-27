package com.bizdata.app.maguser.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "usr_profile_extension")
public class UserProfileExtension  extends JpaUUIDBaseEntity{

	//用户属性ID（usr_profile表主键）
	private String profileId;
	//用户扩展属性标识（每个扩展属性标识对应一个或多个appid
	private String extensionKey;
	//用户等级
	private int levelId;
	
	@Column(columnDefinition = " INT default 0", nullable = false)
	private int score;
	@Column(columnDefinition = "INT default 0", nullable = false)
	private int exp;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(updatable = false)
	@org.hibernate.annotations.CreationTimestamp
	private Date createTime;

	public String getProfileId() {
		return profileId;
	}

	public void setProfileId(String profileId) {
		this.profileId = profileId;
	}

	public String getExtensionKey() {
		return extensionKey;
	}

	public void setExtensionKey(String extensionKey) {
		this.extensionKey = extensionKey;
	}

	public int getLevelId() {
		return levelId;
	}

	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getExp() {
		return exp;
	}

	public void setExp(int exp) {
		this.exp = exp;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
}
