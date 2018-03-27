package com.bizdata.framework.shiro.retry;

import org.springframework.data.redis.core.RedisTemplate;

import java.util.concurrent.TimeUnit;

/**
 * 集群环境下使用redis记录用户密码输入错误次数
 * <p>
 * Created by sdevil507 on 2017/8/28.
 */
public class RedisPasswordRetryLimitOperation extends AbsPasswordRetryLimitOperation {
    /**
     * 记录前缀
     */
    private String keyPrefix = "shiro_pwd_retry:";

    public String getKeyPrefix() {
        return keyPrefix;
    }

    public void setKeyPrefix(String keyPrefix) {
        this.keyPrefix = keyPrefix;
    }

    private RedisTemplate<String, Integer> redisTemplate;

    public RedisPasswordRetryLimitOperation(int limitCount, long lockTime, RedisTemplate<String, Integer> redisTemplate) {
        super(limitCount, lockTime);
        this.redisTemplate = redisTemplate;
    }

    private String getKey(String username) {
        return keyPrefix + username;
    }

    @Override
    public void putCurrentCount(String username, int count) {
        redisTemplate.opsForValue().set(getKey(username), count, lockTime, TimeUnit.MINUTES);
    }

    @Override
    protected int getCurrentCount(String username) {
        Integer currentCount = redisTemplate.opsForValue().get(getKey(username));
        if (null == currentCount) {
            putCurrentCount(username, 0);
        }
        currentCount = redisTemplate.opsForValue().get(getKey(username));
        currentCount++;
        putCurrentCount(username, currentCount);
        return currentCount;
    }

    @Override
    public void remove(String username) {
        redisTemplate.delete(getKey(username));
    }
}
