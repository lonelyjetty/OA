package com.bizdata.zz.project.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bizdata.admin.domain.Organization;
import com.bizdata.admin.domain.User;
import com.bizdata.admin.service.OrganizationService;
import com.bizdata.admin.service.UserService;
import com.bizdata.commons.utils.DateEditor;
import com.bizdata.zz.project.controller.vo.ProjectTemp;
import com.bizdata.zz.project.controller.vo.UserTemp;
import com.bizdata.zz.project.domain.Product;
import com.bizdata.zz.project.service.ProductService;
import com.bizdata.zz.project.vo.OrganizationAndUsers;
import com.google.gson.Gson;

import me.sdevil507.resp.ResultUtil;
import me.sdevil507.resp.ResultVO;

@Controller
@RequestMapping("/admin/projectList")
public class ProjectController {

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		// 对于需要转换为Date类型的属性，使用DateEditor进行处理
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	@Autowired
	private OrganizationService organizationService;

	@Autowired
	private UserService userService;

	@Autowired
	private ProductService productService;

	// 跳转详情
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail() {
		return new ModelAndView("zz/project/detail");
	}

	// 跳转遍历
	// 跳转详情
	@RequiresPermissions("projectList:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("zz/project/list");
	}
	
	// 跳转增加故事和任务
	@RequestMapping(value = "/addStoryOrDuty",method = RequestMethod.GET)
	public ModelAndView addStoryOrDuty() {
		return new ModelAndView("zz/project/storyorduty/add");
	}


	/**
	 * getAll
	 * 
	 * @Title: view
	 * @Description: TODO
	 * @return
	 * @return: ModelAndView
	 */
	@RequestMapping(value = "/findAllPro", method = RequestMethod.GET)
	@ResponseBody
	public String findAll() {
		List<Product> allProductVo = new ArrayList<>();
		Map<String, Object> productMap = new HashMap<>();
		List<Product> allProduct = productService.findAll();
		
		
		for (Product product : allProduct) {
			if(product.getIslocked().equals("0")) {
				allProductVo.add(product);
			}
			String mid = product.getProductManager();
			User findOne = userService.findOne(mid);
			String deptid = product.getProductDept();
			Organization findOne2 = organizationService.findOne(deptid);
			product.setProductManagerName(findOne.getUsername());
			product.setProductDeptName(findOne2.getName());
		}
		productMap.put("rows", allProductVo);
		return new Gson().toJson(productMap);
	}
	
	
	

	// 查询所有的部门
	@RequestMapping(value = "/organizationList", method = RequestMethod.GET)
	@ResponseBody
	public String organizationList() {
		List<OrganizationAndUsers> OrganizationAndUsers = new ArrayList<>();
		Map<String, Object> organizationMap = new HashMap<>();
		List<Organization> allOrganization = organizationService.findAll();
		// 根据部门id查询员工
		for (Organization organization : allOrganization) {
			List<User> allusers = userService.findAllByOrganizationId(organization.getId());
			for (User user : allusers) {
				OrganizationAndUsers temp = new OrganizationAndUsers();
				temp.setId(user.getId());
				temp.setName(user.getUsername());
				temp.setParent(organization.getId());
				OrganizationAndUsers.add(temp);
			}
			OrganizationAndUsers temp = new OrganizationAndUsers();
			temp.setId(organization.getId());
			temp.setName(organization.getName());
			temp.setParent(organization.getParent());
			temp.setNocheck(true);
			OrganizationAndUsers.add(temp);
		}
		organizationMap.put("rows", OrganizationAndUsers);
		return new Gson().toJson(organizationMap);
	}
	
    /**
     *  根据部门id进行查找人员
     * @Title: findAllByOrganizationId 
     * @Description: TODO
     * @param organizationId
     * @return
     * @return: String
     */
    @RequestMapping(value = "/findAllByOrganizationId",method = RequestMethod.GET)
    @ResponseBody
    public String findAllByOrganizationId(String organizationId) {
    	List<UserTemp> allusers = new ArrayList<>();
    	Map<String, Object> usersMap = new HashMap<>();
    	System.out.println(organizationId+"组织部门id==================");
    	List<User> users = userService.findAllByOrganizationId(organizationId);
    	for (User user : users) {
    		UserTemp temp = new UserTemp();
    		temp.setId(user.getId());
    		temp.setUsername(user.getUsername());
    		allusers.add(temp);
		}
    	usersMap.put("rows", allusers);
    	return new Gson().toJson(usersMap);
    }

	// 跳转增加
	@RequiresPermissions("projectList:add")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView add() {
		return new ModelAndView("zz/project/add");
	}

	// 跳转编辑页面
	@RequestMapping(value = "/edit_view", method = RequestMethod.GET)
	public ModelAndView editView(String id) {
		System.out.println(id+"=================");
		List<User> usersList  =new ArrayList<>();
		ProjectTemp projectTemp = new ProjectTemp();
		System.out.println(id+"=================");
		Product findOne = productService.findOne(id);
		if(findOne != null) {
			//查询管理者
			String productManagerid = findOne.getProductManager();
			User manager = userService.findOne(productManagerid);
			//查询部门信息
			String productDeptid = findOne.getProductDept();
			Organization organization = organizationService.findOne(productDeptid);
			//查询人员
			String productActorids = findOne.getProductActor();
			if (StringUtils.containsAny(productActorids, ",")) {
				String[] ids = productActorids.split(",");
					for (String singleid : ids) {
						User users = userService.findOne(singleid);
						usersList.add(users);
				}
			}else {
				User singleUser = userService.findOne(productActorids);
				usersList.add(singleUser);
			}
			projectTemp.setUsers(usersList);
			projectTemp.setOrganization(organization);
			projectTemp.setManager(manager);
			projectTemp.setProduct(findOne);
		}
		return new ModelAndView("zz/project/edit_view","edit",projectTemp);
	}
	
	// 跳转编辑页面
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view(String id) {
		List<User> usersList  =new ArrayList<>();
		ProjectTemp projectTemp = new ProjectTemp();
		System.out.println(id+"=================");
		Product findOne = productService.findOne(id);
		if(findOne != null) {
			//查询管理者
			String productManagerid = findOne.getProductManager();
			User manager = userService.findOne(productManagerid);
			//查询部门信息
			String productDeptid = findOne.getProductDept();
			Organization organization = organizationService.findOne(productDeptid);
			//查询人员
			String productActorids = findOne.getProductActor();
			if (StringUtils.containsAny(productActorids, ",")) {
				String[] ids = productActorids.split(",");
					for (String singleid : ids) {
						User users = userService.findOne(singleid);
						usersList.add(users);
				}
			}else {
				User singleUser = userService.findOne(productActorids);
				usersList.add(singleUser);
			}
			projectTemp.setUsers(usersList);
			projectTemp.setOrganization(organization);
			projectTemp.setManager(manager);
			projectTemp.setProduct(findOne);
		}
		return new ModelAndView("zz/project/view","view",projectTemp);
	}

	/**
	 * 增加项目
	 *
	 * @param 项目
	 *            实体
	 * @return 执行反馈
	 */
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO addProduct(Product product) {
		ResultVO resultVO;
		product.setIslocked("0");
		if (productService.save(product)) {
			resultVO = ResultUtil.create(0, "项目保存成功!");
		} else {
			resultVO = ResultUtil.create(-1, "项目保存失败!");
		}
		return resultVO;
	}

	// 跳转增加
	@RequestMapping(value = "/toProductDetail", method = RequestMethod.GET)
	public ModelAndView toProductDetail(String id, Model model) {
		System.out.println(id + "====================================");
		ModelAndView mav = new ModelAndView("zz/project/productDetails");
		mav.addObject("messages", id);
		return mav;
	}

	// 跳转增加任务
	@RequestMapping(value = "/addduty", method = RequestMethod.GET)
	public ModelAndView addduty() {
		return new ModelAndView("zz/project/addduty");
	}
	
	//逻辑删除
    /**
     * 根据ID删除某条Banner
     *
     * @param id id
     * @return 执行反馈
     */
    @RequestMapping(value = "/deleteByIslocked", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO del(String id) {
    	System.out.println(id+"==================");
    	String islocked = "0";
        ResultVO resultVO;
        Product one = productService.findOne(id);
        if(one.getIslocked().equals("0")) {
        	islocked="1";
        }
        int flag = productService.deleteByIslocked(id,islocked);
        if(flag > 0 ) {
        	 resultVO = ResultUtil.create(0, "商品状态修改成功!");
        }else {
        	 resultVO = ResultUtil.create(-1, "商品状态修改失败!");
        }
        return resultVO;
    }

	// 跳转地图取点
	@RequestMapping(value = "/toBaiduMap", method = RequestMethod.GET)
	public ModelAndView toBaiduMap() {
		return new ModelAndView("zz/project/baidumap");
	}

}
