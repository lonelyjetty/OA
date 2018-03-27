package com.bizdata.admin.repository;

import com.bizdata.admin.domain.RoleResource;
import me.sdevil507.base.JpaBaseRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RoleResourceRepository extends JpaBaseRepository<RoleResource, String> {

	/**
	 * 根据角色id与资源id删除关系
	 *
	 * @param roleid
	 *            角色id
	 * @param resourceid
	 *            资源id
	 * @return RoleResource
	 */
	RoleResource findByRoleidAndResourceid(@Param("roleid") String roleid,
                                           @Param("resourceid") String resourceid);

	@Modifying
	@Query("delete RoleResource t where t.resourceid =:resourceid")
	void deleteRoleResource(@Param("resourceid") String resourceid);

	void deleteByRoleid(String role_id);
	
}
