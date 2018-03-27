package com.bizdata.app.content.help.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.content.help.controller.vo.SearchHelpFAQVO;
import com.bizdata.app.content.help.domain.Help;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface ContentHelpService {
	 /**
     * 分页展示记录
     *
     * @param jpaPageParamVO 分页入参
     * @param jpaSortParamVO 排序入参
     * @param searchBpDataVO 查询条件
     * @return 分页记录
     */
    Page<Help> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, SearchHelpFAQVO searchHelpVO);
    
    /**
     * 执行更新操作
     *
     * @param Help help实体
     * @return 执行反馈
     */
    boolean save(Help help);
    
    /**
     * 根据ID获取Help记录
     *
     * @param id id
     * @return help记录
     */
    Help findOne(String id);
}
