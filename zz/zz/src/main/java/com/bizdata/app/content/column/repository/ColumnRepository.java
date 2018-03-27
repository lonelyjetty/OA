package com.bizdata.app.content.column.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.content.article.domain.Article;
import com.bizdata.app.content.column.domain.Columnart;

import me.sdevil507.base.JpaBaseRepository;

public interface ColumnRepository extends JpaBaseRepository<Columnart, String> {
	@Query(value="select * from app_column where sort_no = ?1",nativeQuery=true)
	public Columnart findBySort_no(int sort_no);
	@Query(value="select max(column_id) from app_column",nativeQuery=true)
	public Integer findMaxid();
	@Query(value="select id,column_name from app_column",nativeQuery=true)
	public List<Object> findNameAndId();
}
