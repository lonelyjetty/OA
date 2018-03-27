package com.bizdata.app.sportdata.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 运动数据
 * <p>
 * Created by sdevil507 on 2017/9/6.
 */
@Entity
@Table(name = "hd_sport_data")
@Data
@EqualsAndHashCode(callSuper = true)
public class SportData extends JpaUUIDBaseEntity {

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
     * MagUser(表usr_account)主键值
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
     * 卡洛里
     */
    @Column(columnDefinition = "double(9,3)")
    private double calories = 0.000;

    /**
     * 距离
     */
    @Column(columnDefinition = "double(9,2)")
    private double distance = 0.00;

    /**
     * 步数
     */
    @Column
    private int steps = 0;

    /**
     * 速度
     */
    @Column(columnDefinition = "double(9,3)")
    private double speed = 0.000;

    /**
     * 运动项目
     */
    @Column(length = 10)
    private String sportItem;

    /**
     * 运动水平
     */
    @Column(length = 10)
    private String level;

    /**
     * 步数目标
     */
    @Column
    private int target = 10000;

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
     * 心率
     */
    @Column
    private int heartRate;
    /**
     * 是否显示数据（1-显示 2-不显示）
     */
    @Column
    private int display;
    /**
     * 运动时长时间戳
     */
    @Column
    private Integer period;
}
