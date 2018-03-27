package com.bizdata.zz.project.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.admin.domain.Organization;
import com.bizdata.commons.constant.BizdataResponseStatus;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.zz.project.domain.ProductStoriesAndDuties;
import com.bizdata.zz.project.service.ProductStoriesAndDutiesService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admin/productStoriesAndDuties")
public class ProductStoriesAndDutiesController {

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	private ProductStoriesAndDutiesService productStoriesAndDutiesService;

	 @RequiresPermissions("sys:organization:view")
	    @RequestMapping(method = RequestMethod.GET)
	    public ModelAndView index() {
	        return new ModelAndView("zz/project/productDetails");
	    }

	    /**
	     * 返回部门list json数据
	     *
	     * @return json类型部门数据
	     */
	    @RequiresPermissions("sys:organization:view")
	    @RequestMapping(value = "/productStoriesAndDutiesList", method = RequestMethod.GET)
	    @ResponseBody
	    public String productStoriesAndDutiesList() {
	        Map<String, Object> organizationMap = new HashMap<>();
	        organizationMap.put("rows", productStoriesAndDutiesService.findAll());
	        return new Gson().toJson(organizationMap);
	    }

	    /**
	     * 添加部门
	     *
	     * @return json
	     */
	    @RequiresPermissions("sys:organization:create")
	    @ResponseBody
	    @RequestMapping(value = "/addproductStoriesAndDuties", method = RequestMethod.POST)
	    public String addOrganization(ProductStoriesAndDuties productStoriesAndDuties) {
	        String json;
	        try {
	        	productStoriesAndDutiesService.insertProductStoriesAndDuties(productStoriesAndDuties);
	            json = BizdataResponseStatus.COMMON_SUCCESS.getResult("新增部门成功");
	        } catch (Exception e) {
	            e.printStackTrace();
	            json = BizdataResponseStatus.COMMON_ERROR.getResult("新增部门失败");
	        }
	        return json;
	    }

	    /**
	     * 部门更新操作
	     *
	     * @param sysOrganization
	     * @return json
	     */
	    @RequiresPermissions("sys:organization:update")
	    @RequestMapping(value = "/update", method = RequestMethod.POST)
	    @ResponseBody
	    public String update(ProductStoriesAndDuties productStoriesAndDuties) {
	        String json;
	        try {
	        	productStoriesAndDutiesService.updateProductStoriesAndDuties(productStoriesAndDuties);
	            json = BizdataResponseStatus.COMMON_SUCCESS.getResult("更新部门成功");
	        } catch (Exception e) {
	            e.printStackTrace();
	            json = BizdataResponseStatus.COMMON_ERROR.getResult("更新部门失败");
	        }
	        return json;
	    }

	    /**
	     * 根据id删除部门
	     *
	     * @param id 部门id
	     * @return json类型操作反馈
	     */
	    @RequiresPermissions("sys:organization:delete")
	    @ResponseBody
	    @RequestMapping(value = "/delete", method = RequestMethod.POST)
	    public String delete(String id) {
	        String json;
	        try {
	            if (productStoriesAndDutiesService.canDeleteProductStoriesAndDuties(id)) {
	                // 可以删除
	            	productStoriesAndDutiesService.deleteProductStoriesAndDuties(id);
	                json = BizdataResponseStatus.COMMON_SUCCESS.getResult("删除部门成功");
	            } else {
	                // 部门下存在人员
	                json = BizdataResponseStatus.COMMON_ERROR.getResult("部门或子部门下存在人员，不允许删除！");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            json = BizdataResponseStatus.COMMON_ERROR.getResult("删除部门失败");
	        }
	        return json;
	    }

	    /**
	     * 获取相同父项的组织机构 并包装到TreeModel中给页面提供树形展示
	     *
	     * @param id 组织机构id
	     * @return json类型树形数据
	     */
	    @RequiresPermissions("sys:organization:view")
	    @RequestMapping(value = "/brotherOrganization/{id}", method = RequestMethod.GET)
	    @ResponseBody
	    public String brotherOrganization(@PathVariable("id") String id) {
	        String json = "";
	        try {
	            List<ProductStoriesAndDuties> orgList = productStoriesAndDutiesService.findAllByParentId(id);
	            List<Map<String, Object>> list = new ArrayList<>();
	            if (orgList != null) {
	                for (ProductStoriesAndDuties org : orgList) {
	                    Map<String, Object> map = new HashMap<>();
	                    int count = productStoriesAndDutiesService.countByParentId(org.getId());
	                    if (count > 0) {
	                        map.put("type", "folder");
	                    } else {
	                        map.put("type", "item");
	                    }
	                    map.put("id", org.getId() + "");
	                    map.put("text", org.getName());
	                    list.add(map);
	                }
	            }
	            json = new Gson().toJson(list);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return json;
	    }
}
