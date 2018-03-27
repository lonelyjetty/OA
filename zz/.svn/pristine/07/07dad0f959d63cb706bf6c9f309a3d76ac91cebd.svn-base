package com.bizdata.framework.shiro.retry;

import com.bizdata.framework.shiro.config.ShiroConfigProperties;
import lombok.EqualsAndHashCode;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import javax.annotation.PostConstruct;

/**
 * 继承自HashedCredentialsMatcher，用于凭证验证 此处重写doCredentialsMatch，加入了密码输入次数验证功能
 * <p>
 * Created by sdevil507 on 2017/8/17.
 */
@EqualsAndHashCode(callSuper = true)
public class RetryLimitHashedCredentialsMatcher extends HashedCredentialsMatcher {

    private AbsPasswordRetryLimitOperation absPasswordRetryLimitOperation;

    @Autowired
    private ShiroConfigProperties shiroConfigProperties;

    @Autowired(required = false)
    private RedisTemplate<String, Integer> redisTemplate;

    @PostConstruct
    public void init() {
        int limitCount = shiroConfigProperties.getPassword().getRetryCount();
        long lockTime = shiroConfigProperties.getPassword().getLockTime();
        if (shiroConfigProperties.isCluster()) {
            // 如果是集群环境,则使用redis记录用户密码输入错误次数
            this.absPasswordRetryLimitOperation = new RedisPasswordRetryLimitOperation(limitCount, lockTime, redisTemplate);
        } else {
            // 如果是单机环境,则使用内存保存用户密码输入错误次数
            this.absPasswordRetryLimitOperation = new MemoryPasswordRetryLimitOperation(limitCount, lockTime);
        }
    }

    /**
     * 重写凭证验证方法,加入密码输入错误次数统计
     *
     * @param token 令牌
     * @param info  信息
     * @return boolean
     */
    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {

        String username = (String) token.getPrincipal();

        if (absPasswordRetryLimitOperation.overLimit(username)) {
            throw new ExcessiveAttemptsException();
        }

        // 调用原先的凭证验证方法，也就是盐值hash验证
        boolean matches = super.doCredentialsMatch(token, info);
        if (matches) {
            absPasswordRetryLimitOperation.remove(username);
        }
        return matches;
    }
}
