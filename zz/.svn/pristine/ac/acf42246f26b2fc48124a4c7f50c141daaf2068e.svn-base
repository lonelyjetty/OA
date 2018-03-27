package com.bizdata.app.circle.reply.controller;

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

import com.bizdata.app.circle.circle_mag.service.CircleService;
import com.bizdata.app.circle.reply.controller.vo.CirReplySearchVO;
import com.bizdata.app.circle.reply.domain.CirReply;
import com.bizdata.app.circle.reply.service.CirReplyService;
import com.bizdata.app.maguser.domain.MagUser;
import com.bizdata.app.maguser.domain.UserProfile;
import com.bizdata.app.maguser.service.MagUserService;
import com.bizdata.app.maguser.service.UserProfileService;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridPageVO2JpaPageParamVO;
import com.bizdata.commons.utils.JqGridSortVO;
import com.bizdata.commons.utils.JqGridSortVO2JpaSortParamVO;
import com.bizdata.config.FileUploadConfig;

import me.sdevil507.resp.ResultUtil;
import me.sdevil507.resp.ResultVO;
import me.sdevil507.vo.JpaPageParamVO;
import me.sdevil507.vo.JpaPageResultVO;
import me.sdevil507.vo.JpaSortParamVO;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/admin/reply")
public class CirReplyController {

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
        binder.registerCustomEditor(Date.class, new DateEditor());
    }

    private final CirReplyService cirreplyService;

    private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

    private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;

    private final FileUploadConfig fileUploadConfig;
    
    private final MagUserService magUserService;

    @Autowired
    public CirReplyController(CirReplyService cirreplyService, JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO, JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO, FileUploadConfig fileUploadConfig
    		,MagUserService magUserService) {
        this.cirreplyService = cirreplyService;
        this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
        this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
        this.fileUploadConfig = fileUploadConfig;
        this.magUserService = magUserService;
    }

    /**
     * 展示对应模板页面
     *
     * @return 模板页面
     */
    @RequiresPermissions("reply:view")
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView view() {
        return new ModelAndView("app_page/circle/reply/list");
    }

    /**
     * 展示列表数据
     *
     * @param jqGridPageVO   分页VO
     * @param jqGridSortVO   排序VO
     * @param cirreplySearchVO cirreply搜索参数
     * @return 结果list
     */
    @RequiresPermissions("reply:view")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, CirReplySearchVO cirreplySearchVO) {
        JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
        JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
        Page<CirReply> cirreplys = cirreplyService.findAllByPage(jpaPageParamVO, jpaSortParamVO, cirreplySearchVO);
        for(CirReply cirreply:cirreplys) {
        	MagUser s = magUserService.findOne(cirreply.getUser_id());
        	if(null!=s) {
        		cirreply.setUser_name(s.getAccountName());
        		cirreply.setUser_num(s.getAccountnum());
        	}
        }
        return new JpaPageResultVO<>(cirreplys, CirReply.class);
    }

    /**
     * 根据ID删除某条CirReply
     *
     * @param id id
     * @return 执行反馈
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO del(String id) {
        ResultVO resultVO;
        CirReply c = cirreplyService.findOne(id);
        if(null!=c) {
        	if(c.getState().equals("0")) {
        		c.setState("1");
        	}else {
        		c.setState("0");
        	}
        }
        if (cirreplyService.save(c)) {
            resultVO = ResultUtil.create(0, "CirReply删除成功!");
        } else {
            resultVO = ResultUtil.create(-1, "CirReply删除失败!");
        }
        return resultVO;
    }
    /**
     * 客服对回复进行回复
     * @param target_id 回复id
     * @param id 客服id
     * @param replycontent
     * @return
     */
    @RequestMapping(value = "/coustemerReply", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO del(String target_id,String coustemerid,String replycontent) {
    	System.out.println("+"+target_id+"+"+coustemerid+"+"+replycontent);
        ResultVO resultVO;
        CirReply cri = new CirReply();
        int s = cirreplyService.findOne(target_id).getTarget_num();
        if(s==0 ||s==3) {
        	s++;
        }
        cri.setFloor(cirreplyService.getMaxFloorByTypeAndId(s,target_id)+1);
        //2为客服回复
		cri.setTarget_num(2);
		//用户id
		cri.setUser_id(coustemerid);
		//目标id
		cri.setTarget_id(target_id);
		cri.setState("0");
		cri.setContent(replycontent);
		cri.setNum(0);
        if (cirreplyService.save(cri)) {
            resultVO = ResultUtil.create(0, "回复成功!");
        } else {
            resultVO = ResultUtil.create(-1, "回复失败!");
        }
        return resultVO;
    }
}
