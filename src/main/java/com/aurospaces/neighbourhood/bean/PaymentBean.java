package com.aurospaces.neighbourhood.bean;

import java.util.Date;

public class PaymentBean 
{


protected int id   = 0;

protected Date createdTime ;
protected Date updatedTime ;
protected String packageId ;
protected String executiveName ;
protected long paidAmount ;
protected String validFrom ;
protected String note ;
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
public String getPackageId() {
	return packageId;
}
public void setPackageId(String packageId) {
	this.packageId = packageId;
}
public String getExecutiveName() {
	return executiveName;
}
public void setExecutiveName(String executiveName) {
	this.executiveName = executiveName;
}
public long getPaidAmount() {
	return paidAmount;
}
public void setPaidAmount(long paidAmount) {
	this.paidAmount = paidAmount;
}
public String getValidFrom() {
	return validFrom;
}
public void setValidFrom(String validFrom) {
	this.validFrom = validFrom;
}
public String getNote() {
	return note;
}
public void setNote(String note) {
	this.note = note;
}


}