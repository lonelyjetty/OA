package com.bizdata.app.content.column.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;

import com.bizdata.app.content.article.controller.vo.SearchArticleVO;
import com.bizdata.app.content.article.domain.Article;
import com.bizdata.app.content.column.controller.vo.SearchColumnVO;
import com.bizdata.app.content.column.domain.Columnart;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

public interface ColumnService {

	/**
     * 分页获取圈子消息
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param bootSearchVO   查询VO
     * @return 分页记录
     */
	Page<Columnart> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchColumnVO searchArticleVO);
	/**
	 * 保存圈子
	 * @param ArticleClass 消息内容
	 * @return 执行反馈 
	 */
	boolean save(Columnart columnart);
	public boolean release(Columnart columnart);
	public Columnart findBySort_no(int sort_no);
	Integer findMaxid();
	Map<String, String> findNameAndId();
	Columnart findOne(String id);
	boolean delete(String id);

}
