package com.bizdata.commons.utils;

import lombok.Data;

/**
 * JqGrid排序条件封装
 * <p>
 * Created by sdevil507 on 2017/8/8.
 */
@Data
public class JqGridSortVO {

    /**
     * 排序字段
     */
    private String sidx;

    /**
     * 排序方向
     */
    private String sord;

}
