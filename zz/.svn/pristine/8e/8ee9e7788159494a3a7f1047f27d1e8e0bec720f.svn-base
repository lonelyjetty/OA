package com.bizdata.app.activity.paoma.repository;

import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.activity.paoma.domain.PaoMa;

import me.sdevil507.base.JpaBaseRepository;

public interface ActivityPaoMaRepository extends JpaBaseRepository<PaoMa, String>  {

	/**
	 * 获取最大序号
	 * @return
	 */
	@Query(value = "select a.activity_no from activity_paoma as a order by a.activity_no desc limit 1", nativeQuery = true)
	String getMaxNO();

}
