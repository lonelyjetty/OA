package com.bizdata.zz.project.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * 组织机构表
 *
 * @author sdevil507
 * @version 1.0
 */
@Entity
@Table(name = "zz_product_stories_duties")
@Data
@EqualsAndHashCode(callSuper = true)
public class ProductStoriesAndDuties extends JpaUUIDBaseEntity {

    @Column(nullable = false)
    private String name;

    @Column(updatable = false, nullable = false)
    private String parent;

    @Column(nullable = false)
    private Boolean expanded = true;

    @Column(nullable = false)
    private Boolean loaded = true;

    @Column(updatable = false, nullable = false)
    private int level;

    @Column(nullable = false)
    private Boolean isleaf = true;
    
    /**
     * 开始时间
     */
    @Column
    private Date startTime;

    /**
     * 结束时间
     */
    @Column
    private Date endTime;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public Boolean getExpanded() {
		return expanded;
	}

	public void setExpanded(Boolean expanded) {
		this.expanded = expanded;
	}

	public Boolean getLoaded() {
		return loaded;
	}

	public void setLoaded(Boolean loaded) {
		this.loaded = loaded;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public Boolean getIsleaf() {
		return isleaf;
	}

	public void setIsleaf(Boolean isleaf) {
		this.isleaf = isleaf;
	}
    
    
}
