package com.bizdata.admin.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * 数据初始化表
 *
 * @author sdevil507
 * @version 1.0
 */
@Entity
@Table(name = "admin_init")
@Data
@EqualsAndHashCode(callSuper = true)
public class Init extends JpaUUIDBaseEntity {
    /**
     * 是否已经初始化
     */
    @Column(nullable = false)
    private boolean state = false;

    @Column(nullable = false)
    private Date date = new Date();

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
    
}
