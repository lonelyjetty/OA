package com.bizdata.app.content.column.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.app.banner.domain.Banner;
import com.bizdata.app.content.article.service.ArticleService;
import com.bizdata.app.content.column.controller.vo.SearchColumnVO;
import com.bizdata.app.content.column.domain.Columnart;
import com.bizdata.app.content.column.service.ColumnService;
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

@Controller
@RequestMapping("/admin/column")  // 提供映射(注意路径)
public class ColumnController {

	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;
	@Autowired
	private ColumnService columnService;
	@Autowired
	private ArticleService articleService;
	private final FileUploadConfig fileUploadConfig;
	@Autowired
	public ColumnController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO,FileUploadConfig fileUploadConfig) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.fileUploadConfig = fileUploadConfig;
	}
	
	
	/**
	 * 
	 * @return
	 */
	@RequiresPermissions("column:view")  // 权限控制
    @RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		System.out.println("========内容管理页面=========");
		return new ModelAndView("app_page/content/column/list");
	}
	/**
	 * 
	 * @param jqGridPageVO
	 * @param jqGridSortVO
	 * @param searchArticleVO
	 * @return
	 */
	@RequiresPermissions("column:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			SearchColumnVO searchColumnVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<Columnart> columnart = columnService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				searchColumnVO);
		for(Columnart s:columnart) {
			Integer k = articleService.getNumByColumnartid(s.getId());
			if(k!=null) {
				s.setArticle_num(k);
			}
		}
		return new JpaPageResultVO<>(columnart, Columnart.class);
	}
	/**
     * 跳转至新增页面
     *
     * @return 模板页面
     */
    @RequestMapping(value = "/add_view", method = RequestMethod.GET)
    public ModelAndView addView() {
        return new ModelAndView("app_page/content/column/add");
    }
    /**
     * 检查sort
     *
     * @param 栏目 实体
     * @return 执行反馈
     */
    @RequestMapping(value = "/checkSort", method = RequestMethod.GET)
    @ResponseBody
    public boolean checkSort(int sort_no) {
    	Columnart col = columnService.findBySort_no(sort_no);
    	System.out.println(sort_no+"******************");
    	return col ==null;
    }
    
	/**
     * 栏目新增或修改
     *
     * @param 栏目 实体
     * @return 执行反馈
     */
    @RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO saveOrUpdate(Columnart columnart) {
        ResultVO resultVO;
        Integer k = columnService.findMaxid();
        if(k==null) {
        	columnart.setColumn_id(1);
        }else {
        	columnart.setColumn_id(k.intValue()+1);
        }
        columnart.setState("0");
        if (columnService.save(columnart)) {
            resultVO = ResultUtil.create(0, "Banner保存成功!");
        } else {
            resultVO = ResultUtil.create(-1, "Banner保存失败!");
        }
        return resultVO;
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
        Columnart columnart = columnService.findOne(id);
        columnart.setColumn_ico(fileUploadConfig.getServerPrefix() + columnart.getColumn_ico());
        columnart.setColumnbanner(fileUploadConfig.getServerPrefix() + columnart.getColumnbanner());
        return new ModelAndView("app_page/content/column/edit","columnart",columnart);
    }
    /**
     * 根据ID删除某条Banner
     *
     * @param id id
     * @return 执行反馈
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO del(String id) {
        ResultVO resultVO;
        if (columnService.delete(id)) {
            resultVO = ResultUtil.create(0, "Banner删除成功!");
        } else {
            resultVO = ResultUtil.create(-1, "Banner删除失败!");
        }
        return resultVO;
    }
}
