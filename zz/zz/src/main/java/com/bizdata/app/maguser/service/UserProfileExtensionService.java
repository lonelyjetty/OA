package com.bizdata.app.maguser.service;

import com.bizdata.app.maguser.domain.UserProfileExtension;

public interface UserProfileExtensionService {

	UserProfileExtension findByProfileId(String id);

}
