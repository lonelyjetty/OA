package com.bizdata.app.maguser.controller.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SearchMagUserVO {

	private String userId;

	private String userName;

	private Integer userPhone;

	private Integer registerIp;

	private Integer ditchNo;

	private Integer state;

	/**
	 * 注册开始时间
	 */
	private Date startTime;

	/**
	 * 注册结束时间
	 */
	private Date endTime;

}
