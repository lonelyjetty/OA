package com.bizdata.app.circle.reply.service;

import org.springframework.data.domain.Page;

import com.bizdata.app.circle.reply.controller.vo.CirReplySearchVO;
import com.bizdata.app.circle.reply.domain.CirReply;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 
 * @author Administrator
 *
 */
public interface CirReplyService {

    /**
     * 执行更新操作
     *
     * @param cirreply cirreply实体
     * @return 执行反馈
     */
    boolean save(CirReply cirreply);

    /**
     * 分页查询
     *
     * @param jpaPageParamVO 分页参数
     * @param jpaSortParamVO 排序参数
     * @param cirreplySearchVO cirreply查询参数VO
     * @return 分页记录
     */
    Page<CirReply> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO, CirReplySearchVO cirreplySearchVO);

    /**
     * 根据ID删除
     *
     * @param id id
     * @return 执行反馈
     */
    boolean delete(String id);

    /**
     * 根据ID获取CirReply记录
     *
     * @param id id
     * @return cirreply记录
     */
    CirReply findOne(String id);
    //获取目标已有楼层数
	int getMaxFloorByTypeAndId(int target_num, String target_id);
	//设置用户的全部评论状态
	boolean setStateByUserid(String userid, String state);
}
