package com.bizdata.admin.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 角色资源关系表
 *
 * @author sdevil507
 * @version 1.0
 */
@Entity
@Table(name = "admin_role_resource")
@Data
@EqualsAndHashCode(callSuper = true)
public class RoleResource extends JpaUUIDBaseEntity {
    @Column(nullable = false)
    private String roleid;

    @Column(nullable = false)
    private String resourceid;

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getResourceid() {
		return resourceid;
	}

	public void setResourceid(String resourceid) {
		this.resourceid = resourceid;
	}
    
    
}
