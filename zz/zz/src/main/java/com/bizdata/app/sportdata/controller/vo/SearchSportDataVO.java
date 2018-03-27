package com.bizdata.app.sportdata.controller.vo;

import lombok.Data;

import java.util.Date;

/**
 * 运动数据查询条件
 * <p>
 * Created by sdevil507 on 2017/9/6.
 */
@Data
public class SearchSportDataVO {

    /**
     * 用户ID
     */
    private String profileId;

    /**
     * 设备SN号
     */
    private String deviceSn;

    /**
     * 设备编号(内部)
     */
    private String deviceNo;

    /**
     * 运动起始时间
     */
    private Date startTime;

    /**
     * 运动结束时间
     */
    private Date endTime;

    /**
     * 数据来源
     */
    private String dataSource;
}
