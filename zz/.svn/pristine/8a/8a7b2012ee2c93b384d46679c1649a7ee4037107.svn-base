package com.bizdata.admin.service;

import java.util.List;
import java.util.Set;

import com.bizdata.admin.domain.Resource;

/**
 * 资源接口
 *
 * @author sdevil507
 * @version 1.0
 */
public interface ResourceService {

    /**
     * 新增资源
     *
     * @param resource 资源实体
     * @return 新增资源的id
     * @throws Exception
     */
    String insertResource(Resource resource) throws Exception;

    /**
     * 更新资源
     *
     * @param resource 资源实体
     * @return 更新资源id
     */
    String updateResource(Resource resource) throws Exception;

    /**
     * 删除资源
     *
     * @param resourceId 资源id
     * @throws Exception
     */
    void deleteResource(String resourceId) throws Exception;

    /**
     * 查询所有资源
     *
     * @return 资源列表
     *
     */
    List<Resource> findAll();

    /**
     * 根据权限字符串集合获取菜单资源列表
     *
     * @param permissions 权限集合
     * @return 菜单资源列表
     * @see List<Resource>
     */
    List<Resource> getMenusByPermissions(Set<String> permissions);

    /**
     * 根据父id获取孩子节点
     *
     * @param parent_id 父节点id
     * @return List<Resource>
     */
    List<Resource> findChildens(String parent_id);

    /**
     * 根据id获取SysResource元素
     *
     * @param id 资源id
     * @return Resource
     */
    Resource findSysResource(String id);
}
