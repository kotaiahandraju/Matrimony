package com.aurospaces.neighbourhood.bean;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;



import java.util.Date;
import java.math.BigDecimal;


/**
 *
 * @author autogenerated
 */



public class Paymenthistory 
{

@Id
@GeneratedValue(strategy=GenerationType.AUTO)
		 /** Field mapping. **/
@Column(name= "id")
protected int id   = 0;

/** Field mapping. **/
@Column(name= "created_time")
protected Date createdTime ;

/** Field mapping. **/
@Column(name= "updated_time")
protected Date updatedTime ;

/** Field mapping. **/
@Column(name= "memberId")
protected String memberId ;

/** Field mapping. **/
@Column(name= "price")
protected double price ;

/** Field mapping. **/
@Column(name= "paymentType")
protected String paymentType ;

/** Field mapping. **/
@Column(name= "paymentStatus")
protected String paymentStatus ;

/** Field mapping. **/
@Column(name= "txid")
protected String txid ;

/** Field mapping. **/
@Column(name= "remarks")
protected String remarks ;

/** Field mapping. **/
@Column(name= "bankRefNum")
protected String bankRefNum ;

protected String packageId ;

public String getPackageId() {
	return packageId;
}
public void setPackageId(String packageId) {
	this.packageId = packageId;
}
public int getId()
{
  return id;
}
public void setId(final int id)
{
  this.id = id;
}
public Date getCreatedTime()
{
  return createdTime;
}
public void setCreatedTime(final Date createdTime)
{
  this.createdTime = createdTime;
}
public Date getUpdatedTime()
{
  return updatedTime;
}
public void setUpdatedTime(final Date updatedTime)
{
  this.updatedTime = updatedTime;
}
public String getMemberId()
{
  return memberId;
}
public void setMemberId(final String memberId)
{
  this.memberId = memberId;
}
public double getPrice()
{
  return price;
}
public void setPrice(final double price)
{
  this.price = price;
}
public String getPaymentType()
{
  return paymentType;
}
public void setPaymentType(final String paymentType)
{
  this.paymentType = paymentType;
}
public String getPaymentStatus()
{
  return paymentStatus;
}
public void setPaymentStatus(final String paymentStatus)
{
  this.paymentStatus = paymentStatus;
}
public String getTxid()
{
  return txid;
}
public void setTxid(final String txid)
{
  this.txid = txid;
}
public String getRemarks()
{
  return remarks;
}
public void setRemarks(final String remarks)
{
  this.remarks = remarks;
}
public String getBankRefNum()
{
  return bankRefNum;
}
public void setBankRefNum(final String bankRefNum)
{
  this.bankRefNum = bankRefNum;
}

}