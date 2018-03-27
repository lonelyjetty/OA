package com.bizdata.zz.project.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.bizdata.zz.project.domain.Product;

import me.sdevil507.base.JpaBaseRepository;

/**
 * BannerRepository
 * <p>
 * Created by sdevil507 on 2017/9/5.
 */
public interface ProductRepository extends JpaBaseRepository<Product, String> {
	
	/**
	 *  根据状态修改商品的显示 隐藏
	 * @Title: deleteByIslocked 
	 * @Description: TODO
	 * @param id
	 * @return
	 * @return: int
	 */
	@Transactional//jpa的硬性要求，'没有事务支持，不能执行更新和删除操作'。
	@Modifying//spring jpa 执行修改操作时：
	@Query(value="update zz_product_main set islocked =:islocked where id=:id",nativeQuery=true)
	int deleteByIslocked(@Param("id")String id,@Param("islocked")String islocked);
	
}