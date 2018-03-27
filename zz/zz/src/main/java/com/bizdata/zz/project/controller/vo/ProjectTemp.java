package com.bizdata.zz.project.controller.vo;

import java.util.List;

import com.bizdata.admin.domain.Organization;
import com.bizdata.admin.domain.User;
import com.bizdata.zz.project.domain.Product;

public class ProjectTemp {
	
	private Product product;
	
	
	private List<User> users;
	
	private Organization organization;
	
	private User manager;

	public User getManager() {
		return manager;
	}

	public void setManager(User manager) {
		this.manager = manager;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}


	
	
	
}
