package com.bizdata.app.service.question.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Entity
@Table(name = "ha_assessment_question")
@Data
@EqualsAndHashCode(callSuper = true)
public class HaAssessmentQuestion extends JpaUUIDBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public HaAssessmentQuestion() {
		this.status = 1;
	}

	// 评估ID
	private String assessmentId;

	// 问题ID
	@OneToOne
	@JoinColumn(name = "question_id")
	private HaQuestion question;

	// 排序
	@Column(columnDefinition = "INT default 0", nullable = false)
	private int sort;
	// 状态1：正常 -1：删除
	@Column(columnDefinition = "INT default 1", nullable = false)
	private int status;

}
