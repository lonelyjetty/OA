package com.bizdata.app.bgdata.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import java.util.Date;

/**
 * 血糖数据实体
 * <p>
 * Created by sdevil507 on 2017/9/7.
 */
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "hd_blood_glucose_record")
@Data
public class BgData extends JpaUUIDBaseEntity {

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
     * 血糖值
     */
    @Column
    private float glucoseValue;

    /**
     * 血糖等级
     */
    @Column
    private Integer level;

    /**
     * 测量时间
     */
    @Column
    private Date measureTime;

    /**
     * 测量时间段
     */
    @Column
    private int partOfDay;
    
    /**
     * 数据上传时间
     */
    @Column(updatable=false)
    @CreationTimestamp
    private Date createTime;
    
    /**
     * 数据来源
     */
    @Column
    private String dataSource;
}
