package com.bizdata.zz.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bizdata.zz.project.domain.ProductStoriesAndDuties;

import me.sdevil507.base.JpaBaseRepository;

/**
 * BannerRepository
 * <p>
 * Created by sdevil507 on 2017/9/5.
 */
public interface ProductStoriesAndDutiesRepository extends JpaBaseRepository<ProductStoriesAndDuties, String> {
	
	
	/**
	 * 根据父id查询出子节点个数
	 *
	 * @param parent id
	 * @return int
	 */
	@Query("select count(1) from ProductStoriesAndDuties where parent= :parent")
	int countByParentId(@Param("parent") String parent);
	
	/**
	 * 根据父id查询子节点
	 *
	 * @param parent 资源父id
	 * @return List<Resource>
	 */
	@Query("from ProductStoriesAndDuties where parent= :parent") 
	List<ProductStoriesAndDuties> findAllByParentId(@Param("parent") String parent);
}
