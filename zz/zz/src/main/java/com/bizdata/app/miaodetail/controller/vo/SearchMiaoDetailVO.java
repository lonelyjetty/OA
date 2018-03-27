package com.bizdata.app.miaodetail.controller.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SearchMiaoDetailVO {
	private String userId;

	private String taskName;
	
	private Date startTime;

	private Date endTime;
}
