package com.bizdata.app.banner.domain;

import com.bizdata.app.banner.constant.BannerPositionEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

import javax.persistence.*;
import java.util.Date;

/**
 * zz_product_main实体
 * <p>
 * Created by xq on 2017/12/7.
 */
@Table(name = "app_banner")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class Banner extends JpaUUIDBaseEntity {

    /**
     * banner名称
     */
    @Column
    private String name;

    /**
     * banner图片地址
     */
    @Column
    private String picUrl;

    /**
     * 排序号
     */
    @Column
    private int serialNum;

    /**
     * 开始时间
     */
    @Column
    private Date startTime;

    /**
     * 结束时间
     */
    @Column
    private Date endTime;

    /**
     * 跳转URL
     */
    @Column
    private String targetUrl;

    /**
     * banner展示位置
     *
     * @see BannerPositionEnum
     */
    @Enumerated(EnumType.STRING)
    @Column
    private BannerPositionEnum bannerPositionEnum;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public int getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(int serialNum) {
		this.serialNum = serialNum;
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

	public String getTargetUrl() {
		return targetUrl;
	}

	public void setTargetUrl(String targetUrl) {
		this.targetUrl = targetUrl;
	}

	public BannerPositionEnum getBannerPositionEnum() {
		return bannerPositionEnum;
	}

	public void setBannerPositionEnum(BannerPositionEnum bannerPositionEnum) {
		this.bannerPositionEnum = bannerPositionEnum;
	}
    
    
}
