package com.bizdata.app.maguser.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.maguser.domain.UserLogin;

import me.sdevil507.base.JpaBaseRepository;

public interface UserLoginRepository extends JpaBaseRepository<UserLogin, String> {

	UserLogin findByAccountId(String id);
	//设置loginStatus
	@Query(value="update usr_login set login_status = ?2 where account_id = ?1",nativeQuery=true)
	@Modifying
	void setLoginStatus(String accountid, int accountStatus);
}
