package com.bizdata.app.circle.reply.controller.vo;

import lombok.Data;

import java.util.Date;

/**
 * 
 * @author Administrator
 *
 */
@Data
public class CirReplySearchVO {
	//开始时间
	private Date startTime;
	//结束时间
	private Date endTime;
	//查找类型
	private String type;
	//关键字
	private String key;


}
