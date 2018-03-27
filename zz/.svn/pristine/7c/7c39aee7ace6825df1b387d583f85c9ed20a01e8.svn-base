package com.bizdata.framework.shiro.retry;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * 密码重试次数实体
 * <p>
 * Created by sdevil507 on 2017/8/28.
 */
@Data
public class PasswordRetryLimitEntity {
    private int count;

    private LocalDateTime dateTime;

    public PasswordRetryLimitEntity(int count, LocalDateTime dateTime) {
        this.count = count;
        this.dateTime = dateTime;
    }
}
