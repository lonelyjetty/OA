package com.bizdata.zz.project.model.domain;

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
@Table(name = "zz_product_model_main")
@Entity
@Data
@EqualsAndHashCode(callSuper = true)
public class ProductModel extends JpaUUIDBaseEntity {

    /**
     * 项目名称
     */
    @Column
    private String productModelName;

   

  

    


    
    
}
