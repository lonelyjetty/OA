package com.bizdata.admin.service.impl;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.bizdata.admin.domain.LoginLogout;
import com.bizdata.admin.repository.LoginLogoutRepository;
import com.bizdata.admin.service.LoginLogoutService;

@Service
public class LoginLogoutServiceImpl implements LoginLogoutService {

    @Autowired
    private LoginLogoutRepository loginLogoutRepository;

    @Override
    public void log(LoginLogout loginLogout) {
        loginLogoutRepository.save(loginLogout);
    }

    @Override
    public Page<LoginLogout> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO) {
        return loginLogoutRepository.findAll(jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
    }
}
