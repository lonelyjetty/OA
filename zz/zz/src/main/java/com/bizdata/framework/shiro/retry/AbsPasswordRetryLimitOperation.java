package com.bizdata.framework.shiro.retry;

import lombok.Data;

/**
 * 密码重试次数限制操作抽象类
 * <p>
 * Created by sdevil507 on 2017/8/28.
 */
@Data
public abstract class AbsPasswordRetryLimitOperation {

    public AbsPasswordRetryLimitOperation(int limitCount,long lockTime) {
        this.limitCount = limitCount;
        this.lockTime = lockTime;
    }

    /**
     * 如果密码输入错误超过规定次数，则锁定时间数(单位:分钟)
     */
    protected long lockTime = 10;

    /**
     * 最大错误次数
     */
    protected int limitCount = 0;

    /**
     * 判断该用户名密码错误是否超过限制
     *
     * @param username 用户名
     * @return 是否超过次数
     */
    public boolean overLimit(String username) {
        int currentCount = getCurrentCount(username);
        return currentCount >= limitCount;
    }

    /**
     * 设置用户名与密码输入错误次数
     *
     * @param username 用户名
     * @param count    错误次数
     */
    public abstract void putCurrentCount(String username, int count);

    /**
     * 获取当前用户密码输入错误次数
     *
     * @param username 用户名
     * @return 错误次数
     */
    protected abstract int getCurrentCount(String username);

    /**
     * 执行清除该用户名对应密码错误次数记录
     *
     * @param username
     */
    public abstract void remove(String username);
}
