package com.bizdata.app.content.article.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.content.article.controller.vo.SearchArticleVO;
import com.bizdata.app.content.article.domain.Article;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface ArticleService {

	/**
     * 分页获取圈子消息
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param bootSearchVO   查询VO
     * @return 分页记录
     */
	Page<Article> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchArticleVO searchArticleVO);
	/**
	 * 保存圈子
	 * @param ArticleClass 消息内容
	 * @return 执行反馈 
	 */
	boolean save(Article ArticleClass);
	/**
	 * 发布圈子
	 * @param ArticleClass 消息内容
	 * @return 执行反馈
	 */
	boolean release(Article ArticleClass);
	Integer findMaxid();
	int getpraisenum(String article_id);
	int getcrinum(String article_id);
	boolean delete(String id);
	Article findOne(String id);
	int getMaxcircleid();
	//获取栏目文章数
	Integer getNumByColumnartid(String columnartid);
}
