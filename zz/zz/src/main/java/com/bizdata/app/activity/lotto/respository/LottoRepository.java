package com.bizdata.app.activity.lotto.respository;

import com.bizdata.app.activity.lotto.domain.Lotto;

import me.sdevil507.base.JpaBaseRepository;

public interface LottoRepository extends JpaBaseRepository<Lotto, String> {

	Lotto findFirstBySortNo(Integer value);

}