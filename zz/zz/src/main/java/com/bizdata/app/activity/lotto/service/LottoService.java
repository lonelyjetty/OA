package com.bizdata.app.activity.lotto.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.activity.lotto.controller.vo.LottoVO;
import com.bizdata.app.activity.lotto.domain.Lotto;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface LottoService {

	Page<Lotto> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, LottoVO lottoVO);

	boolean save(Lotto lotto);

	Lotto findOne(String id);

	Lotto findFirstBySortNo(Integer valueOf);

}
