package com.bizdata.app.bpdata.controller.vo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 血压数据查询VO
 * <p>
 * Created by sdevil507 on 2017/9/7.
 */
@Data
public class SearchBpDataVO {

    /**
     * 用户ID
     */
    private String profileId = null;

    /**
     * 设备SN号
     */
    private String deviceSn = null;

    /**
     * 设备编号（内部）
     */
    private String deviceNo = null;

    /**
     * 开始时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /**
     * 结束时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /**
     * 心率等级
     */
    private int heartRateLevel;

    /**
     * 血压等级
     */
    private int bloodPressLevel;

    /**
     * 血压趋势
     */
    private int bloodPressTrend;

    /**
     * 数据来源
     */
    private String dataSource;
}
