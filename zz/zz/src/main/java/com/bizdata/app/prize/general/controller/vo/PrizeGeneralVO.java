package com.bizdata.app.prize.general.controller.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PrizeGeneralVO {
	/**
	 * 名称
	 */
	private String generalName;
	
	/**
	 * 开始时间
	 */
	private Date startDate;
	
	/**
	 * 结束时间
	 */
	private Date endDate;
	
	/**
	 * 奖励类型
	 */
	private String generalType;
}
