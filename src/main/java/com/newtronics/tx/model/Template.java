package com.newtronics.tx.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Template {
	// 主键
	@Id
	private String id;

	//User display
	private String name;

	//JSP file name
	private String viewName;
	
	private String notifiyNoFormat;

	private int enabled;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	public String getNotifiyNoFormat() {
		return notifiyNoFormat;
	}

	public void setNotifiyNoFormat(String notifiyNoFormat) {
		this.notifiyNoFormat = notifiyNoFormat;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
}
