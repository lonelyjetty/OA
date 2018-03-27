package com.bizdata.app.circle.circletopic.controller;

import java.util.Date;
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

import com.bizdata.app.circle.circle_classification.service.CircleClassiService;
import com.bizdata.app.circle.circle_mag.service.CircleService;
import com.bizdata.app.circle.circletopic.controller.vo.CircleTopicSearchVO;
import com.bizdata.app.circle.circletopic.domain.CircleTopic;
import com.bizdata.app.circle.circletopic.service.CircleTopicService;
import com.bizdata.app.maguser.domain.MagUser;
import com.bizdata.app.maguser.service.MagUserService;
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
@RequestMapping(value = "/admin/theme")
public class CircleTopicController {

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
        binder.registerCustomEditor(Date.class, new DateEditor());
    }
    private final CircleClassiService circleClassiService;
    private final CircleTopicService circleTopicService;
    private final CircleService circleService;
    private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;
    private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;
    @Autowired
    private MagUserService magUserService;

    private final FileUploadConfig fileUploadConfig;


    @Autowired
    public CircleTopicController(CircleTopicService circleTopicService,
    		CircleService circleService,CircleClassiService circleClassiService, 
    		JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
    		JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO,
    		FileUploadConfig fileUploadConfig) {
        this.circleTopicService = circleTopicService;
        this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
        this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
        this.circleClassiService = circleClassiService;
        this.circleService = circleService;
        this.fileUploadConfig=fileUploadConfig;
    }

    /**
     * 展示对应模板页面
     *
     * @return 模板页面
     */
    @RequiresPermissions("theme:view")
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView view() {
		Map<String, String> map = circleClassiService.findNameAndId();
        return new ModelAndView("app_page/circle/theme/list","map",map);
    }

    /**
     * 展示列表数据
     *
     * @param jqGridPageVO   分页VO
     * @param jqGridSortVO   排序VO
     * @param circleTopicSearchVO circleTopic搜索参数
     * @return 结果list
     */
    @RequiresPermissions("theme:view")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, CircleTopicSearchVO circleTopicSearchVO) {
    	JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
        JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
        Page<CircleTopic> circleTopics = circleTopicService.findAllByPage(jpaPageParamVO, jpaSortParamVO, circleTopicSearchVO);
        for(CircleTopic cir:circleTopics) {
        	Integer m = magUserService.getAccountnumById(cir.getUserId());
        	if(null == m) {        		
        		cir.setAccountnum(0);
        	}else {
        		cir.setAccountnum(m);
        	}
        	cir.setSharePic(fileUploadConfig.getServerPrefix()+cir.getSharePic());
        	cir.setCircleclassname(circleClassiService.getNameById(cir.getClassId()));
        	cir.setCirclename(circleService.getNameById(cir.getCircleeeid()));
        }
        return new JpaPageResultVO<>(circleTopics, CircleTopic.class);
    }


    /**
     * 跳转至新增页面
     *
     * @return 模板页面
     */
    @RequestMapping(value = "/add_view", method = RequestMethod.GET)
    public ModelAndView addView() {
		Map<String, String> map = circleClassiService.findNameAndId();
        return new ModelAndView("app_page/circle/theme/add","map",map);
    }

    /**
     * 根据ID跳转至编辑页面
     *
     * @param id id
     * @return 模板页面
     */
    @RequestMapping(value = "/edit_view", method = RequestMethod.GET)
    public ModelAndView editView(String id) {
        System.out.println(id);
        CircleTopic circleTopic = circleTopicService.findOne(id);
        circleTopic.setSharePic(fileUploadConfig.getServerPrefix()+circleTopic.getSharePic());
        circleTopic.setCircleclassname(circleClassiService.getNameById(circleTopic.getClassId()));
        circleTopic.setCirclename(circleService.getNameById(circleTopic.getCircleeeid()));
        return new ModelAndView("app_page/circle/theme/edit", "topic", circleTopic);
    }
    
    @RequestMapping(value = "/choosecircle", method = RequestMethod.GET)
    @ResponseBody
    public Map<String,String> changecircle(String classid){
    	Map<String,String> ss = circleService.findNameAndIdByCircleclass(classid);
    	return ss;
    }
    @RequestMapping(value = "/choosecircleclass", method = RequestMethod.GET)
    @ResponseBody
    public Map<String,String> choosecircleclass(String classid){
    	Map<String, String> map = circleClassiService.findNameAndId();
    	return map;
    }

    /**
     * CircleTopic新增或修改
     *
     * @param circleTopic 实体
     * @return 执行反馈
     */
    @RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO saveOrUpdate(CircleTopic circleTopic) {
        ResultVO resultVO;
        if(circleTopic.getTopicid() == 0) {
        	circleTopic.setTopicid(circleTopicService.getMaxtopicid()+1);
        	circleService.setTopicnum(circleTopic.getCircleId());
        }
        circleTopic.setCircleId(circleService.getCircleid(circleTopic.getCircleeeid()));
        if (circleTopicService.save(circleTopic)) {
            resultVO = ResultUtil.create(0, "CircleTopic保存成功!");
        } else {
            resultVO = ResultUtil.create(-1, "CircleTopic保存失败!");
        }
        return resultVO;
    }

    /**
     * 根据ID删除某条CircleTopic
     *
     * @param id id
     * @return 执行反馈
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO del(String id) {
        ResultVO resultVO;
        CircleTopic s = circleTopicService.findOne(id);
        if("1".equals(s.getState())) {
        	s.setState("3");
        }else {
        	s.setState("1");
        }
        if (circleTopicService.save(s)) {
            resultVO = ResultUtil.create(0, "CircleTopic删除成功!");
        } else {
            resultVO = ResultUtil.create(-1, "CircleTopic删除失败!");
        }
        return resultVO;
    }
}
