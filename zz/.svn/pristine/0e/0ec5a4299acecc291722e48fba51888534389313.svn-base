package com.bizdata.app.sleepdata.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * 睡眠数据实体
 * <p>
 * Created by sdevil507 on 2017/9/6.
 */
@Entity
@Table(name = "hd_sleep_data")
@Data
@EqualsAndHashCode(callSuper = true)
public class SleepData extends JpaUUIDBaseEntity {

    /**
     * 应用标识
     */
    @Column(nullable = false)
    private String appid;

    /**
     * 设备SN号
     */
    @Column(length = 50)
    private String deviceSn = null;

    /**
     * 设备编号（内部）
     */
    @Column(length = 50)
    private String deviceNo = null;

    /**
     * 用户ID
     */
    @Column
    private String profileId = null;
    /*
     * 用户序号
     */
    @Column
    private Integer accountnum;

    /**
     * 数据日期
     */
    @Column
    private Date dateTime;

    /**
     * 一天总时长(单位:s)
     */
    @Column
    private int duration;

    /**
     * 一天有效时长(单位:s)
     */
    @Column
    private int effectDuration;

    /**
     * 睡眠质量(1:很好,2:良好,3:差)
     */
    @Column(length = 10)
    private String quality;

    /**
     * 变更时间
     */
    @Column
    private Date updateAt;

    /**
     * 冗余字段
     */
    @Column(length = 2000)
    private String memo;

    /**
     * 数据来源：-2手动上传 -1手机上传 1-37血压 2-康康血压  3-汉优温度计 4-光聚通讯动态体温计 5-E伴行为监测仪 6-糖护士 7-vilidic
     */
    @Column(length = 50)
    private String dataSource;

    /**
     * 是否显示数据（1-显示 2-不显示）
     */
    @Column
    private int display;

    /**
     * 开始时间
     */
    
    private Long startAt;

    /**
     * 结束时间
     */
    private Long endAt;
}
