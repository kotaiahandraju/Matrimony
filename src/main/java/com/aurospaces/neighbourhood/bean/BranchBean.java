package com.aurospaces.neighbourhood.bean;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

public class BranchBean {
	private int id=0;
	protected Date createdTime ;
	protected Date updatedTime ;
	@NotEmpty
	private String name;
	@NotEmpty
	private String prefix;
	@NotEmpty
	private String admin;
	@NotEmpty
	private String premium;
	@NotEmpty
	private String free;
	@NotEmpty
	private String widow;
	private String sms_sender;
	private String status;
	private String image;
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
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getPremium() {
		return premium;
	}
	public void setPremium(String premium) {
		this.premium = premium;
	}
	public String getFree() {
		return free;
	}
	public void setFree(String free) {
		this.free = free;
	}
	public String getWidow() {
		return widow;
	}
	public void setWidow(String widow) {
		this.widow = widow;
	}

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSms_sender() {
		return sms_sender;
	}
	public void setSms_sender(String sms_sender) {
		this.sms_sender = sms_sender;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
	
	
	
	
}
