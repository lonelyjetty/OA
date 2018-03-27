package com.bizdata.app.content.article.controller;

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

import com.bizdata.app.banner.domain.Banner;
import com.bizdata.app.circle.circle_classification.controller.vo.SearchCircleClassiVO;
import com.bizdata.app.circle.circle_classification.domain.CircleClassi;
import com.bizdata.app.content.article.controller.vo.SearchArticleVO;
import com.bizdata.app.content.article.domain.Article;
import com.bizdata.app.content.article.service.ArticleService;
import com.bizdata.app.content.column.domain.Columnart;
import com.bizdata.app.content.column.service.ColumnService;
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
@RequestMapping("/admin/article")
@Slf4j
public class ArticleController {
	private final ArticleService articleService;
	
	private final JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO;

	private final JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO;
	
	private final ColumnService columnService;
	private final FileUploadConfig fileUploadConfig;
	@InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
        binder.registerCustomEditor(Date.class, new DateEditor());
    }
	@Autowired
	public ArticleController(JqGridPageVO2JpaPageParamVO jqGridPageVO2JpaPageParamVO,
			JqGridSortVO2JpaSortParamVO jqGridSortVO2JpaSortParamVO,ArticleService articleService,
			ColumnService columnService,FileUploadConfig fileUploadConfig) {
		this.jqGridPageVO2JpaPageParamVO = jqGridPageVO2JpaPageParamVO;
		this.jqGridSortVO2JpaSortParamVO = jqGridSortVO2JpaSortParamVO;
		this.fileUploadConfig = fileUploadConfig;
		this.articleService = articleService;
		this.columnService = columnService;
	}
	
	@RequiresPermissions("article:view")  // 权限控制
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		Map<String, String> map = columnService.findNameAndId();
		return new ModelAndView("app_page/content/article/list","map",map);
	}
	
	
	@RequiresPermissions("article:view")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public JpaPageResultVO list(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO,
			SearchArticleVO searchArticleVO) {
		JpaPageParamVO jpaPageParamVO = jqGridPageVO2JpaPageParamVO.convert(jqGridPageVO);
		JpaSortParamVO jpaSortParamVO = jqGridSortVO2JpaSortParamVO.convert(jqGridSortVO);
		Page<Article> article = articleService.findAllByPage(jpaPageParamVO, jpaSortParamVO,
				searchArticleVO);
		for (Article art : article) {
			art.setPraise_num(articleService.getpraisenum(art.getId()));
			art.setComment_num(articleService.getcrinum(art.getId()));
			art.setShare_ico(fileUploadConfig.getServerPrefix() + art.getShare_ico());
			if(null != columnService.findOne(art.getColumnart_id())) {
				art.setColumn_name(columnService.findOne(art.getColumnart_id()).getColumn_name());
			}
        }
		return new JpaPageResultVO<>(article, Article.class);
	}
	
	/**
     * 新增文章页面
     *
     * @return 页面
     */
	@RequiresPermissions("article:view")
	@RequestMapping(value="/add_view",method=RequestMethod.GET)
	public ModelAndView addView() {
		Map<String, String> map = columnService.findNameAndId();
 		return new ModelAndView("app_page/content/article/add","columnmap",map);
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
        Article article = articleService.findOne(id);
        article.setShare_ico(fileUploadConfig.getServerPrefix() + article.getShare_ico());
        article.setLogoUrl(fileUploadConfig.getServerPrefix() + article.getLogoUrl());
        article.setColumn_name(columnService.findOne(article.getColumnart_id()).getColumn_name());
        return new ModelAndView("app_page/content/article/edit","article",article);
    }
    @RequestMapping(value = "/choosecolumn", method = RequestMethod.GET)
    @ResponseBody
    public Map<String,String> choosecolumn(String classid){
    	Map<String, String> ss = columnService.findNameAndId();
    	return ss;
    }
	/**
	 * 新增消息方法
	 * @param circleClass 入参VO
	 * @return 执行反馈
	 */
	@RequestMapping(value="/saveOrUpdate",method=RequestMethod.POST)
	@ResponseBody
	public ResultVO addCircleClassi(Article article) {
		ResultVO resultVO;
		if(article.getColumn_id()==0) {
			article.setColumn_id(articleService.getMaxcircleid()+1);
		}
		if (articleService.save(article)) {
            resultVO = ResultUtil.create(0, "保存消息成功!");
        } else {
            resultVO = ResultUtil.create(-1, "保存消息失败!");
        }
		return resultVO;
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
        if (articleService.delete(id)) {
            resultVO = ResultUtil.create(0, "Banner删除成功!");
        } else {
            resultVO = ResultUtil.create(-1, "Banner删除失败!");
        }
        return resultVO;
    }
}
