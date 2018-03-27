package com.bizdata.app.prize.library.repository;

import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.prize.library.domain.PrizeLibrary;

import me.sdevil507.base.JpaBaseRepository;

public interface PrizeLibraryRepository extends JpaBaseRepository<PrizeLibrary, Integer> {

	/**
	 * 获取领奖人数
	 * @param prizeId
	 * @return
	 */
	@Query(value = "select count(*) from prize_library as a, prize_accept_details as b where a.id = b.prize_id and a.id = ?1", nativeQuery = true)
	Integer getAcceptNum(Integer prizeId);
	
	/**
	 * 获取兑换人数
	 * @param prizeId
	 * @return
	 */
	@Query(value = "select count(*) from prize_library as a, prize_accept_details as b where a.id = b.prize_id and a.id = ?1 and b.is_exchange = 'YES'", nativeQuery = true)
	Integer getExchange(Integer prizeId);
}
