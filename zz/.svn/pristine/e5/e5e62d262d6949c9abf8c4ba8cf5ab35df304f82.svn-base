package com.bizdata.app.loseweightdata.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;


import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 瘦身数据实体
 * <p>
 * @author w
 *
 */
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "slim_weight")
@Data
public class LoseWeightData extends JpaUUIDBaseEntity {
	
    /**
     * 应用标识
     */
    @Column(length = 20)
    private String appid = null;

    /**
     * 设备SN号
     */
    @Column(length = 50)
    private String deviceSn = null;

    /**
     * 设备名称
     */
    @Column(length = 50)
    private String deviceName = null;

    /**
     * 用户ID
     */
    @Column
    private String profileId = null;
    /*
     * 用户序号
     */
    @Column
    private Integer accountnum = 0;
    /**
     * 上传时间
     */
    @Column
    private Date createTime = null;
    
    /**
     * 用户测量时间
     */
    @Column
    private Date weightTime = null;
    
    /**
     * 体重
     */
    @Column
    private float weight;
    
    /**
     * BMI 用户体重指数
     */
    @Column
    private float bmi;
    
    /**
     * 体重类型
     */
    @Column
    private String weightType = null;
    
}
