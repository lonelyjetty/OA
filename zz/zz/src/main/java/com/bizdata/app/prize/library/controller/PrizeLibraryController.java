package com.bizdata.app.prize.library.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.prize.library.controller.vo.PrizeLibrarySearchVO;
import com.bizdata.app.prize.library.controller.vo.PrizeRecordSearchVO;
import com.bizdata.app.prize.library.domain.PrizeLibrary;
import com.bizdata.app.prize.library.domain.PrizeRecord;
import com.bizdata.app.prize.library.service.PrizeLibraryService;
import com.bizdata.app.prize.library.service.PrizeRecordService;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;
import com.bizdata.config.FileUploadConfig;

import lombok.extern.slf4j.Slf4j;
import me.sdevil507.resp.ResultUtil;
import me.sdevil507.resp.ResultVO;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

@Controller
@RequestMapping("/admin/prize_library")
@Slf4j
public class PrizeLibraryController {

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;
	
	private final PrizeLibraryService prizeLibraryService;
	
	private final PrizeRecordService prizeRecordService;
	
	private final FileUploadConfig fileUploadConfig;
	
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}
	
	@Autowired
	public PrizeLibraryController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO,
			PrizeLibraryService prizeLibraryService, FileUploadConfig fileUploadConfig,
			PrizeRecordService prizeRecordService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.prizeLibraryService = prizeLibraryService;
		this.fileUploadConfig = fileUploadConfig;
		this.prizeRecordService = prizeRecordService;
	}
	
	@RequiresPermissions("prize_library:view")  // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/prize/library/list");
	}
	
	/**
	 * 展示列表数据
	 *
	 * @param jqGridPageVO
	 *            分页VO
	 * @param jqGridSortVO
	 *            排序VO
	 * @param prizeLibrarySearchVO
	 *            banner搜索参数
	 * @return 结果list
	 */
	@RequiresPermissions("prize_library:view") // 权限控制
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<PrizeLibrary, PrizeLibrary> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			PrizeLibrarySearchVO prizeLibrarySearchVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<PrizeLibrary> prizeLibraries = prizeLibraryService.findAllByPage(jpaPageParamVO, jpaSortParamVO, prizeLibrarySearchVO);
		for (PrizeLibrary prizeLibrary : prizeLibraries) {
			prizeLibrary.setPrizeUrl(fileUploadConfig.getServerPrefix() + prizeLibrary.getPrizeUrl());
			prizeLibrary.setGetNum(prizeLibraryService.getAcceptNum(prizeLibrary.getId()));
			prizeLibrary.setGetExchangeNum(prizeLibraryService.getExchangeNum(prizeLibrary.getId()));
		}
		return new JpaPageResultVO<>(prizeLibraries, PrizeLibrary.class);
	}
	
	/**
	 * 跳转至新增页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("prize_library:view") // 权限控制
	@RequestMapping(value = "/add_view", method = RequestMethod.GET)
	public ModelAndView addView() {
		return new ModelAndView("app_page/prize/library/add");
	}
	
	/**
	 * prize_library新增或修改
	 *
	 * @param paoMa
	 *            实体
	 * @return 执行反馈
	 */
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO saveOrUpdate(PrizeLibrary prizeLibrary) {
		ResultVO resultVO = null;
		if(null == prizeLibrary.getCreateDate()) {
			prizeLibrary.setCreateDate(new Date());
		}
		String prizeContent = prizeLibrary.getPrizeContent();
		if(null != prizeContent) {
			String[] temp = prizeContent.split(",");	//分割字符串
			for(int i = 0; i < temp.length; i++) {
				if(!StringUtils.isBlank(temp[i])) { //如果该字符串不为''则必为有值
					prizeLibrary.setPrizeContent(temp[i]);
					break;
				}
			}
					
		}
		if(prizeLibraryService.save(prizeLibrary)) {
			resultVO = ResultUtil.create(0, "paoMa保存成功!");
		} else {
			resultVO = ResultUtil.create(-1, "paoMa保存失败!");
		}
		return resultVO;
	}
	
	/**
	 * 上下线功能
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/line", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO line(String id) {
		ResultVO resultVO;

		PrizeLibrary prizeLibrary = prizeLibraryService.findOne(Integer.valueOf(id));
		if (null != prizeLibrary) {
			if ("1".equals(prizeLibrary.getState())) {
				System.out.println("该活动由上线变为下线");
				prizeLibrary.setState("-1");
			} else if ("0".equals(prizeLibrary.getState())) {
				System.out.println("该活动由待发布变为上线");
				prizeLibrary.setState("1");
			}

			boolean result = prizeLibraryService.save(prizeLibrary);
			if (!result) {
				log.error("更新失败！");
				resultVO = ResultUtil.create(-1, "发生错误，请检查");
			} else {
				resultVO = ResultUtil.create(0, "执行成功");
			}
		} else {
			resultVO = ResultUtil.create(-1, "该活动不存在");
		}

		return resultVO;
	}
	
	/**
	 * 跳转到编辑
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
    public ModelAndView readOne(String id) {
		PrizeLibrary prizeLibrary = prizeLibraryService.findOne(Integer.valueOf(id));
		prizeLibrary.setPrizeUrl(fileUploadConfig.getServerPrefix() + prizeLibrary.getPrizeUrl());
        return new ModelAndView("app_page/prize/library/edit", "prizeLibrary", prizeLibrary);
    }
	
	/**
	 * 跳转至详细页面
	 *
	 * @return 模板页面
	 */
	@RequiresPermissions("prize_library:view") // 权限控制
	@RequestMapping(value = "/details_view", method = RequestMethod.GET)
	public ModelAndView detailsView(String id) {
		// 该字符串不为空
		Map<String, String> map = new HashMap<String, String>();
		if(!StringUtils.isBlank(id)) {
			map = new HashMap<String, String>();
			map.put("id", id);
		}
		return new ModelAndView("app_page/prize/library/details/list", map);
	}
	/**
	 * 展示列表数据
	 *
	 * @param jqGridPageVO
	 *            分页VO
	 * @param jqGridSortVO
	 *            排序VO
	 * @param PaoMaMapPersonVO
	 *            paomaMapPerson搜索参数
	 * @return 结果list
	 */
	@RequiresPermissions("prize_library:view") // 权限控制
	@RequestMapping(value = "/details/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<PrizeRecord, PrizeRecord> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			PrizeRecordSearchVO prizeRecordSearchVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		//System.out.println(paoMaMapPersonVO.getId());
		//List<PaoMaDetails> paoMaDetails = paoMaDetailsService.findByActivityId(paoMaMapPersonVO.getId());
		System.out.println(prizeRecordSearchVO.getPrizeId());
		//System.out.println(paoMaMapPersonVO.getNickName());
		Page<PrizeRecord> prizeRecord = prizeRecordService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				prizeRecordSearchVO);
		//List<PaoMaDetails> s = paoMaDetail.getContent();
		//System.out.println(s.get(0).toString());
		return new JpaPageResultVO<>(prizeRecord, PrizeRecord.class);
//		Page<PaoMaMapPerson> paoMaMapPerson = paoMaMapPersonServiceImpl.findAllByPage(jpaPageParamVO, jpaSortParamVO,
//				paoMaMapPersonVO);
//		return new JpaPageResultVO<>(paoMaMapPerson, PaoMaMapPerson.class);
	}
}
