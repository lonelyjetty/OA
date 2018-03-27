package com.bizdata.app.prize.library.service.impl;

import java.util.ArrayList;
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

import com.bizdata.app.prize.library.controller.vo.PrizeLibrarySearchVO;
import com.bizdata.app.prize.library.domain.PrizeLibrary;
import com.bizdata.app.prize.library.repository.PrizeLibraryRepository;
import com.bizdata.app.prize.library.service.PrizeLibraryService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class PrizeLibraryServiceImpl implements PrizeLibraryService {

	private final PrizeLibraryRepository prizeLibraryRepository;
	
	@Autowired
    public PrizeLibraryServiceImpl(PrizeLibraryRepository prizeLibraryRepository) {
        this.prizeLibraryRepository = prizeLibraryRepository;
    }
	
	@Override
	public Page<PrizeLibrary> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			PrizeLibrarySearchVO prizeLibrarySearchVO) {
		return prizeLibraryRepository.findAll(listWhereClause(prizeLibrarySearchVO), jpaPageParamVO.getPageable(jpaSortParamVO.getSort()));
	}
    /**
     * 查询条件
     * @param prizeLibrarySearchVO
     * @return
     */
	private Specification<PrizeLibrary> listWhereClause(PrizeLibrarySearchVO prizeLibrarySearchVO) {
		return new Specification<PrizeLibrary>() {
            @Override
            public Predicate toPredicate(Root<PrizeLibrary> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();
                // 如果奖品名称存在
                if(StringUtils.isNotBlank(prizeLibrarySearchVO.getPrizeName())) {
                	// 添加like时需要加上%
                	list.add(criteriaBuilder.like(root.get("prizeName").as(String.class), "%" + prizeLibrarySearchVO.getPrizeName() + "%"));
                }

                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
	}

	@Override
	public Integer getAcceptNum(Integer prizeId) {
		return prizeLibraryRepository.getAcceptNum(prizeId);
	}

	@Override
	public Integer getExchangeNum(Integer prizeId) {
		return prizeLibraryRepository.getExchange(prizeId);
	}

	@Override
	public boolean save(PrizeLibrary prizeLibrary) {
		boolean state;
        try {
        	prizeLibraryRepository.save(prizeLibrary);
            state = true;
        } catch (Exception e) {
            log.error("保存或更新PaoMa失败:", e);
            state = false;
        }
        return state;
	}

	@Override
	public PrizeLibrary findOne(Integer id) {
		return prizeLibraryRepository.findOne(id);
	}

}
