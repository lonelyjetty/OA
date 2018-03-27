package com.bizdata.app.banner.service;

import com.bizdata.app.banner.controller.vo.BannerSearchVO;
import com.bizdata.app.banner.domain.Banner;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;
import org.springframework.data.domain.Page;

/**
 * BannerService
 * <p>
 * Created by sdevil507 on 2017/9/6.
 */
public interface BannerService {

    /**
     * 执行更新操作
     *
     * @param banner banner实体
     * @return 执行反馈
     */
    boolean save(Banner banner);

    /**
     * 分页查询
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param bannerSearchVO banner查询参数VO
     * @return 分页记录
     */
    Page<Banner> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, BannerSearchVO bannerSearchVO);

    /**
     * 根据ID删除
     *
     * @param id id
     * @return 执行反馈
     */
    boolean delete(String id);

    /**
     * 根据ID获取Banner记录
     *
     * @param id id
     * @return banner记录
     */
    Banner findOne(String id);
}
