package com.bizdata.admin.service.impl;

import com.bizdata.admin.domain.Resource;
import com.bizdata.admin.service.MenuService;
import com.bizdata.admin.service.ResourceService;
import com.bizdata.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Set;

/**
 * 菜单ServiceImpl
 * <p>
 * Created by sdevil507 on 2017/8/8.
 */
@Service
public class MenuServiceImpl implements MenuService{

    @Autowired
    private UserService userService;

    @Autowired
    private ResourceService resourceService;

    @Transactional
    @Override
    public List<Resource> getAuthMenus(String username) {
        // 根据登录用户名获取权限
        Set<String> permissions = userService.findPermissions(username);
        return resourceService.getMenusByPermissions(permissions);
    }
}
