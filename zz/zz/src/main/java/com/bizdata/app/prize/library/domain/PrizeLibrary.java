package com.bizdata.app.prize.library.domain;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Entity
@Table(name = "prize_library")
@Data
public class PrizeLibrary {
	
	/**
	 * 主键 自增
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	/**
	 * 奖品名称
	 */
	@Column
	private String prizeName;
	
	/**
	 * 奖品内容
	 */
	@Column
	private String prizeContent;
	
	/**
	 * 奖品图片地址
	 */
	@Column
	private String prizeUrl;
	
	/**
	 * 奖品类型<p>
	 * 1 妙币  2 话费  3 流量  4 优惠卷  5 服务 6 其他 7 爱情之旅 8 实物奖励
	 */
	@Column
	private String prizeType;
	
	/**
	 * 奖品说明
	 */
	@Column
	private String prizeExplain;
	
	/**
	 * 奖品描述
	 */
	@Column
	private String prizeDescribe;
	
	/**
	 * 奖品状态<p>
	 * 1 发布  0 待发布 -1 下线  
	 */
	@Column
	private String state;

	/**
	 * 发布时间
	 */
	@Column
	private Date createDate;

	/**
	 * 领奖人数
	 */
	@Transient
	private Integer getNum;
	
	/**
	 * 兑换人数
	 */
	@Transient
	private Integer getExchangeNum;
}
