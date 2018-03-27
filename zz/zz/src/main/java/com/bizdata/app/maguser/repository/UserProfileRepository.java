package com.bizdata.app.maguser.repository;

import com.bizdata.app.maguser.domain.UserProfile;

import me.sdevil507.base.JpaBaseRepository;

public interface UserProfileRepository extends JpaBaseRepository<UserProfile, String> {
	//根据accountid查找
	UserProfile findByAccountId(String id);

}
