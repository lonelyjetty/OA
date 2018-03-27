package com.bizdata.app.maguser.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.maguser.controller.vo.SearchMagUserVO;
import com.bizdata.app.maguser.domain.MagUser;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface MagUserService {
	/**
	 * 分页查询
	 * 
	 * @param jpaPageParamVO   分页参数
	 * @param jpaSortParamVO   排序参数
	 * @param searchLoseWeightDataVO   查询参数
	 * @return
	 */
	Page<MagUser> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchMagUserVO searchLoseWeightDataVO);
	//id查找
	MagUser findOne(String id);
	//获取用户信息详情
	MagUser getUserInfo(String id);
	//保存用户
	boolean save(MagUser user);
	//修改用户阳光币
	boolean updateMiao(int accountnum, int num);
	//通过序号(accountnum)查找用户id
	String getIdByAccountnum(int accountnum);
	MagUser findByAccountnum(int accountnum);
	Integer getAccountnumById(String id);
}
