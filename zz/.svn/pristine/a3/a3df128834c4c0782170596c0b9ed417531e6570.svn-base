package com.bizdata.app.miaototal.repository;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.miaototal.domain.MiaoTotal;

import me.sdevil507.base.JpaBaseRepository;

public interface MiaoTotalRepository extends JpaBaseRepository<MiaoTotal, String>{
	@Transactional
	@Modifying
	@Query(value="UPDATE user_miao_total SET miao_money = miao_money + ?2 WHERE user_miao_total.accountnum = ?1",nativeQuery=true)
	void updateMiao(int accountnum, int num);
	//userid返回妙币
	@Query(value="select user_miao_total.miao_money from user_miao_total WHERE user_miao_total.accountnum = ?1",nativeQuery=true)
	Integer findByAccountnum(int accountnum);
	
}
