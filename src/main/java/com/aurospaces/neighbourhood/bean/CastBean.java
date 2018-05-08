package com.aurospaces.neighbourhood.bean;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

public class CastBean {
	private int id=0;
	protected Date createdTime ;
	protected Date updatedTime ;
	@NotEmpty
	private String name;
	private String status;
	private String religionId,religionname;
	
	public String getReligionname() {
		return religionname;
	}
	public void setReligionname(String religionname) {
		this.religionname = religionname;
	}
	
	public String getReligionId() {
		return religionId;
	}
	public void setReligionId(String religionId) {
		this.religionId = religionId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public Date getUpdatedTime() {
		return updatedTime;
	}
	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
