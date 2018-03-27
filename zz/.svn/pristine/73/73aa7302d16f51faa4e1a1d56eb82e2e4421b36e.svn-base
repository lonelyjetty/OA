package com.bizdata.commons.utils;

import org.springframework.stereotype.Component;
import org.springframework.util.DigestUtils;

/**
 * 加密工具类
 * <p>
 * Created by sdevil507 on 2017/8/27.
 */
@Component
public class PasswordHelper {

    /**
     * 密码MD5加密
     *
     * @param srcPassword 原始密码
     * @return md5加密后密码
     */
    public String md5Encrypt(String srcPassword) {
        return DigestUtils.md5DigestAsHex(srcPassword.getBytes());
    }

    /**
     * 判断原始密码输入是否正确
     *
     * @param originalPassword          原始密码
     * @param encryptedOriginalPassword 数据库中加密过的密码
     * @return true/false
     */
    public boolean checkPassword(String originalPassword, String encryptedOriginalPassword) {
        return DigestUtils.md5DigestAsHex(originalPassword.getBytes()).equals(encryptedOriginalPassword);
    }
}
