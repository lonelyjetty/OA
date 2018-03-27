package com.bizdata.app.miaototal.page;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.bizdata.app.miaodetail.domain.MiaoDetail;
import com.bizdata.app.miaototal.controller.vo.SearchMiaoTotalVO;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridSortVO;

/**
 * @author Administrator
 *
 */
@Service
public class JQGridSearchMiaoServiceImpl implements JQGridSearchMiaoService{
	//事务管理
	@PersistenceContext
	private EntityManager em;
	
	/* 
	 * 返回JQGridResponse
	 * (non-Javadoc)
	 * @see com.bizdata.app.miaototal.page.JQGridSearchMiaoService#search(com.bizdata.commons.utils.JqGridPageVO, com.bizdata.commons.utils.JqGridSortVO, com.bizdata.app.miaototal.controller.vo.SearchMiaoTotalVO)
	 */
	public JQGridResponse search(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SearchMiaoTotalVO searchMiaoTotalVO) {
		JQGridResponse response = new JQGridResponse();
		// 如果可执行排序
        String[] sidxs;
        String[] sords;
		sidxs = jqGridSortVO.getSidx().split(",");//排序字段
        sords = jqGridSortVO.getSord().split(",");//排序方向,排序方式：asc， desc
        int page = jqGridPageVO.getPage();//当前页数
        int rows = jqGridPageVO.getRows();//每页记录数
        return this.getResponse(page, rows, sidxs, sords, searchMiaoTotalVO);
       
	}
	
	/**
	 * MiaoVO为处理后数据对象
	 * MiaoDetail为表对象,需要有参数与MiaoVO相同的构造方法
	 * 如:public MiaoDetail(String userId,int accountnum,long miaoMoney);
	 * @param page 页码
	 * @param rows 每页数目
	 * @param sidxs 排序字段(未添加)
	 * @param sords 排序方向
	 * @param searchMiaoTotalVO
	 * @return
	 */
	private JQGridResponse<MiaoVO> getResponse(int page,int rows,String[] sidxs,String[] sords,SearchMiaoTotalVO searchMiaoTotalVO){
		JQGridResponse<MiaoVO> response = new JQGridResponse();
		CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<MiaoDetail> q = cb.createQuery(MiaoDetail.class);
        Root<MiaoDetail> root = q.from(MiaoDetail.class);
        //设定select字段
        q.multiselect(
                root.get("userId").as(String.class),
                root.get("accountnum").as(int.class),
                cb.sum(root.get("miaoMoney").as(Integer.class))
            );
        //设定where条件
        List<Predicate> list = new ArrayList<>();
			// 如果用户ID不为空
			if (StringUtils.isNotBlank(searchMiaoTotalVO.getUserId())) {
				list.add(cb.equal(root.get("accountnum").as(int.class),Integer.parseInt(searchMiaoTotalVO.getUserId())));
			}
			// 如果开始时间存在
			if (null != searchMiaoTotalVO.getStartTime()) {
				list.add(cb.greaterThanOrEqualTo(root.get("operationdatestamp").as(int.class),
						new Long(searchMiaoTotalVO.getStartTime().getTime()/1000).intValue()));
			}
			// 如果结束时间存在
			if (null != searchMiaoTotalVO.getEndTime()) {
				list.add(cb.lessThanOrEqualTo(root.get("operationdatestamp"),
						new Long(searchMiaoTotalVO.getEndTime().getTime()/1000).intValue()));
			}
        Predicate[] pre = new Predicate[list.size()];
        q.where(list.toArray(pre));
        //设定groupby条件
        q.groupBy(
            root.get("accountnum").as(int.class)
        );
        //设定orderby条件
        q.orderBy(cb.desc(root.get("accountnum").as(int.class)));
        //总条数
        String tablename = "user_miao_detail";
        String countSql = "select count(DISTINCT accountnum) from "+tablename.toString();
        Query countQuery = em.createNativeQuery(countSql);
        BigDecimal obj = new BigDecimal(countQuery.getSingleResult().toString());
        //总页数
        int totalPage = (int) Math.ceil(obj.divide(new BigDecimal(rows)).doubleValue());
        Query query = em.createQuery(q);
        int firstIndex = ((page-1) * rows);
        query.setFirstResult(firstIndex);//起始位置
        query.setMaxResults(rows);//查询数量
        List<MiaoVO> lists = query.getResultList();
        //设置返回值
        response.setRows(lists);
        response.setPage(page);
        response.setTotal(totalPage);
        response.setRecords(obj.intValue());
		return response;
	}
	
}
