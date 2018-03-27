package com.bizdata.zz.staff.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/staffs")
public class staffController {

	
	@RequiresPermissions("staffs:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("zz/staff/list");
	}
	
	//跳转员工详情页
	@RequiresPermissions("staffs:view")
	@RequestMapping(value="/turn",method = RequestMethod.GET)
	public ModelAndView turn() {
		return new ModelAndView("zz/staff/detail");
	}
	
	//跳转员工测评
	@RequiresPermissions("staffs:view")
	@RequestMapping(value="/staffs_test",method = RequestMethod.GET)
	public ModelAndView staffsTest() {
		return new ModelAndView("zz/staff/test/list");
	}
	
	//跳转员工测评详情页
	@RequestMapping(value="/staffs_test_detail",method = RequestMethod.GET)
	public ModelAndView staffsTestDetail() {
		return new ModelAndView("zz/staff/test/detail");
	}
	
	
}
