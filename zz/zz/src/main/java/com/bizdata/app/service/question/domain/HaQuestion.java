package com.bizdata.app.service.question.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Table(name = "ha_question")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class HaQuestion extends JpaUUIDBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6233633481009206162L;

	@Column
	private String questionCode;

	private String questionName;

	private String pid;
	// 所属分类（1：一般信息，2：健康状况及家庭病史，3：饮食习惯和生活方式，4：体检指标）
	@Column
	private Integer category;
	// 1:单选，2:多选，3:填空
	private Integer questionType;
	// 1:数字，2：文字，3：日期，4:地址，5:民族
	private Integer answerType;
	// 题目描述
	private String description;
	/**
	 * 状态
	 * <p>
	 * 1:正常 -1:删除
	 */
	@Column
	private String state;
	// 排序
	private Integer sortNo;

	/**
	 * 创建时间
	 */
	@Column
	private Date createTime;

	/**
	 * 评估的主键
	 */
	@Transient
	private String assessmentId;

	// @Transient
	// private List<HaUsrAnswer> answersList;

}
