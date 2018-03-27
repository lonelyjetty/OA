package com.bizdata.app.maguser.repository;

import com.bizdata.app.maguser.domain.UserProfile;
import com.bizdata.app.maguser.domain.UserProfileExtension;

import me.sdevil507.base.JpaBaseRepository;

public interface UserProfileExtensionRepository extends JpaBaseRepository<UserProfileExtension, String> {

	UserProfileExtension findByProfileId(String id);

}
