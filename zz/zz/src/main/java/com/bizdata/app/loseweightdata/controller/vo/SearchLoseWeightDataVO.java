package com.bizdata.app.loseweightdata.controller.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SearchLoseWeightDataVO {
	
	/**
     * 用户ID
     */
    private String profileId;

    /**
     * 设备SN号
     */
    private String deviceSn;

    /**
     * 设备名字
     */
    private String deviceName;
    
    /**
     * 测量开始时间
     */
    private Date startTime;
    
    /**
     * 测量结束时间
     */
    private Date endTime;
    
    /**
     * 数据来源
     */
    private String weightType;
    
}
