package com.bizdata.app.shortcutkey.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.shortcutkey.controller.vo.SearchShortcutKeyVO;
import com.bizdata.app.shortcutkey.domain.ShortcutKey;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface ShortcutKeyService {
	Page<ShortcutKey> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchShortcutKeyVO searchShortcutKeyVO);

	boolean save(ShortcutKey shortcutKey);

	ShortcutKey findOne(String id);

}
