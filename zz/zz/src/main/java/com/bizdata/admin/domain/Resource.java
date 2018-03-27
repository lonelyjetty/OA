package com.bizdata.admin.domain;

import com.bizdata.commons.constant.ResourceType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "admin_resource")
@Data
@EqualsAndHashCode(callSuper = true, exclude = {"menus"})
public class Resource extends JpaUUIDBaseEntity {
    /**
     * 资源名称
     */
    @Column(nullable = false)
    private String name;

    /**
     * 资源类型
     */
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ResourceType type;

    /**
     * 资源路径
     */
    private String url;

    /**
     * 权限字符串
     */
    @Column(nullable = false)
    private String permission;

    /**
     * 资源图标
     */
    private String icon;

    /**
     * 是否是初始化的
     */
    @Column(nullable = false)
    private Boolean isInitialized = false;

    /**
     * 排序号
     */
    @Column(nullable = false)
    private Integer sortNum;

    /**
     * 父id
     */
    @Column(updatable = false)
    private String parent = "";

    /**
     * 是否展开
     */
    @Column(nullable = false)
    private Boolean expanded = true;

    /**
     * 加载
     */
    @Column(nullable = false)
    private Boolean loaded = true;

    /**
     * 层级
     */
    @Column(updatable = false, nullable = false)
    private int level;

    /**
     * 是否叶子节点
     */
    private Boolean isleaf = true;

    /**
     * 是否是根节点
     */
    private Boolean root = false;

    /**
     * 如果是column 栏目类型，则有包含的menu 菜单
     */
    @Transient
    private List<Resource> menus = new ArrayList<>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ResourceType getType() {
		return type;
	}

	public void setType(ResourceType type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Boolean getIsInitialized() {
		return isInitialized;
	}

	public void setIsInitialized(Boolean isInitialized) {
		this.isInitialized = isInitialized;
	}

	public Integer getSortNum() {
		return sortNum;
	}

	public void setSortNum(Integer sortNum) {
		this.sortNum = sortNum;
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

	public Boolean getRoot() {
		return root;
	}

	public void setRoot(Boolean root) {
		this.root = root;
	}

	public List<Resource> getMenus() {
		return menus;
	}

	public void setMenus(List<Resource> menus) {
		this.menus = menus;
	}
    
}
