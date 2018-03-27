package com.bizdata.app.service.reply.controller;

import java.util.Date;
import java.util.HashMap;
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

import com.bizdata.app.service.reply.controller.vo.ChunyuProblemVO;
import com.bizdata.app.service.reply.controller.vo.ChunyuReplyVO;
import com.bizdata.app.service.reply.domain.ChunyuReply;
import com.bizdata.app.service.reply.service.ChunyuReplyService;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;

import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

@Controller
@RequestMapping("/admin/chunyureply")
public class ChunyuReplyController {
	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final ChunyuReplyService chunyuReplyService;

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	public ChunyuReplyController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, ChunyuReplyService chunyuReplyService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.chunyuReplyService = chunyuReplyService;
	}

	@RequiresPermissions("chunyuproblem:view") // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view(String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("problemId", id);
		return new ModelAndView("app_page/service/reply/details/list", map);
	}

	/**
	 * 展示列表数据
	 *
	 * @param jqGridPageVO
	 *            分页VO
	 * @param jqGridSortVO
	 *            排序VO
	 * @param bannerSearchVO
	 *            banner搜索参数
	 * @return 结果list
	 */
	@RequiresPermissions("chunyuproblem:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<ChunyuReply, ChunyuReply> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			ChunyuReplyVO chunyuReplyVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<ChunyuReply> ChunyuReplies = chunyuReplyService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				chunyuReplyVO);
		// for (ChunyuProblem chunyuProblem : chunyuProblems) {
		// }
		return new JpaPageResultVO<ChunyuReply, ChunyuReply>(ChunyuReplies, ChunyuReply.class);
	}
}
