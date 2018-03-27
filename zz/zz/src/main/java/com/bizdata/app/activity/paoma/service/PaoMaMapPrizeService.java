package com.bizdata.app.activity.paoma.service;

import java.util.List;

import com.bizdata.app.activity.paoma.domain.PaoMaMapPrize;

public interface PaoMaMapPrizeService {
	 /**
     * 执行更新操作
     *
     * @param PaoMaMapPrize 奖励实体
     * @return 执行反馈
     */
    boolean saveOrUpdate(PaoMaMapPrize paoMaMapPrize);

	List<PaoMaMapPrize> findByActivityId(String id);
}
