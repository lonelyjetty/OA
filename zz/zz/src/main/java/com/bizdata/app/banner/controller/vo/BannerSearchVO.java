package com.bizdata.app.banner.controller.vo;

import lombok.Data;

import java.util.Date;

/**
 * Banner查询条件
 * <p>
 * Created by sdevil507 on 2017/9/6.
 */
@Data
public class BannerSearchVO {

    /**
     * 位置
     */
    private String bannerPositionEnum;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;
    
    
}
