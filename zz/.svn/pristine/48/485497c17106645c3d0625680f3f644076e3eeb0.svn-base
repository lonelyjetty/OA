package com.bizdata.app.activity.paoma.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.bizdata.app.activity.paoma.controller.vo.PaoMaMapPersonVO;
import com.bizdata.app.activity.paoma.domain.PaoMaDetails;
import com.bizdata.app.activity.paoma.repository.PaoMaDetailsRepository;
import com.bizdata.app.activity.paoma.service.PaoMaDetailsService;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
public class PaoMaDetailsServiceImpl implements PaoMaDetailsService {

	private final PaoMaDetailsRepository paoMaDetailsRepository;

	@Autowired
	public PaoMaDetailsServiceImpl(PaoMaDetailsRepository paoMaDetailsRepository) {
		this.paoMaDetailsRepository = paoMaDetailsRepository;
	}

	@Override
	public List<PaoMaDetails> findByActivityId(String activityId) {
		return paoMaDetailsRepository.findByActivityId(activityId);
	}

	@Override
	public Page<PaoMaDetails> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			PaoMaMapPersonVO paoMaMapPersonVO) {
		String activityId = paoMaMapPersonVO.getId();
		String nickName = paoMaMapPersonVO.getNickName();
		String mobile = paoMaMapPersonVO.getMobile();
		if (!StringUtils.isNotEmpty(activityId)) {
			activityId = "";
		}
		if (StringUtils.isNotEmpty(nickName)) {
			nickName = "%" + nickName + "%";
		} else {
			nickName = "%%";
		}
		if (!StringUtils.isNotEmpty(mobile)) {
			mobile = "%%";
		}
		return paoMaDetailsRepository.findAll(jpaPageParamVO.getPageable(jpaSortParamVO.getSort()), activityId,
				nickName, mobile);
	}
}
