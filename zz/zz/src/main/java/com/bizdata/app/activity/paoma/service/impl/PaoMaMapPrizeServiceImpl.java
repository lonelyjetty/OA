package com.bizdata.app.activity.paoma.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bizdata.app.activity.paoma.domain.PaoMaMapPrize;
import com.bizdata.app.activity.paoma.repository.PaoMaMapPrizeRepository;
import com.bizdata.app.activity.paoma.service.PaoMaMapPrizeService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PaoMaMapPrizeServiceImpl implements PaoMaMapPrizeService {
	private final PaoMaMapPrizeRepository paoMaMapPrizeRepository;

	@Autowired
	public PaoMaMapPrizeServiceImpl(PaoMaMapPrizeRepository paoMaMapPrizeRepository) {
		this.paoMaMapPrizeRepository = paoMaMapPrizeRepository;
	}
	@Override
	public boolean saveOrUpdate(PaoMaMapPrize paoMaMapPrize) {
		boolean state;
        try {
        	paoMaMapPrizeRepository.save(paoMaMapPrize);
            state = true;
        } catch (Exception e) {
            log.error("保存或更新paoMaMapPrize失败:", e);
            state = false;
        }
        return state;
	}
	@Override
	public List<PaoMaMapPrize> findByActivityId(String id) {
		// TODO Auto-generated method stub
		return paoMaMapPrizeRepository.findByActivityId(id);
	}

}
