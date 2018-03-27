package com.bizdata.app.temperaturedata.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import java.math.BigDecimal;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

/**
 * 体温数据实体
 * @author Administrator
 *
 */
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "hd_temperature_extend")
@Data
public class TemData extends JpaUUIDBaseEntity {

    /**
     * 应用id
     */
    @Column
    private String appid;
    /**
     * 用户属性ID
     */
    @Column
    private String profileId;
    /*
     * 用户序号
     */
    @Column
    private Integer accountnum;
    /**
     * 测量日期
     */
    @Column
    private  Date date;
    /**
     * 开始时间
     */
    @Column
    private  Time starttime;
    /**
     * 结束时间
     */
    @Column
    private  Time endtime;
    /**
     * 最大值
     */
    @Column
    private  BigDecimal max_value;
    /**
     * 最小值
     */
    @Column
    private  BigDecimal min_value;
    /**
     * 最大值时间
     */
    @Column
    private  Time max_time;
    /**
     * 最小值时间
     */
    @Column
    private  Time min_time;
    /**
     * 更新时间
     */
    @Column
    private  Timestamp updatetime;
}
