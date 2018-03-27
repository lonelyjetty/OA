package com.bizdata.app.prize.library.controller.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PrizeRecordSearchVO {
	/**
	 * 奖品id
	 */
	private Integer prizeId;
	
	/**
	 * 用户的昵称
	 */
	private String nickName;
	
	/**
	 * 是否兑换
	 */
	private String isExchange;
	
	/**
     * 领取开始时间
     */
    private Date acceptStartTime;

    /**
     * 领取结束时间
     */
    private Date acceptEndTime;
    
    /**
     * 兑换开始时间
     */
    private Date exchangeStartTime;
    
    /**
     * 兑换结束时间
     */
    private Date exchangeEndTime;
    
    
}
