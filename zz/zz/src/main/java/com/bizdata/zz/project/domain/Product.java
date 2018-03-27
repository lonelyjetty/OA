package com.bizdata.zz.project.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

/**
 * zz_product_main实体
 * <p>
 * Created by xq on 2017/12/7.
 */
@Table(name = "zz_product_main")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class Product extends JpaUUIDBaseEntity {

    /**
     * 项目名称
     */
    @Column
    private String productName;

    /**
     * banner图片地址
     */
    @Column
    private String picUrl;
    
    @Column
    private String productManager;
    
    
    private String productManagerName;
    
    @Column
    private String productModel;
    
    @Column
    private String productDept;
    
    
    private String productDeptName;
    
    @Column
    private String islocked;
    
    @Column
    private String productActor;

    @Column
    private String productLocation;
    
    @Column
    private String productDesc;

    /**
     * 排序号
     */
    @Column
    private int serialNum;

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
    
    @Column
    private String productStatus;

  

    


    
    
}
