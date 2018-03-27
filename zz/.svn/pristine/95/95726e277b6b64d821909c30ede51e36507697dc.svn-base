package com.bizdata.app.maguser.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bizdata.app.maguser.domain.UserLogin;
import com.bizdata.app.maguser.repository.UserLoginRepository;
import com.bizdata.app.maguser.service.UserLoginService;
@Service
public class UserLoginServiceImpl implements UserLoginService{
	@Autowired
	private UserLoginRepository userLoginRepository;
	@Override
	public UserLogin findByAccountId(String id) {
		return userLoginRepository.findByAccountId(id);
	}
	@Override
	@Transactional
	public void setLoginStatus(String accountid,int accountStatus) {
		userLoginRepository.setLoginStatus(accountid,accountStatus);
	}
	
	
}
