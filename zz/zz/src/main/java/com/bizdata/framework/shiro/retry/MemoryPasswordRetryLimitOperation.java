package com.bizdata.framework.shiro.retry;


import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 单机环境下内存记录密码错误次数
 * <p>
 * Created by sdevil507 on 2017/8/28.
 */
public class MemoryPasswordRetryLimitOperation extends AbsPasswordRetryLimitOperation {

    private Map<String, PasswordRetryLimitEntity> map = new ConcurrentHashMap<>();

    public MemoryPasswordRetryLimitOperation(int limitCount, long lockTime) {
        super(limitCount, lockTime);
    }

    @Override
    public void putCurrentCount(String username, int count) {
        PasswordRetryLimitEntity passwordRetryLimitEntity = new PasswordRetryLimitEntity(count, LocalDateTime.now());
        map.put(username, passwordRetryLimitEntity);
    }

    @Override
    protected int getCurrentCount(String username) {
        PasswordRetryLimitEntity passwordRetryLimitEntity = map.get(username);
        // 如果该用户名无对应实体,则新建一个
        if (null == passwordRetryLimitEntity) {
            putCurrentCount(username, 0);
            passwordRetryLimitEntity = map.get(username);
        }
        // 如果超过了锁定时间,则重置为0
        if (ChronoUnit.MINUTES.between(passwordRetryLimitEntity.getDateTime(), LocalDateTime.now()) >= lockTime) {
            putCurrentCount(username, 0);
        }

        passwordRetryLimitEntity = map.get(username);
        int currentCount = passwordRetryLimitEntity.getCount();
        currentCount++;
        passwordRetryLimitEntity.setCount(currentCount);
        map.put(username, passwordRetryLimitEntity);
        return currentCount;

    }

    @Override
    public void remove(String username) {
        map.remove(username);
    }
}
