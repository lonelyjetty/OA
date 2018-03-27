package com.bizdata.app.activity.paoma.repository;

import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.activity.paoma.domain.PaoMaMapPerson;

import me.sdevil507.base.JpaBaseRepository;

public interface PaoMaMapPersonRepository extends JpaBaseRepository<PaoMaMapPerson, String> {

	@Query(value = "select count(*) as num from activity_paoma_map_people as a where a.activity_id =?1", nativeQuery = true)
	Integer getPeopleNum(String id);

}
