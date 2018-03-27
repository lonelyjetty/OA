package com.bizdata.app.boot.domain;

import com.bizdata.app.boot.constant.BootOnlineStateEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * 启动页实体
 * <p>
 * Created by sdevil507 on 2017/9/5.
 */
@Entity
@Table(name = "app_boot")
@Data
@EqualsAndHashCode(callSuper = true)
public class Boot extends JpaUUIDBaseEntity {
    /**
     * 排序号,对应页面展示顺序
     */
    @Column(nullable = false)
    private int serialNum;

    /**
     * 备注名称
     */
    @Column(nullable = false)
    private String remarkName;

    /**
     * 图片地址
     */
    @Column(nullable = false)
    private String picUrl;

    /**
     * 跳转URL,如果存在执行跳转
     */
    @Column(nullable = false)
    private String targetUrl;

    /**
     * 有效启始时间
     */
    @Column
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startTime;

    /**
     * 有效结束时间
     */
    @Column
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endTime;

    /**
     * 状态
     */
    @Enumerated(EnumType.STRING)
    @Column
    private BootOnlineStateEnum bootOnlineStateEnum;

	public int getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(int serialNum) {
		this.serialNum = serialNum;
	}

	public String getRemarkName() {
		return remarkName;
	}

	public void setRemarkName(String remarkName) {
		this.remarkName = remarkName;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getTargetUrl() {
		return targetUrl;
	}

	public void setTargetUrl(String targetUrl) {
		this.targetUrl = targetUrl;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public BootOnlineStateEnum getBootOnlineStateEnum() {
		return bootOnlineStateEnum;
	}

	public void setBootOnlineStateEnum(BootOnlineStateEnum bootOnlineStateEnum) {
		this.bootOnlineStateEnum = bootOnlineStateEnum;
	}
    
    
}
