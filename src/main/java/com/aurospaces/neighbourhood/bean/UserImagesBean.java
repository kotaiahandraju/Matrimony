package com.aurospaces.neighbourhood.bean;

import java.util.Date;

public class UserImagesBean {
	private int id=0;
	protected Date createdTime ;
	protected Date updated_on;
	protected String userId;
	protected String status;
	protected String approvedStatus;
	protected String isProfilePicture;
	protected String image;
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
	public Date getUpdated_on() {
		return updated_on;
	}
	public void setUpdated_on(Date updated_on) {
		this.updated_on = updated_on;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getIsProfilePicture() {
		return isProfilePicture;
	}
	public void setIsProfilePicture(String isProfilePicture) {
		this.isProfilePicture = isProfilePicture;
	}
	public String getApprovedStatus() {
		return approvedStatus;
	}
	public void setApprovedStatus(String approvedStatus) {
		this.approvedStatus = approvedStatus;
	}
	
}
