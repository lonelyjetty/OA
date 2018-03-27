package com.bizdata.app.service.option.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.bizdata.app.service.option.controller.vo.SearchOptionVO;
import com.bizdata.app.service.option.domain.HaOption;
import com.bizdata.app.service.option.repository.OptionRepository;
import com.bizdata.app.service.option.service.OptionService;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaSortParamVO;

@Service
@Slf4j
public class OptionServiceImpl implements OptionService {
	private final OptionRepository optionRepository;

	@Autowired
	public OptionServiceImpl(OptionRepository optionRepository) {
		this.optionRepository = optionRepository;
	}

	@Override
	public Page<HaOption> findAllByPage(JpaPageParamVO jpaPageParamVO, JpaSortParamVO jpaSortParamVO,
			SearchOptionVO searchOptionVO) {
		String optionCode = "%%";
		String optionName = "%%";
		String optionScoring = "%%";
		String skipCode = "%%";
		String questionId = "";
		// 如果选择编码存在
		if (StringUtils.isNotBlank(searchOptionVO.getOptionCode())) {
			optionCode = "%" + searchOptionVO.getOptionCode() + "%";
		}
		// 如果选项名称存在
		if (StringUtils.isNotBlank(searchOptionVO.getOptionName())) {
			optionName = "%" + searchOptionVO.getOptionName() + "%";
		}
		if (StringUtils.isNotBlank(searchOptionVO.getQuestionId())) {
			questionId = searchOptionVO.getQuestionId();
		}
		// 如果选项得分存在
		if (StringUtils.isNotBlank(searchOptionVO.getSkipCode())) {
			skipCode = searchOptionVO.getSkipCode();
		}
		// 如果跳转问题编号存在
		if (StringUtils.isNotBlank(searchOptionVO.getOptionScoring())) {
			optionScoring = searchOptionVO.getOptionScoring();
		}
		return optionRepository.findAll(jpaPageParamVO.getPageable(jpaSortParamVO.getSort()), questionId, optionCode,
				optionName, skipCode);
	}

	@Override
	public boolean save(HaOption haOption) {
		boolean state;
		try {
			optionRepository.save(haOption);
			state = true;
		} catch (Exception e) {
			log.error("保存或更新haOption失败:", e);
			state = false;
		}
		return state;
	}

	@Override
	public HaOption findOne(String id) {
		return optionRepository.findOne(id);
	}

	@Override
	public boolean delete(String id) {
		boolean state;
		try {
			optionRepository.delete(id);
			state = true;
		} catch (Exception e) {
			log.error("haOption删除失败:", e);
			state = false;
		}
		return state;
	}

}
