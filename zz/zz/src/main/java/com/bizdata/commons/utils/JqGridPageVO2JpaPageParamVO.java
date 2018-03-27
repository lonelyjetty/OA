package com.bizdata.commons.utils;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageVO;
import org.springframework.stereotype.Component;

/**
 * 执行将JqGridPageVO分页参数转换为JpaPageParamVO
 * <p>
 * Created by sdevil507 on 2017/8/8.
 */
@Component
public class JqGridPageVO2JpaPageParamVO {

    /**
     * 执行JqGridPageVO转换为JpaPageParamVO
     *
     * @param jqGridPageVO jqGrid分页参数
     * @return JpaPageParamVO
     */
    public JpaPageParamVO convert(JqGridPageVO jqGridPageVO) {
        JpaPageParamVO jpaPageParamVO = new JpaPageParamVO();
        if (verify(jqGridPageVO)) {
            // 如果可执行分页
            JpaPageVO jpaPageVO = new JpaPageVO();
            jpaPageVO.setPage(jqGridPageVO.getPage());
            jpaPageVO.setRows(jqGridPageVO.getRows());
            jpaPageParamVO.setPageCondition(jpaPageVO);
        } else {
            jpaPageParamVO = null;
        }
        return jpaPageParamVO;
    }

    /**
     * 校验是否可执行分页
     *
     * @param jqGridPageVO jqGrid分页参数
     * @return
     */
    private boolean verify(JqGridPageVO jqGridPageVO) {
        return !(jqGridPageVO.getPage() < 1 || jqGridPageVO.getRows() < 1);
    }
}
