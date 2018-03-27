package com.bizdata.app.circle.reply.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.bizdata.app.circle.reply.domain.CirReply;

import me.sdevil507.base.JpaBaseRepository;

/**
 * 
 * @author Administrator
 *
 */
public interface CirReplyRepository extends JpaBaseRepository<CirReply, String> {
	//获取目标已有最大楼层数
	@Query(value="select Max(floor) from app_art_criticism where target_num = ?1 and target_id = ?2",nativeQuery = true)
	public Integer getMaxFloorByTypeAndId(int target_num, String target_id);
	//设置用户发表的评论的状态
	@Query(value="update app_art_criticism set state = ?2 where user_id = ?1",nativeQuery=true)
	@Modifying
	public void setStateByUserid(String userid, String state);
}
