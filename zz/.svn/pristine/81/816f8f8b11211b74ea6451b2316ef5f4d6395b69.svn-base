package com.bizdata.app.maguser.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bizdata.app.maguser.domain.UserProfile;
import com.bizdata.app.maguser.repository.UserProfileRepository;
import com.bizdata.app.maguser.service.UserProfileService;

@Service
public class UserProfileServiceImpl implements UserProfileService{
	
	
	private UserProfileRepository userProfileRepository;
	@Autowired
	public UserProfileServiceImpl(UserProfileRepository userProfileRepository) {
		this.userProfileRepository = userProfileRepository;
	}
	/*
	 * 根据accountId查找
	 * @see com.bizdata.app.maguser.service.UserProfileService#findByAccountId(java.lang.String)
	 */
	@Override
	public UserProfile findByAccountId(String id) {
		return userProfileRepository.findByAccountId(id);
	}
	
}
