package com.bizdata.app.circle.report.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 
 * @author Administrator
 */
@Entity
@Table(name = "app_report_detal")
@Data
@EqualsAndHashCode(callSuper = true)
public class ReportDetal extends JpaUUIDBaseEntity {
	//标题
	private String title;
	//目标主键值id
	private String targetid;
	//举报原因:1,广告或垃圾信息/2,色情、淫秽或低俗内容/3,激进时政或意识形态话题/其他原因
	private String reason;
	//举报id
	private String userid;
	//举报时间
	@Column(updatable=false)
	@CreationTimestamp
	private Date createdate;
	//举报状态:0,正常/1,删除
	private int State = 0;
	
}
