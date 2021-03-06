package com.aurospaces.neighbourhood.bean;

import java.util.Date;

public class UsersBean 
{


protected int id   = 0;

protected Date createdTime ;
protected String createdTimeAsString ;
protected Date updatedTime ;
protected String last_ip;
protected int roleId ;
protected String username ;
protected String password ,regPassword;
public String getRegPassword() {
	return regPassword;
}
public void setRegPassword(String regPassword) {
	this.regPassword = regPassword;
}
protected String email ;
protected String createProfileFor ;
protected String gender ;
protected String firstName ;
protected String lastName ;
protected String dob ;
protected Date dob1;
protected String religion ;
protected String motherTongue ;
protected String currentCountry ;
protected String currentState ;
protected String currentCity ;
protected String maritalStatus ;
protected String caste ;
protected String gotram ;
protected String star ;
protected String dosam ;
protected String dosamName ;
protected String education ;
protected String companyName ;
protected String annualIncome ;
protected String monthlyIncome ;
protected String diet ;
protected String smoking ;
protected String drinking ;
protected String height ;
protected String heightName ;
protected String bodyType ;
protected String complexion ;
protected String mobile ;
protected String aboutMyself ;
protected String disability ;
protected String status ;
protected String showall ;
protected String workingWith ;
protected int userId;
protected String pageName;
protected String registerwith;
protected String branch;
protected String statusName;
protected String occupation;
protected String rAgeFrom ;
protected String rAgeTo ;
protected String rHeight ;
protected String rHeightTo ;
protected String rMaritalStatus ;
protected String rReligion ;
protected String rCaste ;
protected String rMotherTongue ;
protected String haveChildren;
protected String  rCountry,rState,rEducation,rWorkingWith,rOccupation,rAnnualIncome,rCreateProfileFor,rDiet;
protected int userrequirementId;
protected String  reTypedPassword;
protected String fatherName, motherName, fOccupation, mOccupation, noOfBrothers, noOfSisters, noOfBrothersMarried, noOfSistersMarried;
protected String rhaveChildren;
protected int expressedInterest,mobileNumViewed;
protected String image;
protected String profileImage;
protected String age;
protected Paymenthistory paymentObject;
protected String casteName;protected String religionName;protected String educationName;
protected String occupationName;
protected String currentCityName;
protected String packageId;
protected String redirectPage;
protected String sentInterestCount;
protected String receivedInterestCount;
protected String acceptedInterestCount;
protected String profileViewedCount;
protected String pendingRequestsCount,yetToBeViewedCount,viewedNotContactedCount,awaitingInterestCount;
protected String rejectedInterestCount,profilesViewedByMeCount,mobileNumViewedCount,mobileNumViewedByMeCount,shortListedCount;
protected boolean forEmail;
protected String currentStateName;
protected String currentCountryName;
protected String motherTongueName;
protected String starName;
protected String heightInches;
protected String complexionName;
protected String bodyTypeName;
protected int page_no;
protected int total_records;
protected int OtpLimit;
protected String OtpStatus;
private String country_ids,state_ids,last_login_time;
protected String weight;
protected String fOccupationName;
protected String mOccupationName;
protected String mail_content,rReligionName,rCasteName,rDietName,rMotherTongueName,rMaritalStatusName;
protected String membership_status;
protected String unique_code,emailverify,profileVerifyedBy;
protected String rEducationName,rOccupationName,rCountryName,rStateName,rHeightInches,rHeightToInches,religionId,castId;
protected int message_sent_status;
protected String  rCity,rCityName,country,state ,city,leaveMsgUserName,leaveMsgMail,leaveMsgMobile,leaveMsgText; 
protected String  referred_by;


public String getLeaveMsgUserName() {
	return leaveMsgUserName;
}
public void setLeaveMsgUserName(String leaveMsgUserName) {
	this.leaveMsgUserName = leaveMsgUserName;
}
public String getLeaveMsgMail() {
	return leaveMsgMail;
}
public void setLeaveMsgMail(String leaveMsgMail) {
	this.leaveMsgMail = leaveMsgMail;
}
public String getLeaveMsgMobile() {
	return leaveMsgMobile;
}
public void setLeaveMsgMobile(String leaveMsgMobile) {
	this.leaveMsgMobile = leaveMsgMobile;
}
public String getLeaveMsgText() {
	return leaveMsgText;
}
public void setLeaveMsgText(String leaveMsgText) {
	this.leaveMsgText = leaveMsgText;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
protected int shortlisted;


public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}
public String getrCityName() {
	return rCityName;
}
public void setrCityName(String rCityName) {
	this.rCityName = rCityName;
}
@Override
public String toString() {
	return "UsersBean [id=" + id + ", createdTime=" + createdTime + ", createdTimeAsString=" + createdTimeAsString
			+ ", updatedTime=" + updatedTime + ", last_ip=" + last_ip + ", roleId=" + roleId + ", username=" + username
			+ ", password=" + password + ", regPassword=" + regPassword + ", email=" + email + ", createProfileFor="
			+ createProfileFor + ", gender=" + gender + ", firstName=" + firstName + ", lastName=" + lastName + ", dob="
			+ dob + ", dob1=" + dob1 + ", religion=" + religion + ", motherTongue=" + motherTongue + ", currentCountry="
			+ currentCountry + ", currentState=" + currentState + ", currentCity=" + currentCity + ", maritalStatus="
			+ maritalStatus + ", caste=" + caste + ", gotram=" + gotram + ", star=" + star + ", dosam=" + dosam
			+ ", dosamName=" + dosamName + ", education=" + education + ", companyName=" + companyName
			+ ", annualIncome=" + annualIncome + ", monthlyIncome=" + monthlyIncome + ", diet=" + diet + ", smoking="
			+ smoking + ", drinking=" + drinking + ", height=" + height + ", heightName=" + heightName + ", bodyType="
			+ bodyType + ", complexion=" + complexion + ", mobile=" + mobile + ", aboutMyself=" + aboutMyself
			+ ", disability=" + disability + ", status=" + status + ", showall=" + showall + ", workingWith="
			+ workingWith + ", userId=" + userId + ", pageName=" + pageName + ", registerwith=" + registerwith
			+ ", branch=" + branch + ", statusName=" + statusName + ", occupation=" + occupation + ", rAgeFrom="
			+ rAgeFrom + ", rAgeTo=" + rAgeTo + ", rHeight=" + rHeight + ", rHeightTo=" + rHeightTo
			+ ", rMaritalStatus=" + rMaritalStatus + ", rReligion=" + rReligion + ", rCaste=" + rCaste
			+ ", rMotherTongue=" + rMotherTongue + ", haveChildren=" + haveChildren + ", rCountry=" + rCountry
			+ ", rState=" + rState + ", rEducation=" + rEducation + ", rWorkingWith=" + rWorkingWith + ", rOccupation="
			+ rOccupation + ", rAnnualIncome=" + rAnnualIncome + ", rCreateProfileFor=" + rCreateProfileFor + ", rDiet="
			+ rDiet + ", userrequirementId=" + userrequirementId + ", reTypedPassword=" + reTypedPassword
			+ ", fatherName=" + fatherName + ", motherName=" + motherName + ", fOccupation=" + fOccupation
			+ ", mOccupation=" + mOccupation + ", noOfBrothers=" + noOfBrothers + ", noOfSisters=" + noOfSisters
			+ ", noOfBrothersMarried=" + noOfBrothersMarried + ", noOfSistersMarried=" + noOfSistersMarried
			+ ", rhaveChildren=" + rhaveChildren + ", expressedInterest=" + expressedInterest + ", mobileNumViewed="
			+ mobileNumViewed + ", image=" + image + ", profileImage=" + profileImage + ", age=" + age
			+ ", paymentObject=" + paymentObject + ", casteName=" + casteName + ", religionName=" + religionName
			+ ", educationName=" + educationName + ", occupationName=" + occupationName + ", currentCityName="
			+ currentCityName + ", packageId=" + packageId + ", redirectPage=" + redirectPage + ", sentInterestCount="
			+ sentInterestCount + ", receivedInterestCount=" + receivedInterestCount + ", acceptedInterestCount="
			+ acceptedInterestCount + ", profileViewedCount=" + profileViewedCount + ", pendingRequestsCount="
			+ pendingRequestsCount + ", yetToBeViewedCount=" + yetToBeViewedCount + ", viewedNotContactedCount="
			+ viewedNotContactedCount + ", awaitingInterestCount=" + awaitingInterestCount + ", rejectedInterestCount="
			+ rejectedInterestCount + ", profilesViewedByMeCount=" + profilesViewedByMeCount + ", mobileNumViewedCount="
			+ mobileNumViewedCount + ", mobileNumViewedByMeCount=" + mobileNumViewedByMeCount + ", shortListedCount="
			+ shortListedCount + ", forEmail=" + forEmail + ", currentStateName=" + currentStateName
			+ ", currentCountryName=" + currentCountryName + ", motherTongueName=" + motherTongueName + ", starName="
			+ starName + ", heightInches=" + heightInches + ", complexionName=" + complexionName + ", bodyTypeName="
			+ bodyTypeName + ", page_no=" + page_no + ", total_records=" + total_records + ", OtpLimit=" + OtpLimit
			+ ", OtpStatus=" + OtpStatus + ", country_ids=" + country_ids + ", state_ids=" + state_ids
			+ ", last_login_time=" + last_login_time + ", weight=" + weight + ", fOccupationName=" + fOccupationName
			+ ", mOccupationName=" + mOccupationName + ", mail_content=" + mail_content + ", rReligionName="
			+ rReligionName + ", rCasteName=" + rCasteName + ", rDietName=" + rDietName + ", rMotherTongueName="
			+ rMotherTongueName + ", rMaritalStatusName=" + rMaritalStatusName + ", membership_status="
			+ membership_status + ", unique_code=" + unique_code + ", emailverify=" + emailverify
			+ ", profileVerifyedBy=" + profileVerifyedBy + ", rEducationName=" + rEducationName + ", rOccupationName="
			+ rOccupationName + ", rCountryName=" + rCountryName + ", rStateName=" + rStateName + ", rHeightInches="
			+ rHeightInches + ", rHeightToInches=" + rHeightToInches + ", religionId=" + religionId + ", castId="
			+ castId + ", message_sent_status=" + message_sent_status + ", rCity=" + rCity + ", rCityName=" + rCityName
			+ ", country=" + country + ", state=" + state + ", city=" + city + ", leaveMsgUserName=" + leaveMsgUserName
			+ ", leaveMsgMail=" + leaveMsgMail + ", leaveMsgMobile=" + leaveMsgMobile + ", leaveMsgText=" + leaveMsgText
			+ ", shortlisted=" + shortlisted + "]";
}
public String getCastId() {
	return castId;
}
public void setCastId(String castId) {
	this.castId = castId;
}
public String getReligionId() {
	return religionId;
}
public void setReligionId(String religionId) {
	this.religionId = religionId;
}
public String getProfileVerifyedBy() {
	return profileVerifyedBy;
}
public void setProfileVerifyedBy(String profileVerifyedBy) {
	this.profileVerifyedBy = profileVerifyedBy;
}
public String getEmailverify() {
	return emailverify;
}
public void setEmailverify(String emailverify) {
	this.emailverify = emailverify;
}
public String getRhaveChildren() {
	return rhaveChildren;
}
public void setRhaveChildren(String rhaveChildren) {
	this.rhaveChildren = rhaveChildren;
}
public String getFatherName() {
	return fatherName;
}
public void setFatherName(String fatherName) {
	this.fatherName = fatherName;
}
public String getMotherName() {
	return motherName;
}
public void setMotherName(String motherName) {
	this.motherName = motherName;
}
public String getfOccupation() {
	return fOccupation;
}
public void setfOccupation(String fOccupation) {
	this.fOccupation = fOccupation;
}
public String getmOccupation() {
	return mOccupation;
}
public void setmOccupation(String mOccupation) {
	this.mOccupation = mOccupation;
}
public String getNoOfBrothers() {
	return noOfBrothers;
}
public void setNoOfBrothers(String noOfBrothers) {
	this.noOfBrothers = noOfBrothers;
}
public String getNoOfSisters() {
	return noOfSisters;
}
public void setNoOfSisters(String noOfSisters) {
	this.noOfSisters = noOfSisters;
}
public String getNoOfBrothersMarried() {
	return noOfBrothersMarried;
}
public void setNoOfBrothersMarried(String noOfBrothersMarried) {
	this.noOfBrothersMarried = noOfBrothersMarried;
}
public String getNoOfSistersMarried() {
	return noOfSistersMarried;
}
public void setNoOfSistersMarried(String noOfSistersMarried) {
	this.noOfSistersMarried = noOfSistersMarried;
}
public int getUserrequirementId() {
	return userrequirementId;
}
public void setUserrequirementId(int userrequirementId) {
	this.userrequirementId = userrequirementId;
}
public String getrAgeFrom() {
	return rAgeFrom;
}
public void setrAgeFrom(String rAgeFrom) {
	this.rAgeFrom = rAgeFrom;
}
public String getrAgeTo() {
	return rAgeTo;
}
public void setrAgeTo(String rAgeTo) {
	this.rAgeTo = rAgeTo;
}
public String getrHeight() {
	return rHeight;
}
public void setrHeight(String rHeight) {
	this.rHeight = rHeight;
}
public String getrMaritalStatus() {
	return rMaritalStatus;
}
public void setrMaritalStatus(String rMaritalStatus) {
	this.rMaritalStatus = rMaritalStatus;
}
public String getrReligion() {
	return rReligion;
}
public void setrReligion(String rReligion) {
	this.rReligion = rReligion;
}
public String getrCaste() {
	return rCaste;
}
public void setrCaste(String rCaste) {
	this.rCaste = rCaste;
}
public String getrMotherTongue() {
	return rMotherTongue;
}
public void setrMotherTongue(String rMotherTongue) {
	this.rMotherTongue = rMotherTongue;
}
public String getHaveChildren() {
	return haveChildren;
}
public void setHaveChildren(String haveChildren) {
	this.haveChildren = haveChildren;
}
public String getrCountry() {
	return rCountry;
}
public void setrCountry(String rCountry) {
	this.rCountry = rCountry;
}
public String getrState() {
	return rState;
}
public void setrState(String rState) {
	this.rState = rState;
}
public String getrEducation() {
	return rEducation;
}
public void setrEducation(String rEducation) {
	this.rEducation = rEducation;
}
public String getrWorkingWith() {
	return rWorkingWith;
}
public void setrWorkingWith(String rWorkingWith) {
	this.rWorkingWith = rWorkingWith;
}
public String getrOccupation() {
	return rOccupation;
}
public void setrOccupation(String rOccupation) {
	this.rOccupation = rOccupation;
}
public String getrAnnualIncome() {
	return rAnnualIncome;
}
public void setrAnnualIncome(String rAnnualIncome) {
	this.rAnnualIncome = rAnnualIncome;
}
public String getrCreateProfileFor() {
	return rCreateProfileFor;
}
public void setrCreateProfileFor(String rCreateProfileFor) {
	this.rCreateProfileFor = rCreateProfileFor;
}
public String getrDiet() {
	return rDiet;
}
public void setrDiet(String rDiet) {
	this.rDiet = rDiet;
}
public String getOccupation() {
	return occupation;
}
public void setOccupation(String occupation) {
	this.occupation = occupation;
}
public String getStatusName() {
	return statusName;
}
public void setStatusName(String statusName) {
	this.statusName = statusName;
}
public String getBranch() {
	return branch;
}
public void setBranch(String branch) {
	this.branch = branch;
}
public String getRegisterwith() {
	return registerwith;
}
public void setRegisterwith(String registerwith) {
	this.registerwith = registerwith;
}
public String getPageName() {
	return pageName;
}
public void setPageName(String pageName) {
	this.pageName = pageName;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public Date getDob1() {
	return dob1;
}
public void setDob1(Date dob1) {
	this.dob1 = dob1;
}
public String getLast_ip() {
	return last_ip;
}
public void setLast_ip(String last_ip) {
	this.last_ip = last_ip;
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
public int getRoleId()
{
  return roleId;
}
public void setRoleId(final int roleId)
{
  this.roleId = roleId;
}
public String getUsername()
{
  return username;
}
public void setUsername(final String username)
{
  this.username = username;
}
public String getPassword()
{
  return password;
}
public void setPassword(final String password)
{
  this.password = password;
}
public String getEmail()
{
  return email;
}
public void setEmail(final String email)
{
  this.email = email;
}
public String getCreateProfileFor()
{
  return createProfileFor;
}
public void setCreateProfileFor(final String createProfileFor)
{
  this.createProfileFor = createProfileFor;
}
public String getGender()
{
  return gender;
}
public void setGender(final String gender)
{
  this.gender = gender;
}
public String getFirstName()
{
  return firstName;
}
public void setFirstName(final String firstName)
{
  this.firstName = firstName;
}
public String getLastName()
{
  return lastName;
}
public void setLastName(final String lastName)
{
  this.lastName = lastName;
}
public String getDob()
{
  return dob;
}
public void setDob(final String dob)
{
  this.dob = dob;
}
public String getReligion()
{
  return religion;
}
public void setReligion(final String religion)
{
  this.religion = religion;
}
public String getMotherTongue()
{
  return motherTongue;
}
public void setMotherTongue(final String motherTongue)
{
  this.motherTongue = motherTongue;
}
public String getCurrentCountry()
{
  return currentCountry;
}
public void setCurrentCountry(final String currentCountry)
{
  this.currentCountry = currentCountry;
}
public String getCurrentState()
{
  return currentState;
}
public void setCurrentState(final String currentState)
{
  this.currentState = currentState;
}
public String getCurrentCity()
{
  return currentCity;
}
public void setCurrentCity(final String currentCity)
{
  this.currentCity = currentCity;
}
public String getMaritalStatus()
{
  return maritalStatus;
}
public void setMaritalStatus(final String maritalStatus)
{
  this.maritalStatus = maritalStatus;
}
public String getCaste()
{
  return caste;
}
public void setCaste(final String caste)
{
  this.caste = caste;
}
public String getGotram()
{
  return gotram;
}
public void setGotram(final String gotram)
{
  this.gotram = gotram;
}
public String getStar()
{
  return star;
}
public void setStar(final String star)
{
  this.star = star;
}
public String getDosam()
{
  return dosam;
}
public void setDosam(final String dosam)
{
  this.dosam = dosam;
}
public String getDosamName()
{
  return dosamName;
}
public void setDosamName(final String dosamName)
{
  this.dosamName = dosamName;
}
public String getEducation()
{
  return education;
}
public void setEducation(final String education)
{
  this.education = education;
}
public String getWorkingWith()
{
  return workingWith;
}
public void setWorkingWith(final String workingWith)
{
  this.workingWith = workingWith;
}
public String getCompanyName()
{
  return companyName;
}
public void setCompanyName(final String companyName)
{
  this.companyName = companyName;
}
public String getAnnualIncome()
{
  return annualIncome;
}
public void setAnnualIncome(final String annualIncome)
{
  this.annualIncome = annualIncome;
}
public String getMonthlyIncome()
{
  return monthlyIncome;
}
public void setMonthlyIncome(final String monthlyIncome)
{
  this.monthlyIncome = monthlyIncome;
}
public String getDiet()
{
  return diet;
}
public void setDiet(final String diet)
{
  this.diet = diet;
}
public String getSmoking()
{
  return smoking;
}
public void setSmoking(final String smoking)
{
  this.smoking = smoking;
}
public String getDrinking()
{
  return drinking;
}
public void setDrinking(final String drinking)
{
  this.drinking = drinking;
}
public String getHeight()
{
  return height;
}
public void setHeight(final String height)
{
  this.height = height;
}
public String getBodyType()
{
  return bodyType;
}
public void setBodyType(final String bodyType)
{
  this.bodyType = bodyType;
}
public String getComplexion()
{
  return complexion;
}
public void setComplexion(final String complexion)
{
  this.complexion = complexion;
}
public String getMobile()
{
  return mobile;
}
public void setMobile(final String mobile)
{
  this.mobile = mobile;
}
public String getAboutMyself()
{
  return aboutMyself;
}
public void setAboutMyself(final String aboutMyself)
{
  this.aboutMyself = aboutMyself;
}
public String getDisability()
{
  return disability;
}
public void setDisability(final String disability)
{
  this.disability = disability;
}
public String getStatus()
{
  return status;
}
public void setStatus(final String status)
{
  this.status = status;
}
public String getShowall()
{
  return showall;
}
public void setShowall(final String showall)
{
  this.showall = showall;
}
public String getReTypedPassword() {
	return reTypedPassword;
}
public void setReTypedPassword(String reTypedPassword) {
	this.reTypedPassword = reTypedPassword;
}
public int getExpressedInterest() {
	return expressedInterest;
}
public void setExpressedInterest(int expressedInterest) {
	this.expressedInterest = expressedInterest;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public String getProfileImage() {
	return profileImage;
}
public void setProfileImage(String profileImage) {
	this.profileImage = profileImage;
}
public String getAge() {
	return age;
}
public void setAge(String age) {
	this.age = age;
}
public String getrHeightTo() {
	return rHeightTo;
}
public void setrHeightTo(String rHeightTo) {
	this.rHeightTo = rHeightTo;
}
public String getHeightName() {
	return heightName;
}
public void setHeightName(String heightName) {
	this.heightName = heightName;
}
public String getCasteName() {
	return casteName;
}
public void setCasteName(String casteName) {
	this.casteName = casteName;
}
public String getReligionName() {
	return religionName;
}
public void setReligionName(String religionName) {
	this.religionName = religionName;
}
public String getEducationName() {
	return educationName;
}
public void setEducationName(String educationName) {
	this.educationName = educationName;
}
public String getOccupationName() {
	return occupationName;
}
public void setOccupationName(String occupationName) {
	this.occupationName = occupationName;
}
public String getCurrentCityName() {
	return currentCityName;
}
public void setCurrentCityName(String currentCityName) {
	this.currentCityName = currentCityName;
}
public Paymenthistory getPaymentObject() {
	return paymentObject;
}
public void setPaymentObject(Paymenthistory paymentObject) {
	this.paymentObject = paymentObject;
}
public String getPackageId() {
	return packageId;
}
public void setPackageId(String packageId) {
	this.packageId = packageId;
}
public String getRedirectPage() {
	return redirectPage;
}
public void setRedirectPage(String redirectPage) {
	this.redirectPage = redirectPage;
}
public String getSentInterestCount() {
	return sentInterestCount;
}
public void setSentInterestCount(String sentInterestCount) {
	this.sentInterestCount = sentInterestCount;
}
public String getReceivedInterestCount() {
	return receivedInterestCount;
}
public void setReceivedInterestCount(String receivedInterestCount) {
	this.receivedInterestCount = receivedInterestCount;
}
public String getAcceptedInterestCount() {
	return acceptedInterestCount;
}
public void setAcceptedInterestCount(String acceptedInterestCount) {
	this.acceptedInterestCount = acceptedInterestCount;
}
public boolean isForEmail() {
	return forEmail;
}
public void setForEmail(boolean forEmail) {
	this.forEmail = forEmail;
}
public String getCurrentStateName() {
	return currentStateName;
}
public void setCurrentStateName(String currentStateName) {
	this.currentStateName = currentStateName;
}
public String getCurrentCountryName() {
	return currentCountryName;
}
public void setCurrentCountryName(String currentCountryName) {
	this.currentCountryName = currentCountryName;
}
public String getMotherTongueName() {
	return motherTongueName;
}
public void setMotherTongueName(String motherTongueName) {
	this.motherTongueName = motherTongueName;
}
public String getStarName() {
	return starName;
}
public void setStarName(String starName) {
	this.starName = starName;
}
public String getHeightInches() {
	return heightInches;
}
public void setHeightInches(String heightInches) {
	this.heightInches = heightInches;
}
public String getComplexionName() {
	return complexionName;
}
public void setComplexionName(String complexionName) {
	this.complexionName = complexionName;
}
public String getBodyTypeName() {
	return bodyTypeName;
}
public void setBodyTypeName(String bodyTypeName) {
	this.bodyTypeName = bodyTypeName;
}
public int getPage_no() {
	return page_no;
}
public void setPage_no(int page_no) {
	this.page_no = page_no;
}
public int getTotal_records() {
	return total_records;
}
public void setTotal_records(int total_records) {
	this.total_records = total_records;
}
public String getProfileViewedCount() {
	return profileViewedCount;
}
public void setProfileViewedCount(String profileViewedCount) {
	this.profileViewedCount = profileViewedCount;
}
public String getRejectedInterestCount() {
	return rejectedInterestCount;
}
public void setRejectedInterestCount(String rejectedInterestCount) {
	this.rejectedInterestCount = rejectedInterestCount;
}
public String getProfilesViewedByMeCount() {
	return profilesViewedByMeCount;
}
public void setProfilesViewedByMeCount(String profilesViewedByMeCount) {
	this.profilesViewedByMeCount = profilesViewedByMeCount;
}
public String getMobileNumViewedCount() {
	return mobileNumViewedCount;
}
public void setMobileNumViewedCount(String mobileNumViewedCount) {
	this.mobileNumViewedCount = mobileNumViewedCount;
}
public String getMobileNumViewedByMeCount() {
	return mobileNumViewedByMeCount;
}
public void setMobileNumViewedByMeCount(String mobileNumViewedByMeCount) {
	this.mobileNumViewedByMeCount = mobileNumViewedByMeCount;
}
public String getCreatedTimeAsString() {
	return createdTimeAsString;
}
public void setCreatedTimeAsString(String createdTimeAsString) {
	this.createdTimeAsString = createdTimeAsString;
}
public int getOtpLimit() {
	return OtpLimit;
}
public void setOtpLimit(int otpLimit) {
	OtpLimit = otpLimit;
}
public String getCountry_ids() {
	return country_ids;
}
public void setCountry_ids(String country_ids) {
	this.country_ids = country_ids;
}
public String getState_ids() {
	return state_ids;
}
public void setState_ids(String state_ids) {
	this.state_ids = state_ids;
}
public String getLast_login_time() {
	return last_login_time;
}
public void setLast_login_time(String last_login_time) {
	this.last_login_time = last_login_time;
}
public String getPendingRequestsCount() {
	return pendingRequestsCount;
}
public void setPendingRequestsCount(String pendingRequestsCount) {
	this.pendingRequestsCount = pendingRequestsCount;
}
public String getYetToBeViewedCount() {
	return yetToBeViewedCount;
}
public void setYetToBeViewedCount(String yetToBeViewedCount) {
	this.yetToBeViewedCount = yetToBeViewedCount;
}
public String getViewedNotContactedCount() {
	return viewedNotContactedCount;
}
public void setViewedNotContactedCount(String viewedNotContactedCount) {
	this.viewedNotContactedCount = viewedNotContactedCount;
}
public String getWeight() {
	return weight;
}
public void setWeight(String weight) {
	this.weight = weight;
}
public String getfOccupationName() {
	return fOccupationName;
}
public void setfOccupationName(String fOccupationName) {
	this.fOccupationName = fOccupationName;
}
public String getmOccupationName() {
	return mOccupationName;
}
public void setmOccupationName(String mOccupationName) {
	this.mOccupationName = mOccupationName;
}
public String getOtpStatus() {
	return OtpStatus;
}
public void setOtpStatus(String otpStatus) {
	OtpStatus = otpStatus;
}
public String getShortListedCount() {
	return shortListedCount;
}
public void setShortListedCount(String shortListedCount) {
	this.shortListedCount = shortListedCount;
}
public String getMail_content() {
	return mail_content;
}
public void setMail_content(String mail_content) {
	this.mail_content = mail_content;
}
public String getrReligionName() {
	return rReligionName;
}
public void setrReligionName(String rReligionName) {
	this.rReligionName = rReligionName;
}
public String getrCasteName() {
	return rCasteName;
}
public void setrCasteName(String rCasteName) {
	this.rCasteName = rCasteName;
}
public String getrDietName() {
	return rDietName;
}
public void setrDietName(String rDietName) {
	this.rDietName = rDietName;
}
public String getrMotherTongueName() {
	return rMotherTongueName;
}
public void setrMotherTongueName(String rMotherTongueName) {
	this.rMotherTongueName = rMotherTongueName;
}
public String getrMaritalStatusName() {
	return rMaritalStatusName;
}
public void setrMaritalStatusName(String rMaritalStatusName) {
	this.rMaritalStatusName = rMaritalStatusName;
}
public int getMobileNumViewed() {
	return mobileNumViewed;
}
public void setMobileNumViewed(int mobileNumViewed) {
	this.mobileNumViewed = mobileNumViewed;
}
public String getAwaitingInterestCount() {
	return awaitingInterestCount;
}
public void setAwaitingInterestCount(String awaitingInterestCount) {
	this.awaitingInterestCount = awaitingInterestCount;
}
public String getUnique_code() {
	return unique_code;
}
public void setUnique_code(String unique_code) {
	this.unique_code = unique_code;
}
public String getMembership_status() {
	return membership_status;
}
public void setMembership_status(String membership_status) {
	this.membership_status = membership_status;
}
public String getrEducationName() {
	return rEducationName;
}
public void setrEducationName(String rEducationName) {
	this.rEducationName = rEducationName;
}
public String getrOccupationName() {
	return rOccupationName;
}
public void setrOccupationName(String rOccupationName) {
	this.rOccupationName = rOccupationName;
}
public String getrCountryName() {
	return rCountryName;
}
public void setrCountryName(String rCountryName) {
	this.rCountryName = rCountryName;
}
public String getrStateName() {
	return rStateName;
}
public void setrStateName(String rStateName) {
	this.rStateName = rStateName;
}
public String getrHeightInches() {
	return rHeightInches;
}
public void setrHeightInches(String rHeightInches) {
	this.rHeightInches = rHeightInches;
}
public String getrHeightToInches() {
	return rHeightToInches;
}
public void setrHeightToInches(String rHeightToInches) {
	this.rHeightToInches = rHeightToInches;
}
public int getMessage_sent_status() {
	return message_sent_status;
}
public void setMessage_sent_status(int message_sent_status) {
	this.message_sent_status = message_sent_status;
}
public String getrCity() {
	return rCity;
}
public void setrCity(String rCity) {
	this.rCity = rCity;
}
public int getShortlisted() {
	return shortlisted;
}
public void setShortlisted(int shortlisted) {
	this.shortlisted = shortlisted;
}
public String getReferred_by() {
	return referred_by;
}
public void setReferred_by(String referred_by) {
	this.referred_by = referred_by;
}



}