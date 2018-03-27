package com.bizdata.app.activity.hotevents.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.bizdata.app.activity.hotevents.controller.vo.HotEventsVO;
import com.bizdata.app.activity.hotevents.domain.HotEvents;
import com.bizdata.app.activity.hotevents.respository.HotEventsRespository;
import com.bizdata.app.activity.hotevents.service.HotEventsService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class HotEventsServiceImpl implements HotEventsService {

	private final HotEventsRespository hotEventsRespository;

	@Autowired
	public HotEventsServiceImpl(HotEventsRespository hotEventsRespository) {
		this.hotEventsRespository = hotEventsRespository;
	}

	@Override
	public Page<HotEvents> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			HotEventsVO hotEventsVO) {
		return hotEventsRespository.findAll(listWhereClause(hotEventsVO),
				jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}

	private Specification<HotEvents> listWhereClause(HotEventsVO hotEventsVO) {
		return new Specification<HotEvents>() {
			@Override
			public Predicate toPredicate(Root<HotEvents> root, CriteriaQuery<?> criteriaQuery,
					CriteriaBuilder criteriaBuilder) {
				List<Predicate> list = new ArrayList<>();
				// 如果活动名称存在
				if (StringUtils.isNotBlank(hotEventsVO.getEventName())) {
					// 添加like时需要加上%
					list.add(criteriaBuilder.like(root.get("eventName").as(String.class),
							"%" + hotEventsVO.getEventName() + "%"));
				}
				// 如果活动链接存在
				if (StringUtils.isNotBlank(hotEventsVO.getEventUrl())) {
					// 添加like时需要加上%
					list.add(criteriaBuilder.like(root.get("eventUrl").as(String.class),
							"%" + hotEventsVO.getEventUrl() + "%"));
				}
				// 如果活动状态存在
				if (StringUtils.isNotBlank(hotEventsVO.getState())) {
					list.add(criteriaBuilder.equal(root.get("state").as(String.class), hotEventsVO.getState()));
				}
				// 如果开始时间存在
				if (null != hotEventsVO.getStartDate()) {
					list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("startDate").as(Date.class),
							hotEventsVO.getStartDate()));
				}

				// 如果结束时间存在
				if (null != hotEventsVO.getEndDate()) {
					list.add(criteriaBuilder.lessThanOrEqualTo(root.get("startDate").as(Date.class),
							hotEventsVO.getEndDate()));
				}

				// 如果进行中时间存在
				if (null != hotEventsVO.getStartingTime()) {
					list.add(criteriaBuilder.lessThan(root.get("startDate").as(Date.class),
							hotEventsVO.getStartingTime())); // 现在时间比开始时间少
					list.add(criteriaBuilder.greaterThan(root.get("endDate").as(Date.class),
							hotEventsVO.getStartingTime())); // 现在时间比结束时间
				}

				// 如果未开始时间存在
				if (null != hotEventsVO.getNoStartTime()) {
					list.add(criteriaBuilder.greaterThan(root.get("startDate").as(Date.class),
							hotEventsVO.getNoStartTime())); // 现在时间比开始时间大
				}

				// 如果已结束时间存在
				if (null != hotEventsVO.getEndedTime()) {
					list.add(criteriaBuilder.greaterThan(root.get("endDate").as(Date.class),
							hotEventsVO.getEndedTime())); // 现在时间比结束时间大
				}

				// //如果位置信息是枚举中值
				// if (EnumUtils.contains(searchPaoMaVO.getBannerPositionEnum(),
				// BannerPositionEnum.class)) {
				// list.add(criteriaBuilder.equal(root.get("bannerPositionEnum").as(String.class),
				// searchPaoMaVO.getBannerPositionEnum()));
				// }
				//

				Predicate[] p = new Predicate[list.size()];
				return criteriaBuilder.and(list.toArray(p));
			}
		};
	}

	@Override
	public boolean save(HotEvents hotevents) {
		boolean state;
		try {
			hotEventsRespository.save(hotevents);
			state = true;
		} catch (Exception e) {
			log.error("保存或更新hotevents失败:", e);
			state = false;
		}
		return state;
	}

	@Override
	public HotEvents findOne(String id) {
		return hotEventsRespository.findOne(id);
	}

}
