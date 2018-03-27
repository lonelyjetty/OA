package com.bizdata.app.circle.circle_mag.respository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.circle.circle_mag.domain.Circle;

import me.sdevil507.base.JpaBaseRepository;

public interface CircleRepository extends JpaBaseRepository<Circle, String> {
	@Query(value="select max(circle_id) from app_circle",nativeQuery=true)
	Integer getMaxcircleid();
	
	List<Circle> findByCircleclassid(String classid);
	//设置话题数
	@Query(value="update app_circle set topicnum = topicnum + 1 where id = ?1",nativeQuery=true)
	@Modifying
	void setTopicnum(int circleId);
	@Query(value="select * from app_circle where circle_id = ?1",nativeQuery=true)
	Circle findByCircleid(int circleId);

}
