package com.bizdata.admin.repository;

import java.util.List;

import me.sdevil507.base.JpaBaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bizdata.admin.domain.Resource;

public interface ResourceRepository extends JpaBaseRepository<Resource, String> {

	/**
	 * 根据父id查询子节点个数
	 *
	 * @return int 子节点个数
	 */
	@Query("select count(1) from Resource where parent= :parent") 
	int findCountByParentId(@Param("parent") String parent_resource_id);
	
	
	/**
	 * 根据父id查询子节点
	 *
	 * @param parent_resource_id 资源父id
	 * @return List<Resource>
	 */
	@Query("from Resource where parent= :parent")
	List<Resource> findChildensByParentId(@Param("parent") String parent_resource_id);
	
	void deleteById(String id);
}
