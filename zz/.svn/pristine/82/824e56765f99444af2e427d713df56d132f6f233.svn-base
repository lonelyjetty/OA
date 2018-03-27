package com.bizdata.app.service.assess.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Table(name = "ha_assessment")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class HaAssessment extends JpaUUIDBaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8689338347173810354L;
	// 评估名称
	@Column
	private String assessmentName;
	// 评估编码
	@Column
	private String assessmentCode;
	// 评估图片
	@Column
	private String assessmentPic;
	// 一句话描述
	@Column
	private String shortDescription;
	/**
	 * 评估描述
	 */
	@Column
	private String description;
	// 类型1：健康测评，2：疾病评估,3：健康史,4：肺笛评测
	@Column
	private Integer type;
	// 状态 1:正常 -1:删除
	@Column
	private String state = "1"; //设置默认值
	// 来源
	@Column
	private String source;
	// 评估对象（1：男，2：女，3：不限）
	@Column
	private Integer sex;
	// 评估问题js地址
	@Column
	private String assessmentQuestionUrl;
	// 评估第一题问题编码
	@Column
	private String firstQuestionCode;
	// 评估问题总数
	@Column
	private Integer questionNum;
	// 创建时间
	@Column
	private Date createTime;
	//商品编码
	@Column
	private String shopCode;
	
	@Transient
	private boolean flag;// 用户是否做过问答标志位

}
