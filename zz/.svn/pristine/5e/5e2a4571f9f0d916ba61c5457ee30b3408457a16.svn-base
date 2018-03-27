package com.bizdata.app.boot.service;

import com.bizdata.app.boot.controller.vo.BootSearchVO;
import com.bizdata.app.boot.domain.Boot;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;
import org.springframework.data.domain.Page;

/**
 * 启动页Service
 * <p>
 * Created by sdevil507 on 2017/9/5.
 */
public interface BootService {

    /**
     * 分页获取启动页图片
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param bootSearchVO   查询VO
     * @return 分页记录
     */
    Page<Boot> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, BootSearchVO bootSearchVO);

    /**
     * 保存启动页数据
     *
     * @param boot 启动页参数
     * @return 执行反馈
     */
    boolean save(Boot boot);

    /**
     * 根据ID删除记录
     *
     * @param id id
     * @return 执行反馈
     */
    boolean delete(String id);

    /**
     * 根据ID查询单个启动页数据
     *
     * @param id id
     * @return 单个启动页记录
     */
    Boot findOne(String id);
}
