package com.bizdata.zz.dailytime.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/dailytime")
public class dailytimeController {

	
	@RequiresPermissions("dailytime_:view")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView view() {
		return new ModelAndView("zz/dailytime/list");
	}
}
