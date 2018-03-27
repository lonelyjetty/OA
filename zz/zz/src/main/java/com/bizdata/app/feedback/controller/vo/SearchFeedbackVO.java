package com.bizdata.app.feedback.controller.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SearchFeedbackVO {

	
	
	private String type;
	
	 /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;
    
    private String tel;
	
}
