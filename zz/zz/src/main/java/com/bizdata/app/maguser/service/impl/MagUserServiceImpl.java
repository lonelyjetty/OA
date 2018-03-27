package com.bizdata.app.maguser.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.bizdata.app.maguser.controller.vo.SearchMagUserVO;
import com.bizdata.app.maguser.domain.MagUser;
import com.bizdata.app.maguser.domain.UserLogin;
import com.bizdata.app.maguser.domain.UserProfile;
import com.bizdata.app.maguser.domain.UserProfileExtension;
import com.bizdata.app.maguser.repository.MagUserRepository;
import com.bizdata.app.maguser.service.MagUserService;
import com.bizdata.app.maguser.service.UserLoginService;
import com.bizdata.app.maguser.service.UserProfileExtensionService;
import com.bizdata.app.maguser.service.UserProfileService;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
public class MagUserServiceImpl implements MagUserService {

	private final MagUserRepository magUserRepository;
	@Autowired
	private UserLoginService userLoginService;
	@Autowired
	private UserProfileService userProfileService;
	@Autowired
	private UserProfileExtensionService userProfileExtensionService;

	@Autowired
	public MagUserServiceImpl(MagUserRepository magUserRepository) {
		this.magUserRepository = magUserRepository;
	}

	@Override
	public Page<MagUser> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchMagUserVO searchMagUserVO) {
		return magUserRepository.findAll(listWhereClause(searchMagUserVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<MagUser> listWhereClause(SearchMagUserVO searchMagUserVO) {
		return new Specification<MagUser>() {
			@Override
			public Predicate toPredicate(Root<MagUser> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果用户ID不为空
				if (StringUtils.isNotBlank(searchMagUserVO.getUserId())) {
					list.add(criteriaBuilder.like(root.get("id").as(String.class),
							"%" + searchMagUserVO.getUserId() + "%"));
				}

				// 如果昵称号不为空
				if (StringUtils.isNotBlank(searchMagUserVO.getUserName())) {
					list.add(criteriaBuilder.like(root.get("accountName").as(String.class),
							"%" + searchMagUserVO.getUserName() + "%"));
				}

				// 如果手机号不为空
				if (null != searchMagUserVO.getUserPhone()) {
					list.add(criteriaBuilder.like(root.get("mobile").as(String.class),
							"%" + searchMagUserVO.getUserPhone() + "%"));
				}

				// 如果开始时间存在
				if (null != searchMagUserVO.getStartTime()) {
					System.out.println(searchMagUserVO.getStartTime().toGMTString());
					list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("createTime"),
							searchMagUserVO.getStartTime()));
				}

				// 如果结束时间存在
				if (null != searchMagUserVO.getEndTime()) {
					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("createTime"),
							searchMagUserVO.getEndTime()));
				}

				// 如果注册IP存在
				if (null != searchMagUserVO.getRegisterIp()) {
					list.add(criteriaBuilder.equal(root.get("accountSource"),
							searchMagUserVO.getRegisterIp()));
				}
				
				// 如果渠道号存在
				if (null != searchMagUserVO.getDitchNo()) {
					list.add(criteriaBuilder.equal(root.get("ditchNo"),
							searchMagUserVO.getDitchNo()));
				}
				
				// 如果状态存在
				if (null != searchMagUserVO.getState()) {
					list.add(criteriaBuilder.equal(root.get("accountStatus"),
							searchMagUserVO.getState()));
				}

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	@Override
	public MagUser findOne(String id) {
		return magUserRepository.findOne(id);
	}
	
	//获取用户信息详情
	@Override
	public MagUser getUserInfo(String id) {
		MagUser user = findOne(id);
		UserProfile usrp = userProfileService.findByAccountId(id);
		UserLogin usrl = userLoginService.findByAccountId(id);
		UserProfileExtension usrpe;
		if(null!=user) {
			if(null!=usrp) {
				user.setHeadpic(usrp.getHeadpic());
				user.setPn(usrp.getPn());
				user.setRealname(usrp.getRealName());
				System.out.println(usrp.getNickName());
				user.setNickname(usrp.getNickName());
				usrpe = userProfileExtensionService.findByProfileId(usrp.getId());
				if(null!=usrpe) {
					user.setLevelId(usrpe.getLevelId());
					user.setExp(usrpe.getExp());
				}
			}
			if(null!=usrl) {
				user.setLoginStatus(usrl.getLoginStatus());
			}
		}
		return user;
	}
	//保存用户信息
	@Override
	public boolean save(MagUser user) {
		try {
			magUserRepository.save(user);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//根据accountnum更新用户阳光币
	@Transactional
	@Override
	public boolean updateMiao(int accountnum, int num) {
		try{
			magUserRepository.updateMiao(accountnum, num);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	//根据accountnum查找用户主键值
	@Override
	public String getIdByAccountnum(int accountnum) {
		return magUserRepository.getIdByAccountnum(accountnum);
	}
	//根据accountnum查找用户
	@Override
	public MagUser findByAccountnum(int accountnum) {
		return magUserRepository.findByAccountnum(accountnum);
	}

	@Override
	public Integer getAccountnumById(String id) {
		return magUserRepository.getAccountnumById(id);
	}
}
