package com.bizdata.admin.repository;

import com.bizdata.admin.domain.Organization;
import me.sdevil507.base.JpaBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrganizationRepository extends JpaBaseRepository<Organization, String> {

	/**
	 * 根据父id查询出子节点个数
	 *
	 * @param parent id
	 * @return int
	 */
	@Query("select count(1) from Organization where parent= :parent")
	int countByParentId(@Param("parent") String parent);
	
	/**
	 * 根据父id查询子节点
	 *
	 * @param parent 资源父id
	 * @return List<Resource>
	 */
	@Query("from Organization where parent= :parent") 
	List<Organization> findAllByParentId(@Param("parent") String parent);
	
}
