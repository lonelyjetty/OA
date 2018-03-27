package com.bizdata.app.homelocation.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import me.sdevil507.base.JpaUUIDBaseEntity;

@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "app_homelocation")
@Data
public class HomeLocation extends JpaUUIDBaseEntity {
	
	private String name;
	private String classify;
	private int locationId;
	private int locationNo;
	private String articleName;
	private String locationPicture;

}
