package com.bizdata.app.service.option.domain;


import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@Table(name="ha_question_option")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class HAQuestionOption extends JpaUUIDBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1891975810007716047L;
	//问题ID
	private String questionId;
/*	//选项ID
	private String optionId;*/
	
	/*@OneToOne
	@JoinColumn(name="question_id")
	private HaQuestion question;*/
	
	@OneToOne
	@JoinColumn(name="option_id")
	private HaOption  option;
	//得分
	private double score;
	//跳转下一题的问题编号
	private  String ToQuestionCode;
	
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	public HaOption getOption() {
		return option;
	}
	public void setOption(HaOption option) {
		this.option = option;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getToQuestionCode() {
		return ToQuestionCode;
	}
	public void setToQuestionCode(String toQuestionCode) {
		ToQuestionCode = toQuestionCode;
	}
	
}
