package com.bizdata.commons.utils;

import lombok.Data;

/**
 * JqGrid分页分数封装
 * <p>
 * Created by sdevil507 on 2017/8/8.
 */
@Data
public class JqGridPageVO {
    /**
     * 当前页数
     */
    private int page;

    /**
     * 每页记录条数
     */
    private int rows;
}
