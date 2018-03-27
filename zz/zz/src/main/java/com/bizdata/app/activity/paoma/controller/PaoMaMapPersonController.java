package com.bizdata.app.activity.paoma.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.bizdata.app.activity.paoma.controller.vo.PaoMaMapPersonVO;
import com.bizdata.app.activity.paoma.domain.PaoMaDetails;
import com.bizdata.app.activity.paoma.domain.PaoMaMapPerson;
import com.bizdata.app.activity.paoma.service.PaoMaDetailsService;
import com.bizdata.app.activity.paoma.service.impl.PaoMaMapPersonServiceImpl;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

@Controller
@RequestMapping("/admin/paoma/map") // 声明路径
// @Slf4j
public class PaoMaMapPersonController {
	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final PaoMaMapPersonServiceImpl paoMaMapPersonServiceImpl;

	private final PaoMaDetailsService paoMaDetailsService;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	public PaoMaMapPersonController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO,
			PaoMaMapPersonServiceImpl paoMaMapPersonServiceImpl, PaoMaDetailsService paoMaDetailsService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.paoMaMapPersonServiceImpl = paoMaMapPersonServiceImpl;
		this.paoMaDetailsService = paoMaDetailsService;
	}

	@RequiresPermissions("paoma:view") // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view(String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		return new ModelAndView("app_page/activity/paoma/details/list", map);
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
	@RequiresPermissions("paoma:view") // 权限控制
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<PaoMaDetails, PaoMaDetails> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			PaoMaMapPersonVO paoMaMapPersonVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		//System.out.println(paoMaMapPersonVO.getId());
		//List<PaoMaDetails> paoMaDetails = paoMaDetailsService.findByActivityId(paoMaMapPersonVO.getId());
		System.out.println(paoMaMapPersonVO.getId());
		System.out.println(paoMaMapPersonVO.getNickName());
		Page<PaoMaDetails> paoMaDetail = paoMaDetailsService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				paoMaMapPersonVO);
		//List<PaoMaDetails> s = paoMaDetail.getContent();
		//System.out.println(s.get(0).toString());
		return new JpaPageResultVO<>(paoMaDetail, PaoMaDetails.class);
//		Page<PaoMaMapPerson> paoMaMapPerson = paoMaMapPersonServiceImpl.findAllByPage(jpaPageParamVO, jpaSortParamVO,
//				paoMaMapPersonVO);
//		return new JpaPageResultVO<>(paoMaMapPerson, PaoMaMapPerson.class);
	}
}
