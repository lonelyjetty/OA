package com.bizdata.app.bpdata.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * 血压数据
 * <p>
 * Created by sdevil507 on 2017/9/7.
 */
@Entity
@Table(name = "hd_blood_pressure_record")
@Data
@EqualsAndHashCode(callSuper = true)
public class BpData extends JpaUUIDBaseEntity {
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
     * 高压
     */
    @Column
    private int highPress;

    /**
     * 低压
     */
    @Column
    private int lowPress;

    /**
     * 平均血压
     */
    @Column
    private int avgPressValue;

    /**
     * 心率
     */
    @Column
    private int heartRate;

    /**
     * 心率等级，值为（1-心率过缓，2-心率正常，3-心率过快）
     */
    @Column
    private int heartRateLevel;

    /**
     * 血压等级，值为（1-低血压，2正常血压，3临界高血压，4，轻度高血压，5，中度高血压 6，重度高血压）
     */
    @Column
    private int bloodPressLevel;

    /**
     * 血压趋势，值为（1-下降，2-平稳，3-上升）
     */
    @Column
    private int bloodPressTrend;

    /**
     * 记录日期
     */
    @Column
    private Date createTime;

    /**
     * 数据来源：-2手动上传 -1手机上传 1-37血压 2-康康血压  3-汉优温度计 4-光聚通讯动态体温计 5-E伴行为监测仪 6-糖护士 7-vilidic
     */
    @Column(length = 50)
    private String dataSource;

    /**
     * 属于这天哪个时间段
     */
    @Column(length = 10)
    private String partOfDay;

    /**
     * 是否删除(0：未删除，1：删除)
     */
    @Column
    private int isdel=0;

    /**
     * 是否显示数据（1-显示 2-不显示）
     */
    @Column
    private int display=1;

    /**
     * 测量时间
     */
    @Column
    private Date measureTime;
}
