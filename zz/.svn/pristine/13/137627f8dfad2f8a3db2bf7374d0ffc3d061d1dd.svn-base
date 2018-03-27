package com.bizdata.app.sportdata.service;

import com.bizdata.app.sportdata.controller.vo.SearchSportDataVO;
import com.bizdata.app.sportdata.domain.SportData;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;
import org.springframework.data.domain.Page;

/**
 * SportDataService
 * <p>
 * Created by sdevil507 on 2017/9/6.
 */
public interface SportDataService {

    /**
     * 分页查询
     *
     * @param jpaPageParamVO    分页参数
     * @param jpaSortParamVO    排序参数
     * @param searchSportDataVO 查询参数
     * @return 分页记录
     */
    Page<SportData> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, SearchSportDataVO searchSportDataVO);

    /**
     * 根据ID获取一条运动记录
     *
     * @param id id
     * @return 运动记录
     */
    SportData findOne(String id);
}
