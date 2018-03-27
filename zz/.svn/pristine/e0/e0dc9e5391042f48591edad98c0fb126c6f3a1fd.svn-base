package com.bizdata.admin.service;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;

import com.bizdata.admin.domain.User;
import com.bizdata.commons.utils.JpaPageVO;
import com.bizdata.commons.utils.JpaSortVO;
import com.bizdata.commons.utils.JqgridSearchVO;
import com.bizdata.framework.exception.JpaFindConditionException;

/**
 * 用户角色接口
 *
 * @author sdevil507
 * @version 1.0
 */
public interface UserService {

    /**
     * 创建用户
     *
     * @param user     用户
     * @param role_ids 角色列表
     * @return String
     */
    String insertUser(User user, String[] role_ids);

    /**
     * 更新用户
     *
     * @param user     用户
     * @param role_ids 角色列表
     * @return String
     */
    String updateUser(User user, String[] role_ids);

    /**
     * 删除用户
     *
     * @param userId 用户id
     */
    void deleteUser(String userId);

    /**
     * 更改用户密码
     *
     * @param userId      用户id
     * @param newPassword 新密码
     */
    void changePassword(String userId, String newPassword);

    /**
     * 更改用户密码
     *
     * @param newPassword 新密码
     */
    void changePassword(String newPassword);

    /**
     * 根据用户id查找用户
     *
     * @param userId 用户id
     * @return User
     */
    User findOne(String userId);

    /**
     * 查询所有用户
     *
     * @return List<User>
     */
    List<User> findAll();

    /**
     * 根据用户名查询用户详细信息,包括角色信息
     *
     * @param username 用户名
     * @return User
     */
    User selectUserDetailByUsername(String username);

    /**
     * 根据用户名查找角色字符串
     *
     * @param username 用户名
     * @return Set<String>
     */
    Set<String> findRoles(String username);

    /**
     * 根据用户名查找其权限字符串
     *
     * @param username 用户名
     * @return 权限字符串集合
     */
    Set<String> findPermissions(String username);

    /**
     * 分页排序查询所有用户
     *
     * @param jqgrid2JpaCondition 转换条件
     * @return Page<User>
     */
    Page<User> findAllByPage(JpaPageVO pageVO, JpaSortVO sortVO, JqgridSearchVO searchVO) throws JpaFindConditionException;

    /**
     * 校验原始密码是否正确
     *
     * @param username     用户名
     * @param old_password 原始密码
     * @return boolean
     */
    boolean checkPassword(String username, String password);

    /**
     * 更新用户最后登录时间
     *
     * @param date 时间
     */
    void updateLastLoginTime(String username, Date date);

    /**
     *  根据部门id查找相应的人员
     * @Title: findAllByOrganizationId 
     * @Description: TODO
     * @param id
     * @return
     * @return: List<User>
     */
	List<User> findAllByOrganizationId(String id);
}
