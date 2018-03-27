package com.bizdata.zz.project.service;

import java.util.List;

import com.bizdata.zz.project.domain.Product;

/**
 * BannerService
 * <p>
 * Created by xq on 2017/12/7.
 */
public interface ProductService {

    /**
     * 执行更新操作
     *
     * @param banner banner实体
     * @return 执行反馈
     */
    boolean save(Product product);

    /**
     * 分页查询
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param bannerSearchVO banner查询参数VO
     * @return 分页记录
     */
    //Page<Product> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, BannerSearchVO bannerSearchVO);

    /**
     * 根据ID删除
     *
     * @param id id
     * @return 执行反馈
     */
    boolean delete(String id);

    /**
     * 根据ID获取Banner记录
     *
     * @param id id
     * @return banner记录
     */
    Product findOne(String id);

	List<Product> findAll();

	/**
	 *  修改商品的状态
	 * @Title: deleteByIslocked 
	 * @Description: TODO
	 * @param id
	 * @return
	 * @return: int
	 */
	int deleteByIslocked(String id,String islocked);
}
