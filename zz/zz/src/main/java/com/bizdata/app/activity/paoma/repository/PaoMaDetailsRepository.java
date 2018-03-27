package com.bizdata.app.activity.paoma.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.activity.paoma.domain.PaoMaDetails;

import me.sdevil507.base.JpaBaseRepository;

public interface PaoMaDetailsRepository extends JpaBaseRepository<PaoMaDetails, String> {

	@Query(value = "select a.id, a.ranking, b.nick_name, b.real_name, c.mobile from activity_paoma_map_people as a, usr_profile as b, usr_account as c where a.activity_id =?1 and a.user_id = b.account_id and c.id = b.account_id", nativeQuery = true)
	public List<PaoMaDetails> findByActivityId(String activityId);

	@Query(value = "select new com.bizdata.app.activity.paoma.domain.PaoMaDetails(a.ranking, b.nickName, c.mobile, b.realName, a.isPrize, d.prizeName, (b.address || b.detailedAddress), a.isGoods) from PaoMaMapPerson as a, UserProfile as b, MagUser as c, PrizeLibrary as d, PaoMa as e where a.activityId = ?1 and b.nickName like ?2 and c.mobile like ?3 and a.userId = b.accountId and c.id = a.userId and e.prizeId = d.id and e.id = a.activityId")
	public Page<PaoMaDetails> findAll(Pageable pageRequest, String activityId, String nickName, String mobile);
}
