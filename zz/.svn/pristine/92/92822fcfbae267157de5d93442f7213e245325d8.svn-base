package com.bizdata.app.maguser.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bizdata.app.maguser.domain.UserProfileExtension;
import com.bizdata.app.maguser.repository.UserProfileExtensionRepository;
import com.bizdata.app.maguser.service.UserProfileExtensionService;
@Service
public class UserProfileExtensionServiceImpl implements UserProfileExtensionService{
	@Autowired
	private UserProfileExtensionRepository userProfileExtensionRepository;
	@Override
	public UserProfileExtension findByProfileId(String id) {
		return userProfileExtensionRepository.findByProfileId(id);
	}

}
