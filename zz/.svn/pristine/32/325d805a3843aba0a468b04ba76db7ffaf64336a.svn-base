package com.bizdata.app.activity.paoma.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.activity.paoma.controller.vo.SearchPaoMaVO;
import com.bizdata.app.activity.paoma.domain.PaoMa;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface ActivityPaoMaService {
	/**
     * 分页查询
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param searchPaoMaVO 跑马圈查询参数VO
     * @return 分页记录
     */
    Page<PaoMa> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, SearchPaoMaVO searchPaoMaVO);

    
    /**
     * 执行更新操作
     *
     * @param PaoMa 跑马圈实体
     * @return 执行反馈
     */
    boolean save(PaoMa paoMa);
    
    /**
     * 根据ID查询单个启动页数据
     *
     * @param id id
     * @return 单个启动页记录
     */
    PaoMa findOne(String id);


    /**
     * 获取跑马圈表中当前最大序号再此往上加一
     * @return
     */
	String getMaxNo();
}
