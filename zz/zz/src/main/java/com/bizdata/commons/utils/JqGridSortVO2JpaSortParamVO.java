package com.bizdata.commons.utils;

import me.sdevil507.enum_util.EnumUtils;
import me.sdevil507.vo.*;
import me.sdevil507.vo.JpaSortVO;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 将JqGrid排序VO转换为JpaSortParamVO类型
 * <p>
 * Created by sdevil507 on 2017/8/8.
 */
@Component
public class JqGridSortVO2JpaSortParamVO {

    /**
     * 执行jqgrid的参数转化为JpaSortParamVO
     *
     * @param jqGridSortVO jqgrid排序相关参数
     * @return JpaSortParamVO
     */
    public JpaSortParamVO convert(JqGridSortVO jqGridSortVO) {
        JpaSortParamVO jpaSortParamVO = new JpaSortParamVO();
        if (verify(jqGridSortVO)) {
            // 如果可执行排序
            String[] sidxs;
            String[] sords;
            sidxs = jqGridSortVO.getSidx().split(",");
            sords = jqGridSortVO.getSord().split(",");
            List<JpaSortVO> jpaSortVOS = new ArrayList<>();
            for (int i = 0; i < sidxs.length; i++) {
                JpaSortVO jpaSortVO = new JpaSortVO();
                jpaSortVO.setField(sidxs[i]);
                jpaSortVO.setDirection(Sort.Direction.valueOf(sords[i].toUpperCase()));
                jpaSortVOS.add(jpaSortVO);
            }
            jpaSortParamVO.setSortCondition(jpaSortVOS);
        } else {
            jpaSortParamVO = null;
        }
        return jpaSortParamVO;
    }

    /**
     * 校验是否可执行排序
     *
     * @param jqGridSortVO 排序参数
     * @return boolean
     */
    private boolean verify(JqGridSortVO jqGridSortVO) {
        if (!StringUtils.isNotBlank(jqGridSortVO.getSidx().trim()) && !StringUtils.isNotBlank(jqGridSortVO.getSord())) {
            return false;
        }

        String[] sidxs;
        String[] sords;

        // 如果排序字段不为空,进行切分
        sidxs = jqGridSortVO.getSidx().split(",");
        // 如果排序条件不为空
        sords = jqGridSortVO.getSord().split(",");
        if (sidxs.length != sords.length) {
            return false;
        }

        // 判断排序方向为规定的asc或desc
        for (String sord : sords) {
            if (!EnumUtils.contains(sord.toUpperCase(), Sort.Direction.class)) {
                return false;
            }
        }
        return true;
    }
}
