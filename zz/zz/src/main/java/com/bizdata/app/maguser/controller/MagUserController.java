package com.bizdata.app.maguser.controller;

import java.util.Date;

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

import com.bizdata.app.circle.circletopic.service.CircleTopicService;
import com.bizdata.app.circle.reply.service.CirReplyService;
import com.bizdata.app.maguser.controller.vo.SearchMagUserVO;
import com.bizdata.app.maguser.domain.MagUser;
import com.bizdata.app.maguser.domain.UserProfile;
import com.bizdata.app.maguser.service.MagUserService;
import com.bizdata.app.maguser.service.UserLoginService;
import com.bizdata.app.maguser.service.UserProfileService;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;

import me.sdevil507.resp.ResultUtil;
import me.sdevil507.resp.ResultVO;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;


@Controller
@RequestMapping("/admin/mag_user")
public class MagUserController {
	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;
	
	private final MagUserService MagUserService;
	private final UserLoginService userLoginService;
	private final CircleTopicService circleTopicService;
	private final CirReplyService cirreplyService;
	@Autowired
	private UserProfileService userProfileService;
	
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}
	
	@Autowired
	public MagUserController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, MagUserService MagUserService,
			UserLoginService userLoginService,CircleTopicService circleTopicService,CirReplyService cirreplyService) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.MagUserService = MagUserService;
		this.userLoginService = userLoginService;
		this.circleTopicService = circleTopicService;
		this.cirreplyService = cirreplyService;
	}
	
	@RequiresPermissions("mag_user:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("app_page/maguser/list");
	}
	/**
	 * 用户信息详情
	 * @param id
	 * @return
	 */
	@RequiresPermissions("mag_user:view")
	@RequestMapping(value="/detal",method = RequestMethod.GET)
	public ModelAndView detalview(String id) {
		MagUser user = MagUserService.getUserInfo(id);
		return new ModelAndView("app_page/maguser/detal","data",user);
	}
	
	/**
	 * 查询分页记录
	 *
	 * @param jqGridPageVO
	 *            分页参数
	 * @param jqGridSortVO
	 *            排序参数
	 * @param searchLoseWeightDataVO
	 *            查询参数
	 * @return 分页记录
	 */
	@RequiresPermissions("mag_user:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO<MagUser, MagUser> list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SearchMagUserVO searchMagUserVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<MagUser> magUser = MagUserService.findAllByPage(jpaPageParamVO, jpaSortParamVO, searchMagUserVO);
		for(MagUser mag:magUser) {
			UserProfile userProfile = userProfileService.findByAccountId(mag.getId());
			if(null!=userProfile) {
				mag.setAccountName(userProfile.getNickName());
				mag.setPn(userProfile.getPn());
				mag.setRegip(userProfile.getRegIp());
			}
		}
		return new JpaPageResultVO<>(magUser, MagUser.class);
	}
	/**
	 * 用户信息详情
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/lock", method = RequestMethod.POST)
    @ResponseBody
	public ResultVO lock(String id) {
		System.out.println(id);
		ResultVO resultVO;
		MagUser user = MagUserService.findOne(id);
		//正常则锁定
		if(1 == user.getAccountStatus()) {
			user.setAccountStatus(-1);
			
		}
		//锁定则解锁
		else if(-1==user.getAccountStatus()) {
			user.setAccountStatus(1);
		}
		if (MagUserService.save(user)) {
			userLoginService.setLoginStatus(id,user.getAccountStatus());
            resultVO = ResultUtil.create(0, "操作成功!");
        } else {
            resultVO = ResultUtil.create(-1, "操作失败!");
        }
        return resultVO;
	}
	/**
	 * 对用户话题和评论权限操作
	 * 话题 1 正常 2 锁定 3 删除
	 * 评论 0:正常 1:删除 2:锁定
	 * @param id
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/lockcircle", method = RequestMethod.POST)
    @ResponseBody
	public ResultVO lockcircle(String id,String state) {
		ResultVO resultVO;
		String cristate = "0";
		if("1".equals(state)) {
			cristate="0";
		}else if("2".equals(state)) {
			cristate="2";
		}else if("3".equals(state)) {
			cristate="1";
		}
		if (circleTopicService.setStateByUserid(id,state)&&cirreplyService.setStateByUserid(id, cristate)) {
            resultVO = ResultUtil.create(0, "操作成功!");
        } else {
            resultVO = ResultUtil.create(-1, "操作失败!");
        }
        return resultVO;
	}
}
