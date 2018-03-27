package com.bizdata.app.activity.paoma.controller.vo;

import java.util.List;

import com.bizdata.app.activity.paoma.domain.PaoMa;
import com.bizdata.app.activity.paoma.domain.PaoMaMapPrize;

import lombok.Data;

@Data
public class PaoMaVO {
	//跑马圈活动
	private PaoMa paoMa;

	// 活动中的有关奖励的定义
	private List<PaoMaMapPrize> paoMaMapPrizes;
}
