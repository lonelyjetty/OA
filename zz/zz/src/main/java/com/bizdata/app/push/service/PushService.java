package com.bizdata.app.push.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.push.controller.vo.SearchPushVO;
import com.bizdata.app.push.domain.Push;


import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface PushService {

	Page<Push> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchPushVO searchPushVO);
	/**
	 * 保存推送
	 * @param push 推送内容
	 * @return 执行反馈
	 */
	boolean save(Push push);
	/**
	 * 查询
	 * @param id push ID
	 * @return push
	 */
	Push findOne(String id);
}
