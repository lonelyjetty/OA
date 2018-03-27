package com.bizdata.app.activity.paoma.repository;

import java.util.List;

import com.bizdata.app.activity.paoma.domain.PaoMaMapPrize;

import me.sdevil507.base.JpaBaseRepository;

public interface PaoMaMapPrizeRepository extends JpaBaseRepository<PaoMaMapPrize, String> {

	List<PaoMaMapPrize> findByActivityId(String activityId);

}
