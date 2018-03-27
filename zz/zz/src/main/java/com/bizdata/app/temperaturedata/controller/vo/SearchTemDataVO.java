package com.bizdata.app.temperaturedata.controller.vo;

import lombok.Data;
import java.util.Date;

/**
 * 体温数据查询条件
 * @author 
 *
 */
@Data
public class SearchTemDataVO {
	
	 /**
     * 用户ID
     */
    private String profileId;

    /**
     * 上传开始时间
     */
    private Date starttime;
    
    /**
     * 上传结束时间
     */
    private Date endtime;

}
