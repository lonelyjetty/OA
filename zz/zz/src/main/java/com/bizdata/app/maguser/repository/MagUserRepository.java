package com.bizdata.app.maguser.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.maguser.domain.MagUser;

import me.sdevil507.base.JpaBaseRepository;

public interface MagUserRepository extends JpaBaseRepository<MagUser, String> {
	//根据accountnum查找
	MagUser findByAccountnum(int accountnum);
	//根据accountnum获取主键值id
	@Query(value="select id from usr_account where accountnum = ?1",nativeQuery=true)
	String getIdByAccountnum(int accountnum);
	@Query(value="update usr_account set miao_money = miao_money + ?2 where accountnum = ?1",nativeQuery=true)
	@Modifying
	void updateMiao(int accountnum, int num);
	@Query(value="select accountnum from usr_account where id = ?1",nativeQuery=true)
	Integer getAccountnumById(String id);

}
