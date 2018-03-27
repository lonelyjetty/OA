package com.bizdata.app.activity.paoma.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 
 * @author w
 *
 */
@Table(name = "activity_paoma_map_people")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class PaoMaDetails extends JpaUUIDBaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7715108691380845865L;

	/**
	 * 排名
	 */
	@Column
	private Integer ranking;

	/**
	 * 是否获奖
	 * <p>
	 * 00:活动未结束 01:未获奖 02:获奖
	 */
	@Column
	private String isPrize;
	
	/**
	 * 是否发货
	 * <p>
	 * 00:活动未结束 01:未发货 02:已发货
	 */
	@Column
	private String isGoods;
	
	/**
	 * 昵称
	 */
	@Transient
	private String nickName;

	/**
	 * 手机号
	 */
	@Transient
	private String mobile;

	/**
	 * 奖品内容
	 */
	@Transient
	private String prizeName;
	
	/**
	 * 收货地址
	 */
	@Transient
	private String address;
	
	/**
	 * 姓名
	 */
	@Transient
	private String realName;



	public PaoMaDetails() {
		super();
	}


	public PaoMaDetails(Integer ranking, String nickName, String mobile, String realName, String isPrize,
			String prizeName, String address, String isGoods) {
		super();
		this.ranking = ranking;
		this.nickName = nickName;
		this.mobile = mobile;
		this.realName = realName;
		this.isPrize = isPrize;
		this.prizeName = prizeName;
		this.address = address;
		this.isGoods = isGoods;
	}
}
