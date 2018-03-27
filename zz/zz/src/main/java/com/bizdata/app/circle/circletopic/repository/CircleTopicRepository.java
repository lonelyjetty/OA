package com.bizdata.app.circle.circletopic.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.circle.circletopic.domain.CircleTopic;

import me.sdevil507.base.JpaBaseRepository;

/**
 * 
 * @author Administrator
 *
 */
public interface CircleTopicRepository extends JpaBaseRepository<CircleTopic, String> {
	@Query(value="select max(topicid) from app_circle_topic",nativeQuery=true)
	Integer getMaxtopicid();
	//修改用户所发表全部文章的状态
	@Query(value="update app_circle_topic set state = ?2 where user_id = ?1",nativeQuery=true)
	@Modifying
	void setStateByUserid(String userid, String state);
}
