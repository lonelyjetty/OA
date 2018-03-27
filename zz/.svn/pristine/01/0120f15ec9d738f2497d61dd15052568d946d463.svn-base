package com.bizdata.admin.service;

import com.bizdata.admin.domain.LoginLogout;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;
import org.springframework.data.domain.Page;

/**
 * 执行登录登出操作日志
 *
 * @author sdevil507
 * @version 1.0
 */
public interface LoginLogoutService {

    /**
     * 执行日志记录
     *
     * @param loginLogout 日志对象
     */
    void log(LoginLogout loginLogout);

    /**
     * 分页查询登录登出日志
     *
     * @return 登录退出分页日志集合
     * @see Page<LoginLogout>
     */
    Page<LoginLogout> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO);
}
