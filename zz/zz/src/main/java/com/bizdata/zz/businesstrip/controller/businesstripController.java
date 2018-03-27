package com.bizdata.zz.businesstrip.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/business_trip")
public class businesstripController {

	
	@RequiresPermissions("business_trip:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("zz/businesstrip/list");
	}
	
	@RequestMapping(value="/addandview",method = RequestMethod.GET)
	public ModelAndView addandview() {
		return new ModelAndView("zz/businesstrip/addandedit");
	}
	
	
	
}
