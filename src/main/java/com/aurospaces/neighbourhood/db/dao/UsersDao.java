
package com.aurospaces.neighbourhood.db.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aurospaces.neighbourhood.bean.AutoCompleteBean;
import com.aurospaces.neighbourhood.bean.CastBean;
import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.HeightBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.MemberShipBean;
import com.aurospaces.neighbourhood.bean.ReligionBean;
import com.aurospaces.neighbourhood.bean.ReportsBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseUsersDao;
import com.aurospaces.neighbourhood.db.callback.RowValueCallbackHandler;
import com.aurospaces.neighbourhood.util.MatrimonyConstants;
import com.aurospaces.neighbourhood.util.MiscUtils;
import com.aurospaces.neighbourhood.util.SendSMS;





@Repository(value = "usersDao")
public class UsersDao extends BaseUsersDao
{
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	@Autowired HttpSession session;
	
	public UsersBean loginChecking(LoginBean objUsersBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from logincheckingview "
							+" where  AES_DECRYPT(PASSWORD,'mykey')= ? and  (email =? or username=? or mobile=? ) and status not in ('2')";
			List<Map<String,Object>> list = jdbcTemplate.queryForList("select * from users where AES_DECRYPT(PASSWORD,'mykey')= ? and  (email =? or username=? or mobile=? ) and status not in ('2')", new Object[]{objUsersBean.getPassword(),objUsersBean.getUserName(),objUsersBean.getUserName(),objUsersBean.getUserName()});
			if(list.size()==0){
				return null;
			}
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objUsersBean.getPassword(),objUsersBean.getUserName(),objUsersBean.getUserName(),objUsersBean.getUserName()},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	 
	 public UsersBean loginChecking(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
		 UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
		 if(sessionBean == null) // means call is from admin-->updated profiles
			 sessionBean = (UsersBean) session.getAttribute("cacheUserBean");
			String sql = "SELECT u.*,ureq.*,ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,  GROUP_CONCAT(uimg.image) as image, (select uimg.image from vuser_images uimg where uimg.user_id=u.id and uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
							+" cst.name as casteName, rel.name as religionName, edu.name as educationName, curcity.name as currentCityName ,"
							+" (select st.name from state st where st.id = u.currentState) as currentStateName ,"
							+" (select cntry.name from countries cntry where cntry.id = u.currentCountry) as currentCountryName, "
							+" (select lng.name from language lng where lng.id = u.motherTongue) as motherTongueName, "
							+" (select star.name from star where star.id = u.star) as starName, "
							+" (select dosham.name from dosham where dosham.id = u.dosam) as dosamName, "
							+" (select h.inches from height h where h.id = u.height) as heightInches, "
							+" (select comp.name from complexion comp where comp.id = u.complexion) as complexionName, "
							+" (select bt.name from body_type bt where bt.id = u.bodyType) as bodyTypeName, "
							+" occ.name as occupationName, "
							+" DATE_FORMAT(u.dob, '%d-%M-%Y') as dob, "
							+" u.dob as dob1, "
							+" date_format(last_login_time,'%d-%b-%Y %r') as last_login_time, "
							+" (select occup.name from occupation occup where occup.id = u.fOccupation) as fOccupationName, "
							+" (select occup.name from occupation occup where occup.id = u.mOccupation) as mOccupationName, "
							+" (select GROUP_CONCAT(rMaritalStatus) from vuserrequirement where userId = "+id+") as rMaritalStatusName, "
							+" (select GROUP_CONCAT(rel.name) from religion rel where find_in_set(rel.id,(select rReligion from vuserrequirement where userId = "+id+"))>0) as rReligionName, "
							+" (select GROUP_CONCAT(name) from cast where find_in_set(id,(select rCaste from vuserrequirement where userId = "+id+"))>0) as rCasteName, "
							+" (select GROUP_CONCAT(rDiet) from vuserrequirement where userId = "+id+") as rDietName, "
							+" (select GROUP_CONCAT(name) from language where find_in_set(id,(select rMotherTongue from vuserrequirement where userId = "+id+"))>0) as rMotherTongueName, "
							+" (select GROUP_CONCAT(name) from education where find_in_set(id,(select rEducation from vuserrequirement where userId = "+id+"))>0) as rEducationName, "
							+" (select GROUP_CONCAT(name) from occupation where find_in_set(id,(select rOccupation from vuserrequirement where userId = "+id+"))>0) as rOccupationName, "
							+" (select GROUP_CONCAT(name) from countries where find_in_set(id,(select rCountry from vuserrequirement where userId = "+id+"))>0) as rCountryName, "
							+" (select GROUP_CONCAT(name) from state where find_in_set(id,(select rState from vuserrequirement where userId = "+id+"))>0) as rStateName, "
							+" (select GROUP_CONCAT(name) from city where find_in_set(id,(select rCity from userrequirement where userId = "+id+"))>0) as rCityName, "
							+" (select h.inches from height h where h.id = (select ur.rHeight from vuserrequirement ur where ur.userId = "+id+")) as rHeightInches, "
							+" (select h.inches from height h where h.id = (select ur.rHeightTo from vuserrequirement ur where ur.userId = "+id+")) as rHeightToInches, "
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+sessionBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+sessionBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+sessionBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as shortlisted, "
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+sessionBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed "
							+" FROM users u left join user_images uimg on uimg.user_id=u.id left join userrequirement ureq on ureq.userId=u.id  "
							+" left join cast cst on cst.id=u.caste left join religion rel on rel.id=u.religion "
							+" left join education edu on edu.id=u.education left join occupation occ on occ.id=u.occupation left join city curcity on curcity.id=u.currentCity "
							+" where  u.id = ?";
		 	System.out.println(sql);
			List<Map<String,Object>> list = jdbcTemplate.queryForList("select * from users where id = ?", new Object[]{id});
			if(list.size()==0){
				return null;
			}
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	 public List<EducationBean> populate(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<EducationBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(EducationBean.class));
					return retlist;
		 }
	 public List<CastBean> getCastList(){
		 jdbcTemplate = custom.getJdbcTemplate();
		 List<CastBean> list = jdbcTemplate.query("select * from cast order by name asc ",ParameterizedBeanPropertyRowMapper.newInstance(CastBean.class));
			return list;
	 }
	 public List<ReligionBean> getReligionList(){
		 jdbcTemplate = custom.getJdbcTemplate();
		 List<ReligionBean> list = jdbcTemplate.query("select * from religion order by name asc ",ParameterizedBeanPropertyRowMapper.newInstance(ReligionBean.class));
			return list;
	 }
	 public List<EducationBean> getEducationList(){
		 jdbcTemplate = custom.getJdbcTemplate();
		 List<EducationBean> list = jdbcTemplate.query("select * from education order by name asc ",ParameterizedBeanPropertyRowMapper.newInstance(EducationBean.class));
			return list;
	 }
	 public List<HeightBean> populate1(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<HeightBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(HeightBean.class));
					return retlist;
		 }
	 public int getNewUserId(){
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "select max(id) from users";
			int maxId = jdbcTemplate.queryForInt(sql);
			return (maxId+1);
		}
	 public List<Map<String, String>> getAllProfiles1(UsersBean objUsersBean,String type){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			/*UsersBean objuserBean = (UsersBean) session.getAttribute("cacheUserBean");
			if(objuserBean != null){
				int roleId = objuserBean.getRoleId();*/
			
			/*buffer.append("select u.id,GROUP_CONCAT(uimg.image) as image, u.created_time,u.updated_time,u.role_id,r.role_name as rolename,u.username,u.password,"
					+ "u.email,u.name,u.sname,u.gender,u.height,h.inches as inches,h.cm as cm,u.mstatus,DATE_FORMAT(u.dob, '%d-%M-%Y') as dob,u.tob,u.pob,"
					+ "u.created_by,u.cast,c.name as castname,u.complexion,co.name as complexionName,u.mtongue,u.education,"
					+ "e.name as educationName,emply_type,fname,feducation,e1.name as fatherEducation,foccupation,"
					+ "oc1.name as fatherOccupation,mname,meducation,e2.name as motherEducation,moccupation,oc2."
					+ "name as motherOccupation,Address,country,cnt.name as countryName,u.mobile,u.branch,"
					+ "b.name as branchName,u.register_with,u.profile_pic_status,u.last_login,u.last_ip,u.status,"
					+ "ud.userdetailsId,ud.created_time as udcreated_time,ud.updated_time as udupdated_time,ud.userId,ud.executiveName,ud.SubCaste,ud.raasi,"
					+ "rs.name as raasiName,ud.star,st.name as starName,ud.padam,ud.gotram,ud.Religion,ud.sLanguages,"
					+ "lg.name as languageName,ud.aboutYourself,ud.educationDetails,ud.educationInfo,ud.Occupation,"
					+ "oc3.name as occupationName,ud.occupationDetails,ud.sinceWorking,ud.salaryperMonth,ud.salaryperyear,"
					+ "ud.foDetails,ud.ffName,ud.fnativeAddress,ud.mnativeAddress,ud.presentAddress,ud.phone1,ud.phone2,"
					+ "ud.landLine,ud.email2,ud.moDetails,ud.mfName,ud.sibilings,ud.property,ud.aboutFamily,ud.ncitizenOf,"
					+ "ct2.name as nriCitizenOf,ud.crCountry,ct3.name as currentCountry,ud.visaType,ud.stayingSince,"
					+ "ud.visaValidity,ud.ageGap,ud.rHeightFrom,ht2.inches as requiredHeightFrom,ud.rHeightTo,"
					+ "ht3.inches as requiredHeightTo,ud.rComplexion,co1.name as requiredComplexion,ud.rprofession,"
					+ "oc4.name as requiredOccupation,ud.maritalStatus from users u left join roles r on u.role_id=r.role_id "
					+ "left join height h on h.id=u.height left join cast c on c.id=u.cast left join complexion co on "
					+ "co.id=u.complexion left join education e on e.id=u.education left join education e1 on "
					+ "e1.id=u.feducation left join occupation oc1 on oc1.id =u.foccupation left join education e2 on "
					+ "e2.id=u.meducation left join occupation oc2 on oc2.id =u.moccupation left join countries cnt on "
					+ "cnt.id=u.country left join branch b on b.id=u.branch left join userdetails ud on u.id=ud.userId "
					+ "left join raasi rs on rs.id=ud.raasi left join star st on st.id=ud.star left join language lg on "
					+ "lg.id=ud.sLanguages left join occupation oc3 on oc3.id=ud.Occupation left join countries ct2 on "
					+ "ct2.id=ud.ncitizenOf left join countries ct3 on ct3.id=ud.crCountry left join height ht2 on "
					+ "ht2.id=rHeightFrom left join height ht3 on ht3.id=rHeightTo left join complexion co1 on "
					+ "co1.id=ud.rComplexion left join occupation oc4 on oc4.id=ud.rprofession left join user_images uimg on uimg.user_id=u.id where 1=1 ");
			
			if(type.equals("all")){
				buffer.append( " and u.status in( '1')" );
			}
			if(type.equals("delete")){
				buffer.append( " and u.status in( '2')" );
			}
			if(type.equals("inactive")){
				buffer.append( " and u.status in( '0')" );
			}
			if(type.equals("admin")){
				buffer.append( " and u.register_with is not null " );
			}
			if(type.equals("free")){
				buffer.append( " and u.role_id in ('4') " );
			}
			if(type.equals("premium")){
				buffer.append( " and u.role_id in ('6') " );
			}
			
			buffer.append(" group by u.id");
			String sql =buffer.toString();
			System.out.println(sql);
			
			RowValueCallbackHandler handler = new RowValueCallbackHandler(new String[] {"id","image","created_time","updated_time",
					"role_id","rolename","username","password","email","name","sname","gender","height","inches","cm",
					"mstatus","dob","tob","pob","created_by","cast","castname","complexion","complexionName","mtongue",
					"education","educationName","emply_type","fname","feducation","fatherEducation","foccupation",
					"fatherOccupation","mname","meducation","motherEducation","moccupation","motherOccupation","Address",
					"country","countryName","mobile","branch","branchName","register_with","profile_pic_status","last_login",
					"last_ip","status","userdetailsId","udcreated_time","udupdated_time","userId","executiveName","SubCaste",
					"raasi","raasiName","star","starName","padam","gotram","Religion","sLanguages","languageName",
					"aboutYourself","educationDetails","educationInfo","Occupation","occupationName","occupationDetails",
					"sinceWorking","salaryperMonth","salaryperyear","foDetails","ffName","fnativeAddress","mnativeAddress",
					"presentAddress","phone1","phone2","landLine","email2","moDetails","mfName","sibilings","property",
					"aboutFamily","ncitizenOf","nriCitizenOf","crCountry","currentCountry","visaType","stayingSince",
					"visaValidity","ageGap","rHeightFrom","requiredHeightFrom","rHeightTo","requiredHeightTo","rComplexion",
					"requiredComplexion","rprofession","requiredOccupation","maritalStatus"});
			jdbcTemplate.query(sql, handler);
			List<Map<String, String>> result = handler.getResult();
			return result;*/
			buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username,AES_DECRYPT( u.password,'mykey') as password, u.email, u.createProfileFor,u.gender, "
					+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
					+"u.currentState, u.currentCity, " 
					+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
					+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
					+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
					+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
					+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,floor((datediff(current_date(),u.dob))/365) as age, IFNULL(p.name, 'Free Register') as planPackage,u.profileVerifyedBy, "
					+" (select h.inches from height h where h.id = (select ur.rHeight from vuserrequirement ur where ur.userId = u.id)) as rHeightInches, "
					+" (select h.inches from height h where h.id = (select ur.rHeightTo from vuserrequirement ur where ur.userId = u.id)) as rHeightToInches ,u.package_id,"
					+ " DATE_FORMAT(u.created_time, '%d-%M-%Y') as created_time_str "
					+"from users u left join userrequirement ur on u.id=ur.userId "
					+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
					+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
					+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
					+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
					+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity left join package p on u.package_id = p.id "
					+" where 1=1  ");
								
								if(type.equals("all")){
									buffer.append( " and u.status in( '1') and u.role_id not in ('3')" );
								}
								if(type.equals("delete")){
									buffer.append( " and u.status in( '2') and u.role_id not in ('3')" );
								}
								if(type.equals("inactive")){
									buffer.append( " and u.status in( '0') and u.role_id not in (1,3) and "
											+" (select status from user_otps where user_id =u.id   and mobile_no = u.mobile order by user_otps.updated_time desc limit 1) is not null "
											+" and (select status from user_otps where user_id =u.id   and mobile_no = u.mobile order by user_otps.updated_time desc limit 1) <> '0' ");
								}
								if(type.equals("admin")){
									buffer.append( " and u.registerwith is not null " );
								}
								if(type.equals("free")){
									buffer.append( " and u.role_id in ('4') and "
											+" (select status from user_otps where user_id =u.id   and mobile_no = u.mobile order by user_otps.updated_time desc limit 1) is not null "
											+" and (select status from user_otps where user_id =u.id   and mobile_no = u.mobile order by user_otps.updated_time desc limit 1) <> '0' ");
								}
								if(type.equals("premium")){
									buffer.append( " and u.role_id in ('6') and u.status in ('1') " );
								}
								if(type.equals("premium_plus")){
									buffer.append( " and u.role_id in ('11') and u.status in ('1') " );
								}
								if(type.equals("classic")){
									buffer.append( " and u.role_id in ('12') and u.status in ('1') " );
								}
								if(type.equals("classic_plus")){
									buffer.append( " and u.role_id in ('13') and u.status in ('1') " );
								}
								if(type.equals("aarna_premium")){
									buffer.append( " and u.role_id in ('14') and u.status in ('1') " );
								}
								if(type.equals("LAUNCHING_OFFER")){
									buffer.append( " and u.role_id in ('15') and u.status in ('1') " );
								}
								if(type.equals("employee")){
									buffer.append( " and u.role_id in ('3') " );
								}
								if(type.equals("hidden")){
									buffer.append( " and u.status in( '3') and u.role_id not in ('3')" );
								}
								if(type.equals("undefined")){
									buffer.append( " and u.status in( '0') and u.role_id not in ('3','1') and "
											+" ((select status from user_otps where user_id =u.id   and mobile_no = u.mobile order by user_otps.updated_time desc limit 1) is  null "
											+" or (select status from user_otps where user_id =u.id   and mobile_no = u.mobile order by user_otps.updated_time desc limit 1) = '0') ");
								}
								UsersBean objuserBean = (UsersBean) session.getAttribute("cacheUserBean");
								if(objuserBean.getRoleId()==MatrimonyConstants.AARNA_EMPLOYEE_ROLE_ID){
									buffer.append( " and u.status in( '1') and u.role_id in ('4') and u.role_id not in ('3') group by u.id" );
									String sub_qry = "select (profiles_start_index-1) as start_index,profiles_size from users where id = "+objuserBean.getId();
									Map<String,Object> limit_values = jdbcTemplate.queryForMap(sub_qry);
									buffer.append(" order by u.id desc limit "+limit_values.get("profiles_size")+" offset "+limit_values.get("start_index")+" ");
								}else{
									buffer.append(" group by u.id order by u.created_time desc ");
								}
								
								String sql =buffer.toString();
								System.out.println(sql);
								
								RowValueCallbackHandler handler = new RowValueCallbackHandler(new String[] {"id","currentStateName","currentCityName","occupation","occupationName","educationName","userrequirementId","image","created_time","updated_time",
										"role_id","username","password","email","createProfileFor","gender","firstName","lastName","dob","religion","religionName","motherTongue","motherTongueName","currentCountry","currentCountryName",
										"currentState","currentCity","maritalStatus",
										"caste","casteName","gotram","star","starName","dosam","dosamName","education","workingWith","companyName","annualIncome",
										"monthlyIncome","diet","smoking","drinking","height","inches","cm",
										"bodyType","bodyTypeName","complexion","complexionName","mobile","aboutMyself","disability",
										"status","showall","userId","rAgeFrom","rAgeTo","rHeight","rMaritalStatus","rReligion","requiredReligionName","rCaste","requiredCasteName","rMotherTongue","requiredMotherTongue","haveChildren","rCountry","requiredCountry","rState","rEducation","requiredEducationName",
										"rWorkingWith","rOccupation","requiredOccupationName","rAnnualIncome","rCreateProfileFor","rDiet","dobString","age","planPackage","profileVerifyedBy","rHeightInches","rHeightToInches","package_id","created_time_str"});
								jdbcTemplate.query(sql, handler);
								List<Map<String, String>> result = handler.getResult();
								return result;
			/*}
			return new LinkedList<Map<String, String>>();*/
			
		}
	 /*public List<Map<String, String>> getProfilesFilteredByCast(String castValues){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheUserBean");
			if(objUserBean==null)
				objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
			
			
			
			buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
					+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
					+"u.currentState, u.currentCity, " 
					+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
					+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
					+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
					+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
					+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet from users u left join userrequirement ur on u.id=ur.userId "
					+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
					+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
					+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
					+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
					+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity "
					+" where 1=1  ");
								
								if(type.equals("all")){
									buffer.append( " and u.status in( '1')" );
								}
								if(type.equals("delete")){
									buffer.append( " and u.status in( '2')" );
								}
								if(type.equals("inactive")){
									buffer.append( " and u.status in( '0')" );
								}
								if(type.equals("admin")){
									buffer.append( " and u.registerwith is not null " );
								}
								if(type.equals("free")){
									buffer.append( " and u.role_id in ('4') " );
								}
								if(type.equals("premium")){
									buffer.append( " and u.role_id in ('6') " );
								}
								if(type.equals("hidden")){
									buffer.append( " and u.role_id in ('10') " );
								}
								if(StringUtils.isNotBlank(castValues))
									buffer.append(" and u.caste in ("+castValues+")  ");
								if(objUserBean.getRoleId()!=1){
									buffer.append(" and u.gender not in  ('"+objUserBean.getGender()+"') ");
									buffer.append(" and u.id not in  ("+objUserBean.getId()+") ");
								}
								buffer.append(" group by u.id ");
								String sql =buffer.toString();
								System.out.println(sql);
								
								RowValueCallbackHandler handler = new RowValueCallbackHandler(new String[] {"id","currentStateName","currentCityName","occupation","occupationName","educationName","userrequirementId","image","created_time","updated_time",
										"role_id","username","password","email","createProfileFor","gender","firstName","lastName","dob","religion","religionName","motherTongue","motherTongueName","currentCountry","currentCountryName",
										"currentState","currentCity","maritalStatus",
										"caste","casteName","gotram","star","starName","dosam","dosamName","education","workingWith","companyName","annualIncome",
										"monthlyIncome","diet","smoking","drinking","height","inches","cm",
										"bodyType","bodyTypeName","complexion","complexionName","mobile","aboutMyself","disability",
										"status","showall","userId","rAgeFrom","rAgeTo","rHeight","rMaritalStatus","rReligion","requiredReligionName","rCaste","requiredCasteName","rMotherTongue","requiredMotherTongue","haveChildren","rCountry","requiredCountry","rState","rEducation","requiredEducationName",
										"rWorkingWith","rOccupation","requiredOccupationName","rAnnualIncome","rCreateProfileFor","rDiet"});
								jdbcTemplate.query(sql, handler);
								List<Map<String, String>> result = handler.getResult();
								return result;
			}
			return new LinkedList<Map<String, String>>();
	 }*/
	 
	 public List<Map<String, String>> getProfilesFilteredByCast(String castValues,String religionValues,String educationValues,int page_no){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			StringBuffer where_clause = new StringBuffer(" where u.status in ('1') ");
			String handlerObj[] = null;
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheUserBean");
			if(objUserBean==null)
				objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				
				if(StringUtils.isNotBlank(castValues))
					where_clause.append(" and u.caste in ("+castValues+")  ");
				if(StringUtils.isNotBlank(religionValues))
					where_clause.append(" and u.religion in ("+religionValues+")  ");
				if(StringUtils.isNotBlank(educationValues))
					where_clause.append(" and u.education in ("+educationValues+")  ");
				if(objUserBean.getRoleId()!=1){
					where_clause.append(" and u.gender not in  ('"+objUserBean.getGender()+"') ");
					where_clause.append(" and u.id not in  ("+objUserBean.getId()+") ");
				}
				
				
				if(objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_USER || objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_PLUS_USER){
					
					buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
							+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
							+"u.currentState, u.currentCity, " 
							+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
							+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
							+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
							+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
							+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
							+ "ifnull(floor((datediff(current_date(),u.dob))/365),'') as age, DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString, "
							+" (select count(*) from users u "+where_clause+") as total_records, "
							+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and uimg.status = '1' and uimg.is_profile_picture='1') as profileImage "
							+" from users u left join userrequirement ur on u.id=ur.userId "
							+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
							+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
							+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
							+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
							+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity ");
					
					handlerObj = new String[] {"id","currentStateName","currentCityName","occupation","occupationName","educationName","userrequirementId","image","created_time","updated_time",
							"role_id","username","password","email","createProfileFor","gender","firstName","lastName","dob","religion","religionName","motherTongue","motherTongueName","currentCountry","currentCountryName",
							"currentState","currentCity","maritalStatus",
							"caste","casteName","gotram","star","starName","dosam","dosamName","education","workingWith","companyName","annualIncome",
							"monthlyIncome","diet","smoking","drinking","height","inches","cm",
							"bodyType","bodyTypeName","complexion","complexionName","mobile","aboutMyself","disability",
							"status","showall","userId","rAgeFrom","rAgeTo","rHeight","rMaritalStatus","rReligion","requiredReligionName","rCaste","requiredCasteName","rMotherTongue","requiredMotherTongue","haveChildren","rCountry","requiredCountry","rState","rEducation","requiredEducationName",
							"rWorkingWith","rOccupation","requiredOccupationName","rAnnualIncome","rCreateProfileFor","rDiet","expressedInterest","age","dobString","total_records","profileImage"};
				}else{
					buffer.append("select u.id,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.gender, "
							+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  " 
							+"u.maritalStatus, u.caste,c.name as casteName, u.education, " 
							+" u.height ,h.inches,h.cm, ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
							+" (select count(*) from users u "+where_clause+") as total_records "
							+" from users u left join "
							+" religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join  "
							+" cast c on c.id=u.caste left join height h on h.id=u.height left join "
							+"  occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
							+ " left join city cit on cit.id=u.currentCity ");
							//+" where 1=1  ");
					handlerObj = new String[] {"id","currentCityName","occupation","occupationName","educationName","created_time","updated_time",
							"role_id","username","password","email","gender","firstName","lastName","dob","religion","religionName","motherTongue","motherTongueName",
							"maritalStatus",
							"caste","casteName","education","height","inches","cm","age","dobString","total_records"};
				} 
			
			/*buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
					+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
					+"u.currentState, u.currentCity, " 
					+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
					+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
					+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
					+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
					+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet from users u left join userrequirement ur on u.id=ur.userId "
					+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
					+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
					+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
					+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
					+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity "
					+" where 1=1  ");*/
								
								/*if(type.equals("all")){
									buffer.append( " and u.status in( '1')" );
								}
								if(type.equals("delete")){
									buffer.append( " and u.status in( '2')" );
								}
								if(type.equals("inactive")){
									buffer.append( " and u.status in( '0')" );
								}
								if(type.equals("admin")){
									buffer.append( " and u.registerwith is not null " );
								}
								if(type.equals("free")){
									buffer.append( " and u.role_id in ('4') " );
								}
								if(type.equals("premium")){
									buffer.append( " and u.role_id in ('6') " );
								}
								if(type.equals("hidden")){
									buffer.append( " and u.role_id in ('10') " );
								}*/
								buffer.append(where_clause.toString());
								int page_size = MatrimonyConstants.PAGINATION_SIZE;
								buffer.append(" group by u.id ");
								buffer.append(" order by u.username limit "+page_size+" offset "+(page_no*page_size)+" ");
								String sql =buffer.toString();
								System.out.println(sql);
								
								RowValueCallbackHandler handler = new RowValueCallbackHandler(handlerObj);
								jdbcTemplate.query(sql, handler);
								List<Map<String, String>> result = handler.getResult();
								return result;
			}
			return new LinkedList<Map<String, String>>();
	 }
	 
	 /*public List<Map<String, String>> getProfilesFilteredByAge(String ageFrom,String ageTo,String education,String currentCity){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			String handlerObj[] = null;
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheUserBean");
			if(objUserBean==null)
				objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				if(objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_USER || objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_PLUS_USER){
					buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
							+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
							+"u.currentState, u.currentCity, " 
							+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
							+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
							+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
							+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
							+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
							+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id and interested='1') as expressedInterest, ifnull(u.age,'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString "
							+" from users u left join userrequirement ur on u.id=ur.userId "
							+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
							+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
							+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
							+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
							+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity "
							+" where 1=1 and u.id not in (select ei.profile_id from express_intrest ei where ei.user_id="+objUserBean.getId()+" and ei.mobile_no_viewed_status = '1') ");
					handlerObj = new String[] {"id","currentStateName","currentCityName","occupation","occupationName","educationName","userrequirementId","image","created_time","updated_time",
							"role_id","username","password","email","createProfileFor","gender","firstName","lastName","dob","religion","religionName","motherTongue","motherTongueName","currentCountry","currentCountryName",
							"currentState","currentCity","maritalStatus",
							"caste","casteName","gotram","star","starName","dosam","dosamName","education","workingWith","companyName","annualIncome",
							"monthlyIncome","diet","smoking","drinking","height","inches","cm",
							"bodyType","bodyTypeName","complexion","complexionName","mobile","aboutMyself","disability",
							"status","showall","userId","rAgeFrom","rAgeTo","rHeight","rMaritalStatus","rReligion","requiredReligionName","rCaste","requiredCasteName","rMotherTongue","requiredMotherTongue","haveChildren","rCountry","requiredCountry","rState","rEducation","requiredEducationName",
							"rWorkingWith","rOccupation","requiredOccupationName","rAnnualIncome","rCreateProfileFor","rDiet","expressedInterest","age","dobString"};
				}else{
					buffer.append("select u.id,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.gender, "
							+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  " 
							+"u.maritalStatus, u.caste,c.name as casteName, u.education, " 
							+" u.height ,h.inches,h.cm, ifnull(u.age,'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString  " 
							+" from users u left join "
							+" religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join  "
							+" cast c on c.id=u.caste left join height h on h.id=u.height left join "
							+"  occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
							+ " left join city cit on cit.id=u.currentCity "
							+" where 1=1  ");
					handlerObj = new String[] {"id","currentCityName","occupation","occupationName","educationName","created_time","updated_time",
							"role_id","username","password","email","gender","firstName","lastName","dob","religion","religionName","motherTongue","motherTongueName",
							"maritalStatus",
							"caste","casteName","education","height","inches","cm","age","dobString"};
				} 
			
			buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
					+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
					+"u.currentState, u.currentCity, " 
					+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
					+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
					+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
					+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
					+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet from users u left join userrequirement ur on u.id=ur.userId "
					+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
					+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
					+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
					+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
					+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity "
					+" where 1=1  ");
								
								if(type.equals("all")){
									buffer.append( " and u.status in( '1')" );
								}
								if(type.equals("delete")){
									buffer.append( " and u.status in( '2')" );
								}
								if(type.equals("inactive")){
									buffer.append( " and u.status in( '0')" );
								}
								if(type.equals("admin")){
									buffer.append( " and u.registerwith is not null " );
								}
								if(type.equals("free")){
									buffer.append( " and u.role_id in ('4') " );
								}
								if(type.equals("premium")){
									buffer.append( " and u.role_id in ('6') " );
								}
								if(type.equals("hidden")){
									buffer.append( " and u.role_id in ('10') " );
								}
								if(StringUtils.isNotBlank(ageFrom))
									buffer.append(" and cast(age as decimal(10,2)) >= "+ageFrom);
								if(StringUtils.isNotBlank(ageTo))
									buffer.append(" and cast(age as decimal(10,2)) <= "+ageTo);
								if(StringUtils.isNotBlank(education) && !education.equals("26"))
									buffer.append(" and if(u.education='26',"+education+",u.education) in ("+education+")  ");
								if(StringUtils.isNotBlank(currentCity))
									buffer.append(" and u.currentCity in ("+currentCity+")  ");
								if(objUserBean.getRoleId()!=1){
									buffer.append(" and u.gender not in  ('"+objUserBean.getGender()+"') ");
									buffer.append(" and u.id not in  ("+objUserBean.getId()+") ");
								}
								buffer.append(" group by u.id ");
								String sql =buffer.toString();
								System.out.println(sql);
								
								RowValueCallbackHandler handler = new RowValueCallbackHandler(handlerObj);
								jdbcTemplate.query(sql, handler);
								List<Map<String, String>> result = handler.getResult();
								return result;
			}
			return new LinkedList<Map<String, String>>();
	 }*/
	 
	 /*public boolean expressInterestTo(String profileId){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				try{
					int updated_count = 0;
					int existing_count = jdbcTemplate.queryForInt("select count(*) from express_intrest_view ei where ei.user_id="+objUserBean.getId()+" and ei.profile_id="+profileId);
					if(existing_count==0){
						buffer.append("insert into express_intrest(user_id,profile_id,interested,created_on,intrest_to,allowed_profiles_limit,status) values(?,?,?,?,?,?,'1')");
						updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{objUserBean.getId(),profileId,"1",
												new java.sql.Timestamp(new DateTime().getMillis()),profileId,MatrimonyConstants.PREMIUM_USER_PROFILES_LIMIT});
					}else if(existing_count>0){
						buffer.append("update express_intrest set interested = '1', status='1', created_on = ? where user_id = ? and profile_id = ? ");
						updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{new java.sql.Timestamp(new DateTime().getMillis()),objUserBean.getId(),profileId});
					}
					buffer = new StringBuffer();
					buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','interest_request',"+objUserBean.getId()+","+profileId+")");
					int inserted_count = jdbcTemplate.update(buffer.toString());
					buffer = new StringBuffer();
					buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','member',"+objUserBean.getId()+","+profileId+",'interest')");
					inserted_count = jdbcTemplate.update(buffer.toString());
					if(updated_count == 1){
						int allowed_profiles_limit = this.getAllowedProfilesLimit(objUserBean.getId());
						session.setAttribute("allowed_profiles_limit", allowed_profiles_limit);
						return true;
					}
					
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }*/
	 
	 @Transactional
	 public boolean expressInterestTo(String profileId){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				try{
					buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','interest_request',"+objUserBean.getId()+","+profileId+")");
					int inserted_count = jdbcTemplate.update(buffer.toString());
					buffer = new StringBuffer();
					buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','member',"+objUserBean.getId()+","+profileId+",'interest')");
					inserted_count = jdbcTemplate.update(buffer.toString());
					if(inserted_count == 1){
						String initial_profiles_limit = (String)session.getAttribute("allowed_profiles_limit");
						if(StringUtils.isNotBlank(initial_profiles_limit)){
							if(!"unlimited".equalsIgnoreCase(initial_profiles_limit)){
								String allowed_profiles_limit = this.getAllowedProfilesLimit(objUserBean.getId());
								session.setAttribute("allowed_profiles_limit", allowed_profiles_limit);
							}
						}
						return true;
					}
					
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }
	 
	 @Transactional
	 public boolean viewedProfile(String profileId){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			int inserted_count = 0;
			if(objUserBean!=null){
				try{
					String count_qry =  "select count(*) from users_activity_log where  act_done_by_user_id = "+objUserBean.getId()+" and  act_done_on_user_id = "+profileId+" and activity_type = 'profile_viewed' ";
					int viewed_cnt = jdbcTemplate.queryForInt(count_qry);
					if(viewed_cnt==0){
						buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
								+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','profile_viewed',"+objUserBean.getId()+","+profileId+")");
						inserted_count = jdbcTemplate.update(buffer.toString());
					}else{
						inserted_count = 1;
					}
					
						// also make an entry in notifications table
						if(!profileId.equals(objUserBean.getId())){
							count_qry =  "select count(*) from user_notifications where  user_id = "+objUserBean.getId()+" and  profile_id = "+profileId+" and read_status = '0' and user_type = 'member' and  notifi_type = 'profile_viewed'";
							int view_notified_cnt = jdbcTemplate.queryForInt(count_qry);
							if(view_notified_cnt==0){
								buffer = new StringBuffer();
								buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
										+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','member',"+objUserBean.getId()+","+profileId+",'profile_viewed')");
								jdbcTemplate.update(buffer.toString());
							}
						}
						
					if(inserted_count > 0){
						String qry = "select count(*) from  users u where u.id not in (select act_log.act_done_on_user_id from users_activity_log act_log where act_log.act_done_by_user_id = "+objUserBean.getId()+" and act_log.activity_type in ('profile_viewed')) "
								+" 	 and u.status in ('1') and u.role_id not in (1) and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+objUserBean.getId()+") ";
						int yet_to_view_cnt = jdbcTemplate.queryForInt(qry);
						/*qry = "select count(*) from users u where u.id in (select act.act_done_on_user_id from users_activity_log act where act.act_done_by_user_id="+objUserBean.getId()+" and act.act_done_on_user_id=u.id and act.activity_type = 'profile_viewed' ) "
								+" and u.id not in (select act.act_done_on_user_id from users_activity_log act where act.act_done_by_user_id="+objUserBean.getId()+" and act.act_done_on_user_id=u.id and act.activity_type in ('interest_request','message','mobile_no_viewed') ) "
								+" 	 and u.status in ('1') and u.role_id not in (1) and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+objUserBean.getId()+") ";*/ 
						int viewed_not_contacted_cnt = this.getViewedNotContactedCount(objUserBean);
						objUserBean.setYetToBeViewedCount(yet_to_view_cnt+"");
						objUserBean.setViewedNotContactedCount(viewed_not_contacted_cnt+"");
						session.setAttribute("cacheGuest",objUserBean);
					}
					return true;
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }
	 
	 /*public boolean shortlistProfile(String profileId){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				try{
					int existing_count = jdbcTemplate.queryForInt("select count(*) from express_intrest_view ei where ei.user_id="+objUserBean.getId()+" and ei.profile_id="+profileId+" ");
					if(existing_count==0){
						buffer.append("insert into express_intrest(user_id,profile_id,created_on,short_listed) values(?,?,?,?)");
						int inserted_count = jdbcTemplate.update(buffer.toString(), new Object[]{objUserBean.getId(),profileId,
												new java.sql.Timestamp(new DateTime().getMillis()),"1"});
						if(inserted_count==1)
							return true;
					}else if(existing_count>0){
						buffer.append("update express_intrest set short_listed = '1',created_on = ? where user_id = ? and profile_id = ?");
						int updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{new java.sql.Timestamp(new DateTime().getMillis()),objUserBean.getId(),profileId});
						if(updated_count==1)
							return true;
					}
					
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }*/
	 
	 public boolean shortlistProfile(String profileId){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				try{
					buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','short_listed',"+objUserBean.getId()+","+profileId+")");
					int inserted_count = jdbcTemplate.update(buffer.toString());
					buffer = new StringBuffer();
					buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','member',"+objUserBean.getId()+","+profileId+",'short_listed')");
					inserted_count = jdbcTemplate.update(buffer.toString());
					if(inserted_count==1)
						return true;
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }
	 
	/* @SuppressWarnings("deprecation")
	public boolean forwardInterestRequestss(String requestIds){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			
				try{
					int updated_count = jdbcTemplate.update("update express_intrest set status = '1' where find_in_set(id,'"+requestIds+"')>0");
					if(updated_count>0){
						return true;
					}
					return false;
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
	 }*/
	 
	 /*@SuppressWarnings("deprecation")
	public boolean acceptInterestRequests(String requestIds,String acceptFlag){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			String columnValue = acceptFlag.equals("1")?"2":"3";
			String activity_type = acceptFlag.equals("1")?"interest_accepted":"interest_rejected";
			if(objUserBean!=null){
				try{
					int updated_count = jdbcTemplate.update("update express_intrest set status = '"+columnValue+"' where find_in_set(id,'"+requestIds+"')>0");
					if(updated_count>0){
						buffer = new StringBuffer();
						buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
								+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','"+activity_type+"',"+objUserBean.getId()+",(select user_id from express_intrest where id = "+requestIds+"))");
						int inserted_count = jdbcTemplate.update(buffer.toString());
						buffer = new StringBuffer();
						buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
								+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','member',"+objUserBean.getId()+",(select user_id from express_intrest where id = "+requestIds+"),'"+activity_type+"')");
						inserted_count = jdbcTemplate.update(buffer.toString());
						return true;
					}
					return false;
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }*/
	 
	 @SuppressWarnings("deprecation")
	 @Transactional
		public boolean acceptInterestRequests(String requestIds,String acceptFlag){
				jdbcTemplate = custom.getJdbcTemplate();
				StringBuffer buffer = new StringBuffer();
				UsersBean objUserBean = null;
				objUserBean = (UsersBean) session.getAttribute("cacheGuest");
				String columnValue = acceptFlag.equals("1")?"1":"2";
				String activity_type = acceptFlag.equals("1")?"interest_accepted":"interest_rejected";
				if(objUserBean!=null){
					try{
						int updated_count = jdbcTemplate.update("update users_activity_log set activity_status = '"+columnValue+"' where find_in_set(id,'"+requestIds+"')>0");
						if(updated_count>0){
							buffer = new StringBuffer();
							buffer.append(" select act_done_by_user_id from users_activity_log where id = "+requestIds);
							String profile_id = jdbcTemplate.queryForObject(buffer.toString(), String.class);
							buffer = new StringBuffer();
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','"+activity_type+"',"+objUserBean.getId()+","+profile_id+")");
							int inserted_count = jdbcTemplate.update(buffer.toString());
							buffer = new StringBuffer();
							buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
									+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','member',"+objUserBean.getId()+","+profile_id+",'"+activity_type+"')");
							inserted_count = jdbcTemplate.update(buffer.toString());
							return true;
						}
						return false;
					}catch(Exception e){
						e.printStackTrace();
						return false;
					}
				}
				return false;
		 }
	 
	 /*public boolean acceptMessage(String requestIds,String acceptFlag){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			String columnValue = acceptFlag.equals("1")?"1":"3"; // 1-accepted  2-replied  3-rejected
			String activity_type = acceptFlag.equals("1")?"message_accepted":"message_rejected";
			if(objUserBean!=null){
				try{
					int updated_count = jdbcTemplate.update("update express_intrest set message_status = '"+columnValue+"' where find_in_set(id,'"+requestIds+"')>0");
					if(updated_count>0){
						buffer = new StringBuffer();
						buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
								+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','"+activity_type+"',"+objUserBean.getId()+",(select user_id from express_intrest where id = "+requestIds+"))");
						int inserted_count = jdbcTemplate.update(buffer.toString());
						buffer = new StringBuffer();
						buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
								+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','member',"+objUserBean.getId()+",(select user_id from express_intrest where id = "+requestIds+"),'"+activity_type+"')");
						inserted_count = jdbcTemplate.update(buffer.toString());
						return true;
					}
					return false;
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }*/
	 
	 @Transactional
	 public boolean acceptMessage(String requestIds,String acceptFlag){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			String columnValue = acceptFlag.equals("1")?"1":"3"; // 1-accepted  2-replied  3-rejected
			String activity_type = acceptFlag.equals("1")?"message_accepted":"message_rejected";
			if(objUserBean!=null){
				try{
					int updated_count = jdbcTemplate.update("update users_activity_log set activity_status = '"+columnValue+"' where find_in_set(id,'"+requestIds+"')>0");
					if(updated_count>0){
						buffer = new StringBuffer();
						buffer.append(" select act_done_by_user_id from users_activity_log where id = "+requestIds);
						String profile_id = jdbcTemplate.queryForObject(buffer.toString(), String.class);
						buffer = new StringBuffer();
						buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
								+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','"+activity_type+"',"+objUserBean.getId()+","+profile_id+")");
						int inserted_count = jdbcTemplate.update(buffer.toString());
						buffer = new StringBuffer();
						buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
								+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','member',"+objUserBean.getId()+","+profile_id+",'"+activity_type+"')");
						inserted_count = jdbcTemplate.update(buffer.toString());
						return true;
					}
					return false;
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }
	 
	 public boolean replyToMessage(String requestIds,String reply_content){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			String columnValue = "2"; // 1-accepted  2-replied  3-rejected
			String activity_type = "message_replied";
			if(objUserBean!=null){
				try{
					int updated_count = jdbcTemplate.update("update users_activity_log set activity_status = '"+columnValue+"' where find_in_set(id,'"+requestIds+"')>0");
					String select_qry = "select id from users_activity_log where act_done_on_user_id = (select act_done_by_user_id from users_activity_log where id = "+requestIds+") and act_done_by_user_id = (select act_done_on_user_id from users_activity_log where id = "+requestIds+") and activity_type in (	'message') and activity_status in ('1') order by created_time desc limit 1";
					int act_id = jdbcTemplate.queryForInt(select_qry);
						updated_count = jdbcTemplate.update("update users_activity_log set activity_status = '"+columnValue+"'  where id = "+act_id);
					if(updated_count>0){
						buffer = new StringBuffer();
						buffer.append(" select act_done_on_user_id from users_activity_log where id = "+requestIds);
						String profile_id = jdbcTemplate.queryForObject(buffer.toString(), String.class);
						buffer = new StringBuffer();
						buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id,activity_content) "
								+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','"+activity_type+"',"+objUserBean.getId()+","+profile_id+",'"+reply_content.trim()+"')");
						int inserted_count = jdbcTemplate.update(buffer.toString());
						buffer = new StringBuffer();
						buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
								+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','member',"+objUserBean.getId()+","+profile_id+",'"+activity_type+"')");
						inserted_count = jdbcTemplate.update(buffer.toString());
						return true;
					}
					return false;
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }
	 
	 public int getMobileNumViewedCount(String userId){
			jdbcTemplate = custom.getJdbcTemplate();
			
				try{
					int count = jdbcTemplate.queryForInt("select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userId+" and act_log.activity_type = 'mobile_no_viewed' group by act_log.act_done_on_user_id");
					return count;
					
				}catch(Exception e){
					e.printStackTrace();
					return 0;
				}
	 }
	 
	 /*@Transactional
	 public boolean viewMobileNumber(String profileId){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				try{
					int updated_count = 0;
					int existing_count = jdbcTemplate.queryForInt("select count(*) from express_intrest_view ei where ei.user_id="+objUserBean.getId()+" and ei.profile_id="+profileId+"");
					if(existing_count==0){
						buffer.append("insert into express_intrest(user_id,profile_id,mobile_no_viewed_status,created_on) values(?,?,?,?)");
						updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{objUserBean.getId(),profileId,"1",
								new java.sql.Timestamp(new DateTime().getMillis())});
						
					}else if(existing_count>0){
						buffer.append("update express_intrest set mobile_no_viewed_status = '1',created_on = ? where user_id = ? and profile_id = ?");
						updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{new java.sql.Timestamp(new DateTime().getMillis()),objUserBean.getId(),profileId});
					}
					// entry in activity log table
					buffer = new StringBuffer();
					buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','mobile_no_viewed',"+objUserBean.getId()+","+profileId+")");
					int inserted_count = jdbcTemplate.update(buffer.toString());
					buffer = new StringBuffer();
					buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','member',"+objUserBean.getId()+","+profileId+",'mobile_num_viewed')");
					inserted_count = jdbcTemplate.update(buffer.toString());
					if(updated_count == 1){
						int allowed_profiles_limit = this.getAllowedProfilesLimit(objUserBean.getId());
						//int allowed_profiles_limit = (Integer)session.getAttribute("allowed_profiles_limit");
						//session.removeAttribute("allowed_profiles_limit");
						session.setAttribute("allowed_profiles_limit", allowed_profiles_limit);
						return true;
					}
					
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }*/
	 
	 @Transactional
	 public boolean viewMobileNumber(String profileId){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				try{
					// entry in activity log table
					buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','mobile_no_viewed',"+objUserBean.getId()+","+profileId+")");
					int inserted_count = jdbcTemplate.update(buffer.toString());
					buffer = new StringBuffer();
					buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','member',"+objUserBean.getId()+","+profileId+",'mobile_num_viewed')");
					inserted_count = jdbcTemplate.update(buffer.toString());
					int updated_count = 0;
					if(inserted_count == 1){
						
						String initial_profiles_limit = (String)session.getAttribute("allowed_profiles_limit");
						if(StringUtils.isNotBlank(initial_profiles_limit)){
							if(!"unlimited".equalsIgnoreCase(initial_profiles_limit)){
								String allowed_profiles_limit = this.getAllowedProfilesLimit(objUserBean.getId());
								session.setAttribute("allowed_profiles_limit", allowed_profiles_limit);
							}
						}
						return true;
						
					}
					
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }
	 
	 /*@Transactional
	 public boolean sendMailMessage(String profileId,String mail_content,String default_text_option){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				try{
					int updated_count = 0;
					int existing_count = jdbcTemplate.queryForInt("select count(*) from express_intrest_view ei where ei.user_id="+objUserBean.getId()+" and ei.profile_id="+profileId+"");
					if(existing_count==0){
						if(default_text_option.equals("1")){
							String qry = "update express_intrest set default_text_option = '0' , mail_default_text = '' where user_id = "+objUserBean.getId();
							jdbcTemplate.update(qry);
							buffer.append("insert into express_intrest(user_id,profile_id,message_sent_status,created_on,default_text_option,mail_default_text) values(?,?,?,?,?,?)");
							updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{objUserBean.getId(),profileId,"1",
									new java.sql.Timestamp(new DateTime().getMillis()),default_text_option,mail_content});
						}else{
							buffer.append("insert into express_intrest(user_id,profile_id,message_sent_status,created_on) values(?,?,?,?)");
							updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{objUserBean.getId(),profileId,"1",
									new java.sql.Timestamp(new DateTime().getMillis())});
						}
						
						
					}else if(existing_count>0){
						if(default_text_option.equals("1")){
							String qry = "update express_intrest set default_text_option = '0' , mail_default_text = '' where user_id = "+objUserBean.getId();
							jdbcTemplate.update(qry);
							buffer.append("update express_intrest set message_sent_status = '1', message_status = '0', created_on = ? , default_text_option = ?, mail_default_text = ? where user_id = ? and profile_id = ?");
							updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{new java.sql.Timestamp(new DateTime().getMillis()),default_text_option,mail_content,objUserBean.getId(),profileId});
						}else{
							buffer.append("update express_intrest set message_sent_status = '1',message_status = '0', created_on = ?  where user_id = ? and profile_id = ?");
							updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{new java.sql.Timestamp(new DateTime().getMillis()),objUserBean.getId(),profileId});
						}
					}
					buffer = new StringBuffer();
					buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id,activity_content) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','message',"+objUserBean.getId()+","+profileId+",'"+mail_content+"')");
					int inserted_count = jdbcTemplate.update(buffer.toString());
					buffer = new StringBuffer();
					buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','member',"+objUserBean.getId()+","+profileId+",'mail')");
					inserted_count = jdbcTemplate.update(buffer.toString());
					if(updated_count == 1){
						int allowed_profiles_limit = this.getAllowedProfilesLimit(objUserBean.getId());
						//int allowed_profiles_limit = (Integer)session.getAttribute("allowed_profiles_limit");
						//session.removeAttribute("allowed_profiles_limit");
						session.setAttribute("allowed_profiles_limit", allowed_profiles_limit);
						return true;
					}
					
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }*/
	 
	 @Transactional
	 public boolean sendMailMessage(String profileId,String mail_content,String default_text_option){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				try{
					
					if(default_text_option.equals("1")){
						String qry = "update users_activity_log set set_as_mail_default_text = '0'  where act_done_by_user_id = "+objUserBean.getId()+" and set_as_mail_default_text = '1' ";
						jdbcTemplate.update(qry);
						buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id,activity_content,set_as_mail_default_text) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','message',"+objUserBean.getId()+","+profileId+",'"+mail_content+"','1')");
					}else{
						buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id,activity_content) "
								+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','message',"+objUserBean.getId()+","+profileId+",'"+mail_content+"')");
					}
					int inserted_count = jdbcTemplate.update(buffer.toString());
					buffer = new StringBuffer();
					buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','member',"+objUserBean.getId()+","+profileId+",'mail')");
					inserted_count = jdbcTemplate.update(buffer.toString());
					if(inserted_count == 1){
						String initial_profiles_limit = (String)session.getAttribute("allowed_profiles_limit");
						if(StringUtils.isNotBlank(initial_profiles_limit)){
							if(!"unlimited".equalsIgnoreCase(initial_profiles_limit)){
								String allowed_profiles_limit = this.getAllowedProfilesLimit(objUserBean.getId());
								session.setAttribute("allowed_profiles_limit", allowed_profiles_limit);
							}
						}
						return true;
					}
					
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }
	 
	 public List<Map<String, String>> getProfilesFilteredByPreferences(){
		 return this.getProfilesFilteredByPreferences(0);
	 }
	 
	 public List<Map<String, String>> getProfilesFilteredByPreferences(int page_no){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			StringBuffer where_clause = new StringBuffer(" where status in ('1') and role_id not in (1) ");
			String handlerObj[] = null;
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheUserBean");
			if(objUserBean==null)
				objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				
				//String tempQryStr = " from vuserrequirement ureq where ureq.userId = "+objUserBean.getId()+" ";
				where_clause.append( " and cast(floor((datediff(current_date(),dob))/365) as decimal(10,2)) >= if(ur.rAgeFrom='' or ur.rAgeFrom is null,floor((datediff(current_date(),dob))/365),ur.rAgeFrom) ");
				where_clause.append( " and cast(floor((datediff(current_date(),dob))/365) as decimal(10,2)) <= if(ur.rAgeTo='' or ur.rAgeTo is null,floor((datediff(current_date(),dob))/365),ur.rAgeTo) ");
				//buffer.append( " and age between (select ureq.rAgeFrom "+tempQryStr+") and (select ureq.rAgeTo "+tempQryStr+")  ") ;
				where_clause.append( " and cast(height as unsigned) >= cast(ifnull(if(ur.rHeight='' or ur.rHeight='all' or ur.rHeight is null,null,ur.rHeight),height) as unsigned )  ");
				where_clause.append( " and cast(height as unsigned) <= cast(ifnull(if(ur.rHeightTo='' or ur.rHeightTo='all' or ur.rHeightTo is null,null,ur.rHeightTo),height) as unsigned )   ");
				where_clause.append( " and FIND_IN_SET(maritalStatus,if(ur.rMaritalStatus='' or ur.rMaritalStatus='all' or ur.rMaritalStatus='any' or ur.rMaritalStatus is null,maritalStatus,ur.rMaritalStatus)) > 0       ");
				where_clause.append( " and FIND_IN_SET(caste,if(ur.rCaste='' or ur.rCaste='all' or ur.rCaste='any' or ur.rCaste is null,caste,ur.rCaste))>0    ");
				where_clause.append( " and FIND_IN_SET(currentCountry,if(ur.rCountry='' or ur.rCountry='all' or ur.rCountry='any' or ur.rCountry is null,currentCountry,ur.rCountry)) > 0   ");
				where_clause.append( " and FIND_IN_SET(education,if(ur.rEducation='' or ur.rEducation='all' or ur.rEducation='any'  or ur.rEducation is null,education,ur.rEducation)) > 0     ");
				where_clause.append( " and FIND_IN_SET(religion,if(ur.rReligion='' or ur.rReligion='all' or ur.rReligion='any'  or ur.rReligion is null,religion,ur.rReligion)) > 0    ");
				//buffer.append( " and occupation = ifnull((select ureq.rOccupation "+tempQryStr+"),occupation) ");
				
				if(objUserBean.getRoleId()!=1){
					where_clause.append(" and gender not in  ('"+objUserBean.getGender()+"') ");
					where_clause.append(" and id not in  ("+objUserBean.getId()+") ");
					//buffer.append(" and status not in  ('0') ");
				}
				
				if(objUserBean.getRoleId()==MatrimonyConstants.AARNA_PREMIUM_USER_ROLE_ID 
						|| objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_USER_ROLE_ID
						|| objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_PLUS_USER_ROLE_ID 
						|| objUserBean.getRoleId()==MatrimonyConstants.CLASSIC_USER_ROLE_ID
						|| objUserBean.getRoleId()==MatrimonyConstants.LAUNCHING_OFFER_ROLE_ID
						|| objUserBean.getRoleId()==MatrimonyConstants.CLASSIC_PLUS_USER_ROLE_ID){
					
					buffer.append("select vprofiles.*,"
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=vprofiles.id and act_log.activity_type = 'interest_request') as expressedInterest, "
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=vprofiles.id and act_log.activity_type = 'message') as message_sent_status, "
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=vprofiles.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
							//+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=id  and interested='1') as expressedInterest, "
							+" (select uimg.image from vuser_images uimg where uimg.user_id=vprofiles.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
							+" ifnull(floor((datediff(current_date(),dob))/365),'') as age,DATE_FORMAT(dob, '%d-%M-%Y') as dobString,  "
							+" (select count(1) from (select count(1) from vpreferred_profiles_paid_members vu, (select *  from userrequirement ur where ur.userId = "+objUserBean.getId()+") ur "+where_clause+" group by vu.id) temp) as total_records, createProfileFor,  "
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=vprofiles.id and act_log.activity_type = 'short_listed') as short_listed  "
							//+" (select uimg.image from vuser_images uimg where uimg.user_id=id and uimg.is_profile_picture='1') as profileImage "
							+" from vpreferred_profiles_paid_members vprofiles,(select *  from userrequirement ur where ur.userId = "+objUserBean.getId()+") ur ");
					handlerObj = new String[] {"id","currentStateName","currentCityName","occupation","occupationName","educationName","userrequirementId","image","created_time","updated_time",
							"role_id","username","password","email","createProfileFor","gender","firstName","lastName","dob","religion","religionName","motherTongue","motherTongueName","currentCountry","currentCountryName",
							"currentState","currentCity","maritalStatus",
							"caste","casteName","gotram","star","starName","dosam","dosamName","education","workingWith","companyName","annualIncome",
							"monthlyIncome","diet","smoking","drinking","height","inches","cm",
							"bodyType","bodyTypeName","complexion","complexionName","mobile","aboutMyself","disability",
							"status","showall","userId","rAgeFrom","rAgeTo","rHeight","rMaritalStatus","rReligion","requiredReligionName","rCaste","requiredCasteName","rMotherTongue","requiredMotherTongue","haveChildren","rCountry","requiredCountry","rState","rEducation","requiredEducationName",
							"rWorkingWith","rOccupation","requiredOccupationName","rAnnualIncome","rCreateProfileFor","rDiet","expressedInterest","message_sent_status","mobileNumViewed","age","dobString","total_records","profileImage","createProfileFor","short_listed"};
				}else{
					buffer.append("select vpreferred_profiles_free_members.*, "
							+" (select count(1) from (select count(1) from vpreferred_profiles_free_members vu, (select *  from userrequirement ur where ur.userId = "+objUserBean.getId()+") ur "+where_clause+" group by vu.id) temp) as total_records, "
							+" (select uimg.image from vuser_images uimg where uimg.user_id=id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, createProfileFor,  "
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=vpreferred_profiles_free_members.id and act_log.activity_type = 'short_listed') as short_listed, "
							+" '0' as expressedInterest, '0' as message_sent_status, '0' as mobileNumViewed "
							+" from vpreferred_profiles_free_members,(select *  from userrequirement ur where ur.userId = "+objUserBean.getId()+") ur ");
							//+" where u.status not in ('0')   ");
					handlerObj = new String[] {"id","currentCityName","occupation","occupationName","educationName","currentCountryName","created_time","updated_time",
							"role_id","username","password","email","gender","dob","religion","religionName","motherTongue","motherTongueName",
							"maritalStatus",
							"caste","casteName","education","height","inches","cm","age","dobString","total_records","profileImage","createProfileFor","short_listed","expressedInterest","message_sent_status","mobileNumViewed"};
				} 
				
				/*buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
						+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
						+"u.currentState, u.currentCity, " 
						+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
						+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
						+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
						+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
						+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
						+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id) as expressedInterest "
						+" from users u left join userrequirement ur on u.id=ur.userId "
						+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
						+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
						+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
						+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
						+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity "
						+" where 1=1  ");*/
			
					buffer.append(where_clause.toString());
					
					buffer.append(" group by id ");
					
					int page_size = MatrimonyConstants.PAGINATION_SIZE;
					buffer.append(" order by package_id desc limit "+page_size+" offset "+(page_no*page_size)+" ");
					
					
					/*}
					if(StringUtils.isNotBlank(objUserBean.getHeight()) && StringUtils.isNotBlank(objUserBean.getrHeight())){
						buffer.append( " and u.height between "+objUserBean.getHeight()+" and "+objUserBean.getrHeight()+ " ");
					}
					if(StringUtils.isNotBlank(objUserBean.getMaritalStatus()) && StringUtils.isNotBlank(objUserBean.getrHeight())){
						buffer.append( " and u.height between "+objUserBean.getHeight()+" and "+objUserBean.getrHeight()+ " ");
					}*/			
								/*if(type.equals("all")){
									buffer.append( " and u.status in( '1')" );
								}
								if(type.equals("delete")){
									buffer.append( " and u.status in( '2')" );
								}
								if(type.equals("inactive")){
									buffer.append( " and u.status in( '0')" );
								}
								if(type.equals("admin")){
									buffer.append( " and u.registerwith is not null " );
								}
								if(type.equals("free")){
									buffer.append( " and u.role_id in ('4') " );
								}
								if(type.equals("premium")){
									buffer.append( " and u.role_id in ('6') " );
								}
								if(type.equals("hidden")){
									buffer.append( " and u.role_id in ('10') " );
								}*/
								//buffer.append(" and u.caste in ("+castValues+")  ");
								
								String sql =buffer.toString();
//								System.out.println(sql);
								
								RowValueCallbackHandler handler = new RowValueCallbackHandler(handlerObj);
								jdbcTemplate.query(sql, handler);
								List<Map<String, String>> result = handler.getResult();
								return result;
			}
			return new LinkedList<Map<String, String>>();
	 }
	 
	 
	 public List<Map<String, String>> getSearchResults(UsersBean searchCriteriaBean,int page_no,String listType,Map<String,String> filterOptions){
		 return this.getSearchResults(searchCriteriaBean, page_no, listType, null, null, null,filterOptions);
	 }
	 
	 public List<Map<String, String>> getSearchResults(UsersBean searchCriteriaBean,int page_no,String listType){
		 return this.getSearchResults(searchCriteriaBean, page_no, listType, null, null, null,null);
	 }
	 
	 public List<Map<String, String>> getSearchResults(UsersBean searchCriteriaBean,int page_no,String listType,String withPhoto,String alreadyViewed,String alreadyContacted,Map<String,String> filterOptions){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			StringBuffer where_clause = new StringBuffer(" where u.role_id not in (1) and u.status in ('1') ");
			String handlerObj[] = null;
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheUserBean");
			if(objUserBean==null)
				objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				if(StringUtils.isNotBlank(searchCriteriaBean.getUsername()) && !("undefined".equalsIgnoreCase(searchCriteriaBean.getUsername()))){
					where_clause.append( " and upper(u.username) = upper('"+searchCriteriaBean.getUsername()+"')  ");
				}else{
					if(StringUtils.isNotBlank(searchCriteriaBean.getrAgeFrom())){
						
						where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) >= "+searchCriteriaBean.getrAgeFrom()+" ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrAgeTo())){
						where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) <= "+searchCriteriaBean.getrAgeTo()+" ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrHeight())){
						where_clause.append( " and cast(u.height as unsigned) >= cast('"+searchCriteriaBean.getrHeight()+"' as unsigned ) ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrHeightTo())){
						where_clause.append( " and cast(u.height as unsigned) <= cast('"+searchCriteriaBean.getrHeightTo()+"' as unsigned ) ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrMaritalStatus()) && !searchCriteriaBean.getrMaritalStatus().equalsIgnoreCase("null")){
						where_clause.append( " and  FIND_IN_SET(u.maritalStatus,'"+searchCriteriaBean.getrMaritalStatus()+"')>0    ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrReligion()) && !searchCriteriaBean.getrReligion().equalsIgnoreCase("null")){
						where_clause.append( " and FIND_IN_SET(u.religion,'"+searchCriteriaBean.getrReligion()+"')>0  ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrCaste()) && !searchCriteriaBean.getrCaste().equalsIgnoreCase("null")){
						where_clause.append( " and FIND_IN_SET(u.caste,'"+searchCriteriaBean.getrCaste()+"')>0  ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrMotherTongue()) && !searchCriteriaBean.getrMotherTongue().equalsIgnoreCase("null")){
						where_clause.append( " and FIND_IN_SET(u.motherTongue,'"+searchCriteriaBean.getrMotherTongue()+"' )>0  ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrEducation()) && !searchCriteriaBean.getrEducation().equalsIgnoreCase("null")){
						where_clause.append( " and FIND_IN_SET(u.education,'"+searchCriteriaBean.getrEducation()+"' )>0  ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrCountry()) && !searchCriteriaBean.getrCountry().equalsIgnoreCase("null")){
						where_clause.append( " and FIND_IN_SET(u.currentCountry,'"+searchCriteriaBean.getrCountry()+"' )>0  ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrState()) && !searchCriteriaBean.getrState().equalsIgnoreCase("null")){
						where_clause.append( " and FIND_IN_SET(u.currentState,'"+searchCriteriaBean.getrState()+"' )>0  ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrCity()) && !searchCriteriaBean.getrCity().equalsIgnoreCase("null")){
						where_clause.append( " and FIND_IN_SET(u.currentCity,'"+searchCriteriaBean.getrCity()+"' )>0  ");
					}
				}
				if(objUserBean.getRoleId()!=1){
					where_clause.append(" and u.gender not in  ('"+objUserBean.getGender()+"') ");
					where_clause.append(" and u.id not in  ("+objUserBean.getId()+") ");
				}
				
				// add checkboxes criteria also
				if(StringUtils.isNotBlank(withPhoto) && withPhoto.equalsIgnoreCase("true")){
					where_clause.append(" and u.id in (select umg.user_id from vuser_images umg where umg.is_profile_picture = '1' and umg.approved_status = '1') ");
				}
				if(StringUtils.isNotBlank(alreadyViewed) && alreadyViewed.equalsIgnoreCase("true")){
					where_clause.append(" and u.id not in(select act_done_on_user_id from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.activity_type = 'profile_viewed') ");
				}
				if(StringUtils.isNotBlank(alreadyContacted) && alreadyContacted.equalsIgnoreCase("true")){
					where_clause.append(" and u.id not in(select act_done_on_user_id from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+"  and act_log.activity_type in ('interest_request','message','mobile_no_viewed')) ");
				}
				// filter results options
				if(filterOptions != null){
					if(StringUtils.isNotBlank(filterOptions.get("with_photo")) && ((String)filterOptions.get("with_photo")).equalsIgnoreCase("true")){
						where_clause.append(" and u.id in (select umg.user_id from vuser_images umg where umg.is_profile_picture = '1' and umg.approved_status = '1') ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("with_in_day")) && ((String)filterOptions.get("with_in_day")).equalsIgnoreCase("true")){
						where_clause.append(" and u.created_time between date_add(now(), interval -1 day) and now() ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("with_in_week")) && ((String)filterOptions.get("with_in_week")).equalsIgnoreCase("true")){
						where_clause.append(" and u.created_time between date_add(now(), interval -1 week) and now() ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("with_in_month")) && ((String)filterOptions.get("with_in_month")).equalsIgnoreCase("true")){
						where_clause.append(" and u.created_time between date_add(now(), interval -1 month) and now() ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("created_at_any_time")) && ((String)filterOptions.get("created_at_any_time")).equalsIgnoreCase("true")){
						//where_clause.append(" and u.created_time between date_add(now(), interval -1 month) and now() ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("age_from"))){
						where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) >= "+filterOptions.get("age_from")+" ");
						where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) <= "+filterOptions.get("age_to")+" ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("marital_status"))){
						where_clause.append( " and  FIND_IN_SET(u.maritalStatus,'"+filterOptions.get("marital_status")+"')>0    ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("height_from"))){
						where_clause.append( " and cast(u.height as unsigned) >= cast('"+filterOptions.get("height_from")+"' as unsigned ) ");
						where_clause.append( " and cast(u.height as unsigned) <= cast('"+filterOptions.get("height_to")+"' as unsigned ) ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("mother_tongue"))){
						where_clause.append( " and FIND_IN_SET(u.motherTongue,'"+filterOptions.get("mother_tongue")+"' )>0  ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("caste")) && !((String)filterOptions.get("caste")).equalsIgnoreCase("null")){
						where_clause.append( " and FIND_IN_SET(u.caste,'"+filterOptions.get("caste")+"')>0  ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("education"))){
						where_clause.append( " and FIND_IN_SET(u.education,'"+filterOptions.get("education")+"' )>0  ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("occupation"))){
						where_clause.append( " and FIND_IN_SET(u.occupation,'"+filterOptions.get("occupation")+"' )>0  ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("annual_income"))){
						where_clause.append(" and FIND_IN_SET(u.annualIncome,'"+filterOptions.get("occupation")+"' )>0  ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("country"))){
						where_clause.append( " and FIND_IN_SET(u.currentCountry,'"+filterOptions.get("country")+"' )>0  ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("state"))){
						where_clause.append( " and FIND_IN_SET(u.currentState,'"+filterOptions.get("state")+"' )>0  ");
					}
					if(StringUtils.isNotBlank(filterOptions.get("city")) && !((String)filterOptions.get("city")).equalsIgnoreCase("null")){
						where_clause.append( " and FIND_IN_SET(u.currentCity,'"+filterOptions.get("city")+"' )>0  ");
					}
				}
				///
				if(objUserBean.getRoleId()==MatrimonyConstants.AARNA_PREMIUM_USER_ROLE_ID 
						|| objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_USER_ROLE_ID
						|| objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_PLUS_USER_ROLE_ID 
						|| objUserBean.getRoleId()==MatrimonyConstants.CLASSIC_USER_ROLE_ID
						|| objUserBean.getRoleId()==MatrimonyConstants.LAUNCHING_OFFER_ROLE_ID
						|| objUserBean.getRoleId()==MatrimonyConstants.CLASSIC_PLUS_USER_ROLE_ID){
					buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
							+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
							+"u.currentState, u.currentCity, " 
							+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
							+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
							+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
							+"rHeight,rHeightTo, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rCity,rEducation,e1.name as requiredEducationName, "
							+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
							//+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
							+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
							//+" (select count(*) from (select count(*) from users u left join user_images uimg on u.id = uimg.user_id "+where_clause+" group by u.id) tmp) as total_records, "
							+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, u.createProfileFor, "
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
							+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
							+" from users u left join userrequirement ur on u.id=ur.userId "
							+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
							+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
							+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
							+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
							+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity ");
							//+" where u.status not in ('0')   and u.id not in (select ei.profile_id from express_intrest ei where ei.user_id="+objUserBean.getId()+" and ei.mobile_no_viewed_status = '1')");
					handlerObj = new String[] {"id","currentStateName","currentCityName","occupation","occupationName","educationName","userrequirementId","image","created_time","updated_time",
							"role_id","username","password","email","createProfileFor","gender","firstName","lastName","dob","religion","religionName","motherTongue","motherTongueName","currentCountry","currentCountryName",
							"currentState","currentCity","maritalStatus",
							"caste","casteName","gotram","star","starName","dosam","dosamName","education","workingWith","companyName","annualIncome",
							"monthlyIncome","diet","smoking","drinking","height","inches","cm",
							"bodyType","bodyTypeName","complexion","complexionName","mobile","aboutMyself","disability",
							"status","showall","userId","rAgeFrom","rAgeTo","rHeight","rHeightTo","rMaritalStatus","rReligion","requiredReligionName","rCaste","requiredCasteName","rMotherTongue","requiredMotherTongue","haveChildren","rCountry","requiredCountry","rState","rCity","rEducation","requiredEducationName",
							"rWorkingWith","rOccupation","requiredOccupationName","rAnnualIncome","rCreateProfileFor","rDiet","expressedInterest","message_sent_status","mobileNumViewed","age","dobString","profileImage","createProfileFor","short_listed","profile_highlighter"};
				}else{
					where_clause.append(" and u.status in ('1')    ");
					buffer.append("select u.id,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.gender, "
							//+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  " 
							+" u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  "
							+"u.maritalStatus, u.caste,c.name as casteName, u.education, u.aboutMyself, " 
							+" u.height ,h.inches,h.cm, ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
							//+" (select count(*) from users u "+where_clause+") as total_records, "
							+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, u.createProfileFor, "
							+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
							+" '0' as expressedInterest, '0' as message_sent_status,'0' as mobileNumViewed, GROUP_CONCAT(uimg.image) as image,"
							+ " rAgeFrom, rAgeTo, "
							+"rHeight,rHeightTo, rMaritalStatus, rReligion, rCaste, rMotherTongue,rCountry , rState,rCity,rEducation, "
							+"rWorkingWith,rOccupation,rAnnualIncome,rCreateProfileFor,rDiet"
							+" from users u left join userrequirement ur on u.id=ur.userId left join "
							+" religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join  "
							+" cast c on c.id=u.caste left join height h on h.id=u.height left join "
							+"  occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
							+ " left join city cit on cit.id=u.currentCity  left join user_images uimg on uimg.user_id=u.id  ");
							//+" where u.status not in ('0')  ");
					handlerObj = new String[] {"id","currentCityName","occupation","occupationName","educationName","created_time","updated_time",
							"role_id","username","password","email","gender","dob","religion","religionName","motherTongue","motherTongueName",
							"maritalStatus",
							"caste","casteName","education","aboutMyself","height","inches","cm","age","dobString","profileImage","createProfileFor","short_listed","expressedInterest","message_sent_status","mobileNumViewed","image",
							"rAgeFrom","rAgeTo","rHeight","rHeightTo","rMaritalStatus","rReligion","rCaste","rMotherTongue","rCountry","rState","rCity","rEducation",
							"rWorkingWith","rOccupation","rAnnualIncome","rCreateProfileFor","rDiet"};
				} 
				
				/*buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
						+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
						+"u.currentState, u.currentCity, " 
						+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
						+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
						+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
						+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
						+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
						+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id) as expressedInterest "
						+" from users u left join userrequirement ur on u.id=ur.userId "
						+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
						+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
						+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
						+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
						+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity "
						+" where 1=1  ");*/
			
					/*String tempQryStr = " from vuserrequirement ureq where ureq.userId = "+objUserBean.getId()+" ";
					buffer.append( " and cast(u.age as decimal(10,2)) >= if((select ureq.rAgeFrom "+tempQryStr+")='' or (select ureq.rAgeFrom "+tempQryStr+") is null,u.age,(select ureq.rAgeFrom "+tempQryStr+"))");
					buffer.append( " and cast(u.age as decimal(10,2)) <= if((select ureq.rAgeTo "+tempQryStr+")='' or (select ureq.rAgeTo "+tempQryStr+") is null,u.age,(select ureq.rAgeTo "+tempQryStr+"))");
					//buffer.append( " and u.age between (select ureq.rAgeFrom "+tempQryStr+") and (select ureq.rAgeTo "+tempQryStr+")  ") ;
					buffer.append( " and cast(u.height as unsigned) >= cast(ifnull(if((select ureq.rHeight "+tempQryStr+" )='' or (select ureq.rHeight "+tempQryStr+" )='all' or (select ureq.rHeight  "+tempQryStr+" ) is null,null,(select ureq.rHeight  "+tempQryStr+" )),u.height) as unsigned ) ");
					buffer.append( " and cast(u.height as unsigned) <= cast(ifnull(if((select ureq.rHeightTo "+tempQryStr+" )='' or (select ureq.rHeightTo "+tempQryStr+" )='all' or (select ureq.rHeightTo  "+tempQryStr+" ) is null,null,(select ureq.rHeightTo  "+tempQryStr+" )),u.height) as unsigned ) ");
					buffer.append( " and  FIND_IN_SET(u.maritalStatus,if((select ureq.rMaritalStatus "+tempQryStr+" )='' or (select ureq.rMaritalStatus "+tempQryStr+" )='all' or (select ureq.rMaritalStatus  "+tempQryStr+" ) is null,u.maritalStatus,(select ureq.rMaritalStatus  "+tempQryStr+" ))) > 0    ");
					buffer.append( " and FIND_IN_SET(u.caste,if((select ureq.rCaste "+tempQryStr+" )='' or (select ureq.rCaste "+tempQryStr+" )='all' or (select ureq.rCaste  "+tempQryStr+" ) is null,u.caste,(select ureq.rCaste  "+tempQryStr+" )))>0  ");
					buffer.append( " and FIND_IN_SET(u.currentCountry,if((select ureq.rCountry "+tempQryStr+" )='' or (select ureq.rCountry "+tempQryStr+" )='all' or (select ureq.rCountry  "+tempQryStr+" ) is null,u.currentCountry,(select ureq.rCountry  "+tempQryStr+" ))) > 0 ");
					buffer.append( " and FIND_IN_SET(u.education,if((select ureq.rEducation "+tempQryStr+" )='' or (select ureq.rEducation "+tempQryStr+" )='all' or (select ureq.rEducation "+tempQryStr+" )='any'  or (select ureq.rEducation  "+tempQryStr+" ) is null,u.education,(select ureq.rEducation  "+tempQryStr+" ))) > 0  ");*/
					//buffer.append( " and u.occupation = ifnull((select ureq.rOccupation "+tempQryStr+"),u.occupation) ");
					
					
					buffer.append(where_clause);
					
					buffer.append(" group by u.id ");
					
					int page_size = MatrimonyConstants.PAGINATION_SIZE;
					/*if(StringUtils.isNotBlank("listType") && "newmatches".equalsIgnoreCase(listType)){
						buffer.append(" order by u.updated_time desc limit "+page_size+" offset "+(page_no*page_size)+" ");
					}else{*/
						buffer.append(" order by u.package_id desc limit "+page_size+" offset "+(page_no*page_size)+" ");
					//}
					
					/*if(objUserBean.getRoleId()==MatrimonyConstants.FREE_USER){
						buffer.append(" limit "+MatrimonyConstants.FREE_USER_PROFILES_LIMIT+" ");
					}else if(objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_USER){
						buffer.append(" limit "+MatrimonyConstants.PREMIUM_USER_PROFILES_LIMIT+" ");
					}else if(objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_PLUS_USER){
						//buffer.append(" limit "+page_size+" offset "+(page_no*page_size)+"  ");
					}*/
					
					/*}
					if(StringUtils.isNotBlank(objUserBean.getHeight()) && StringUtils.isNotBlank(objUserBean.getrHeight())){
						buffer.append( " and u.height between "+objUserBean.getHeight()+" and "+objUserBean.getrHeight()+ " ");
					}
					if(StringUtils.isNotBlank(objUserBean.getMaritalStatus()) && StringUtils.isNotBlank(objUserBean.getrHeight())){
						buffer.append( " and u.height between "+objUserBean.getHeight()+" and "+objUserBean.getrHeight()+ " ");
					}*/			
								/*if(type.equals("all")){
									buffer.append( " and u.status in( '1')" );
								}
								if(type.equals("delete")){
									buffer.append( " and u.status in( '2')" );
								}
								if(type.equals("inactive")){
									buffer.append( " and u.status in( '0')" );
								}
								if(type.equals("admin")){
									buffer.append( " and u.registerwith is not null " );
								}
								if(type.equals("free")){
									buffer.append( " and u.role_id in ('4') " );
								}
								if(type.equals("premium")){
									buffer.append( " and u.role_id in ('6') " );
								}
								if(type.equals("hidden")){
									buffer.append( " and u.role_id in ('10') " );
								}*/
								//buffer.append(" and u.caste in ("+castValues+")  ");
								
								String sql =buffer.toString();
//								System.out.println(sql);
								
								RowValueCallbackHandler handler = new RowValueCallbackHandler(handlerObj);
								jdbcTemplate.query(sql, handler);
								List<Map<String, String>> result = handler.getResult();
								int total_records = 0;
								if(result.size()>0){
									//get total records count
									String count_qry = "select count(1) from (select count(1) from users u left join user_images uimg on u.id = uimg.user_id "+where_clause+" group by u.id) tmp ";
									total_records = jdbcTemplate.queryForInt(count_qry);
									result.get(0).put("total_records", total_records+"");
								}
								return result;
			}
			return new LinkedList<Map<String, String>>();
	 }
	 
		public boolean updateStatus(UsersBean objUsersBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			boolean isStatusUpdate = false;
			try {
				String sSql = "update users set status = ? where id = ?";
				int iCount = jdbcTemplate.update(sSql,
						objUsersBean.getStatus(),
						objUsersBean.getId());
				if (iCount != 0) {
					isStatusUpdate = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {

			}
			return isStatusUpdate;
		}
		
		/*public boolean moveToHidden(UsersBean objUsersBean) {
			 jdbcTemplate = custom.getJdbcTemplate();
				boolean isStatusUpdate = false;
				try {
					String sSql = "update users set status = ? where id = ?";
					int iCount = jdbcTemplate.update(sSql,
							'3', //means hidden
							objUsersBean.getId());
					if (iCount != 0) {
						isStatusUpdate = true;
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {

				}
				return isStatusUpdate;
			}*/
		
		
		public boolean updatePassword(UsersBean objUsersBean) {
			 jdbcTemplate = custom.getJdbcTemplate();
				boolean updated = false;
				try {
					String sSql = "update users set password = AES_ENCRYPT(?,?) , updated_time = ? where id = ?";
					int updated_cnt = jdbcTemplate.update(sSql,
							objUsersBean.getPassword(),"mykey", new java.sql.Timestamp(new Date().getTime()),
							objUsersBean.getId());
					if (updated_cnt != 0) {
						updated = true;
					}
				} catch (Exception e) {
					e.printStackTrace();
					return updated;
				} finally {

				}
				return updated;
			}
		public boolean updateEmail(String email,int id) {
			 jdbcTemplate = custom.getJdbcTemplate();
				boolean updated = false;
				try {
					String sSql = "update users set email = ? where id = ?";
					int updated_cnt = jdbcTemplate.update(sSql,email,id	);
					System.out.println("fdsfdsaf:"+updated_cnt);
					if (updated_cnt != 0) {
						updated = true;
					}
				} catch (Exception e) {
					e.printStackTrace();
					return updated;
				} finally {

				}
				return updated;
			}
		public UsersBean emailExistOrNot(UsersBean  objUsersBean) {
			 jdbcTemplate = custom.getJdbcTemplate();
				String sql = "SELECT * FROM users where email= ? ";
				List<UsersBean> retlist = jdbcTemplate.query(sql,
				new Object[]{objUsersBean.getEmail()},
				ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
				if(retlist.size() > 0)
					return retlist.get(0);
				return null;
			}
		public UsersBean emailExistOrNot(String emailId) {
			 jdbcTemplate = custom.getJdbcTemplate();
				String sql = "SELECT * FROM users where email= ? ";
				List<UsersBean> retlist = jdbcTemplate.query(sql,
				new Object[]{emailId},
				ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
				if(retlist.size() > 0)
					return retlist.get(0);
				return null;
			}
		
		public boolean mobileNumExistOrNot(UsersBean  objUsersBean) {
			 jdbcTemplate = custom.getJdbcTemplate();
				String sql = "SELECT count(*) FROM users where mobile = ? and id not in ("+objUsersBean.getId()+")";
				int count = jdbcTemplate.queryForInt(sql,
						new Object[]{objUsersBean.getMobile()});
				if(count==0){
					return false;
				}
				return true;
			}
		
		public boolean autoCompleteSave(AutoCompleteBean objAutoCompleteBean){
			
			jdbcTemplate = custom.getJdbcTemplate();
			boolean isStatusUpdate = false;
			String tableName = null;
			String sSql  = null;
			String colum =objAutoCompleteBean.getId();
			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheGuest");
			int id =objuserBean.getId();
			int userdetailsId = objuserBean.getUserId();
			
			try {
				if(objAutoCompleteBean.getConstant().equals("u")){
					tableName = "users";
					 sSql = "update users set "+colum+" = ? where id = "+id;
				}
				if(objAutoCompleteBean.getConstant().equals("u1")){
					tableName = "userdetails";
					sSql = "update userdetails set "+colum+" = ? where userdetailsId = "+userdetailsId;
				}
//				String sSql = "update users set status = ? where id = ?";
				int iCount = jdbcTemplate.update(sSql,objAutoCompleteBean.getValue());
				if (iCount != 0) {
					isStatusUpdate = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {

			}
			return isStatusUpdate;
		}
		
		public boolean updateUserName(int userId, String cityId){
			
			jdbcTemplate = custom.getJdbcTemplate();
			String sSql  = null;
			
			try {
				
				sSql = "update users set username = concat('AM',(select city_code from city where id = "+cityId+"),'"+MiscUtils.generateRandomNumber(6)+"') where id = "+userId;
				
				int updated_count = jdbcTemplate.update(sSql);
				if (updated_count == 1) {
					return true;
				}
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			} finally {

			}
			return false;
		}
		
		public boolean updateMobileNumber(String userId, String mobileNum){
			
			jdbcTemplate = custom.getJdbcTemplate();
			String sSql  = null;
			
			try {
				
				sSql = "update users set mobile = '"+mobileNum+"' where id = "+userId;
				
				int updated_count = jdbcTemplate.update(sSql);
				if (updated_count == 1) {
					return true;
				}
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			} finally {

			}
			return false;
		}
		
		public List<Map<String,Object>>  getPaymentDetailsForPrint(String transactionId){
			jdbcTemplate = custom.getJdbcTemplate();
			try{
				String qryStr = "select pa.name as packageName, u.firstName,u.lastName,u.email,ph.price,ph.paymentStatus,ph.remarks,DATE_FORMAT(ph.updated_time, '%d-%M-%Y') as paymentDate,ph.txid as transactionId "
						+" from users u, paymenthistory ph,package pa  where ph.memberId = u.id and pa.price=ph.price and ph.txid = '"+transactionId+"' ";
				List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
				System.out.println("successPrint Query:"+qryStr);
				return list;
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}
			//return null;
		}
		
		/*public Map<String,Object> getInterestCounts(UsersBean objUserBean){
			jdbcTemplate = custom.getJdbcTemplate();
			int userId = objUserBean.getId();
			Map<String,Object> user_settings = (Map<String,Object>)session.getAttribute("user_settings");
			String inner_where_clause = " ei.user_id = u.id and ei.profile_id = "+userId+" and ((ei.interested = '1' and ei.status = '1') or (message_sent_status = '1' and message_status = '0')) and u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ";
			
			if(((String)user_settings.get("contact_filter")).equalsIgnoreCase("filter")){
				if(StringUtils.isNotBlank((String)user_settings.get("filter_age_from"))){
					inner_where_clause += " and ifnull(floor((datediff(current_date(),u.dob))/365),0) between "+user_settings.get("filter_age_from")+" and "+user_settings.get("filter_age_to")+" ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_marital_status"))){
					inner_where_clause += " and find_in_set(u.maritalStatus,'"+user_settings.get("filter_marital_status")+"')>0 ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_caste"))){
					inner_where_clause += " and find_in_set(u.caste,'"+user_settings.get("filter_caste")+"')>0 ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_religion"))){
					inner_where_clause += " and find_in_set(u.religion,'"+user_settings.get("filter_religion")+"')>0 ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_mothertongue"))){
					inner_where_clause += " and find_in_set(u.motherTongue,'"+user_settings.get("filter_mothertongue")+"')>0 ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_country"))){
					inner_where_clause += " and find_in_set(u.currentCountry,'"+user_settings.get("filter_country")+"')>0 ";
				}
			}
			String qryStr = "select (select count(*) from express_intrest_view where user_id = "+userId+" and interested = '1' and status in ('0','1')) as sentInterestCount, "
						+"(select count(*) from express_intrest_view where profile_id = "+userId+" and interested = '1' and status = '1') as receivedInterestCount, "
						+"(select count(*) from express_intrest_view where user_id = "+userId+" and status = '2') as acceptedInterestCount, "
						+"(select count(*) from express_intrest_view where profile_id = "+userId+" and profile_viewed_status = '1') as profileViewedCount";
			String subStr = "  u.status in ('1') and u.role_id not in (1) and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
			String qryStr= "select (select count(*) from  users u,express_intrest ei where u.id = ei.profile_id and ei.user_id = "+userId+" and ei.interested = '1' and ei.status in ('0','1','2','3') and "+subStr+" ) as sentInterestCount, " 
								+" (select count(*) from  users u,express_intrest ei where u.id = ei.profile_id and ei.user_id = "+userId+" and ei.interested = '1' and ei.status in ('0','1') and "+subStr+" ) as awaitingInterestCount, " 
								+" (select count(*) from  users u,express_intrest  ei where u.id = ei.user_id and  ei.profile_id = "+userId+" and ei.interested = '1' and ei.status in ('1','2','3') and "+subStr+" ) as receivedInterestCount, " 
								+" (select count(*) from  users u,express_intrest ei where u.id = ei.user_id and ei.profile_id = "+userId+" and ei.status = '2'  and "+subStr+" ) as acceptedInterestCount, "
								+" (select count(*) from  users u,express_intrest ei where u.id = ei.profile_id and ei.user_id = "+userId+" and ei.status = '3' and "+subStr+" ) as rejectedInterestCount, "
								+" (select count(*) from  users u,express_intrest  ei where u.id = ei.user_id and  ei.profile_id = "+userId+" and ei.profile_viewed_status = '1' and "+subStr+" ) as profileViewedCount, "
								+" (select count(*) from  users u,express_intrest ei where u.id = ei.profile_id and ei.user_id = "+userId+" and ei.profile_viewed_status = '1' and "+subStr+" ) as profilesViewedByMeCount, "
								+" (select count(*) from  users u,express_intrest  ei where u.id = ei.user_id and  ei.profile_id = "+userId+" and ei.mobile_no_viewed_status = '1' and "+subStr+" ) as mobileNumViewedCount, "
								+" (select count(*) from  users u,express_intrest ei where u.id = ei.profile_id and ei.user_id = "+userId+" and ei.mobile_no_viewed_status = '1' and "+subStr+" ) as mobileNumViewedByMeCount, "
								+" (select count(*) from  users u,express_intrest  ei where "+inner_where_clause+" ) as pendingRequestsCount, "
								+" (select count(*) from  users u where u.id not in (select ei.profile_id from express_intrest ei where ei.user_id = "+userId+" and ei.profile_viewed_status = '1') "
								+" 	 and "+subStr+"  ) as yetToBeViewedCount, "
								+" (select count(*) from users u,express_intrest ei where u.id=ei.profile_id and ei.user_id = "+userId+" and ei.profile_viewed_status = '1' and ei.mobile_no_viewed_status = '0' and ei.interested='0' "
								+"   and "+subStr+" ) as viewedNotContactedCount, "
								+" (select count(*) from  users u,express_intrest  ei where u.id = ei.user_id and ei.profile_id = "+userId+" and ei.short_listed = '1' and "+subStr+" ) as shortListedCount, "
								+" (select count(*) from user_notifications where profile_id = "+objUserBean.getId()+" and read_status = '0' and user_id in (select u.id from users u where u.id = user_id and u.status = '1' )) as notificationsCount,"
								+" (select count(*) from express_intrest_view ei where ei.user_id = "+objUserBean.getId()+" and ei.default_text_option = '1') as default_text_option, "
								+" (select mail_default_text from express_intrest ei where ei.user_id = "+objUserBean.getId()+" and ei.default_text_option = '1' group by ei.user_id ) as mail_default_text ";
					
			try{
				System.out.println(qryStr);
				List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
				if(list!=null)
					return list.get(0);
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}
			return null;
		}*/
		
		public Map<String,Object> getInterestCounts(UsersBean objUserBean){
			jdbcTemplate = custom.getJdbcTemplate();
			int userId = objUserBean.getId();
			Map<String,Object> user_settings = (Map<String,Object>)session.getAttribute("user_settings");
			String inner_where_clause = "  u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ";
			
			if(((String)user_settings.get("contact_filter")).equalsIgnoreCase("filter")){
				if(StringUtils.isNotBlank((String)user_settings.get("filter_age_from"))){
					inner_where_clause += " and ifnull(floor((datediff(current_date(),u.dob))/365),0) between "+user_settings.get("filter_age_from")+" and "+user_settings.get("filter_age_to")+" ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_marital_status"))){
					inner_where_clause += " and find_in_set(u.maritalStatus,'"+user_settings.get("filter_marital_status")+"')>0 ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_caste"))){
					inner_where_clause += " and find_in_set(u.caste,'"+user_settings.get("filter_caste")+"')>0 ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_religion"))){
					inner_where_clause += " and find_in_set(u.religion,'"+user_settings.get("filter_religion")+"')>0 ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_mothertongue"))){
					inner_where_clause += " and find_in_set(u.motherTongue,'"+user_settings.get("filter_mothertongue")+"')>0 ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_country"))){
					inner_where_clause += " and find_in_set(u.currentCountry,'"+user_settings.get("filter_country")+"')>0 ";
				}
			}
			/*String qryStr = "select (select count(*) from express_intrest_view where user_id = "+userId+" and interested = '1' and status in ('0','1')) as sentInterestCount, "
						+"(select count(*) from express_intrest_view where profile_id = "+userId+" and interested = '1' and status = '1') as receivedInterestCount, "
						+"(select count(*) from express_intrest_view where user_id = "+userId+" and status = '2') as acceptedInterestCount, "
						+"(select count(*) from express_intrest_view where profile_id = "+userId+" and profile_viewed_status = '1') as profileViewedCount";*/
			String subStr = "  u.status in ('1') and u.role_id not in (1) and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
			String qryStr= "select "
								+ "(select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userId+" and act_log.activity_type not in ('profile_viewed') ) as sentInterestCount, " 
								//+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userId+" and act_log.act_done_on_user_id=u.id and "+subStr+" ) as awaitingInterestCount, " 
								//+" (select count(*) from  users u,express_intrest  ei where u.id = ei.user_id and  ei.profile_id = "+userId+" and ei.interested = '1' and ei.status in ('1','2','3') and "+subStr+" ) as receivedInterestCount, " 
								//+" (select count(*) from  users u,express_intrest ei where u.id = ei.user_id and ei.profile_id = "+userId+" and ei.status = '2'  and "+subStr+" ) as acceptedInterestCount, "
								//+" (select count(*) from  users u,express_intrest ei where u.id = ei.profile_id and ei.user_id = "+userId+" and ei.status = '3' and "+subStr+" ) as rejectedInterestCount, "
								//+" (select count(*) from  users u,express_intrest  ei where u.id = ei.user_id and  ei.profile_id = "+userId+" and ei.profile_viewed_status = '1' and "+subStr+" ) as profileViewedCount, "
								//+" (select count(*) from  users u,express_intrest ei where u.id = ei.profile_id and ei.user_id = "+userId+" and ei.profile_viewed_status = '1' and "+subStr+" ) as profilesViewedByMeCount, "
								//+" (select count(*) from  users u,express_intrest  ei where u.id = ei.user_id and  ei.profile_id = "+userId+" and ei.mobile_no_viewed_status = '1' and "+subStr+" ) as mobileNumViewedCount, "
								//+" (select count(*) from  users u,express_intrest ei where u.id = ei.profile_id and ei.user_id = "+userId+" and ei.mobile_no_viewed_status = '1' and "+subStr+" ) as mobileNumViewedByMeCount, "
								+" (select count(*) from (select count(1) from users_activity_log act_log, users u where act_log.act_done_by_user_id=u.id and act_log.act_done_on_user_id="+userId+" and act_log.activity_type in ('interest_request','message') and act_log.activity_status in ('0') and "+inner_where_clause+" group by u.id) tc) as  pendingRequestsCount, "
								+" (select count(*) from  users u where u.id not in (select act_log.act_done_on_user_id from users_activity_log act_log where act_log.act_done_by_user_id = "+userId+" and act_log.activity_type in ('profile_viewed')) "
								+" 	 and "+subStr+"  ) as yetToBeViewedCount, "
								+" (select count(*) from users u where u.id in (select act.act_done_on_user_id from users_activity_log act where act.act_done_by_user_id="+userId+" and act.act_done_on_user_id=u.id and act.activity_type = 'profile_viewed' ) "
								+" and u.id not in (select act.act_done_on_user_id from users_activity_log act where act.act_done_by_user_id="+userId+" and act.act_done_on_user_id=u.id and act.activity_type in ('interest_request','message','mobile_no_viewed') ) "
								+" and "+subStr+" ) as viewedNotContactedCount, "
								//+" (select count(*) from  users u,express_intrest  ei where u.id = ei.user_id and ei.profile_id = "+userId+" and ei.short_listed = '1' and "+subStr+" ) as shortListedCount, "
								+" (select count(*) from user_notifications where profile_id = "+userId+" and read_status = '0' and user_id in (select u.id from users u where u.id = user_id and u.status = '1' )"
										+ " and if(notifi_type='short_listed',((select count(*) from user_settings us where us.user_id =user_notifications.user_id and us.know_shortlisted_option = '1')=1),1) "
										+" ) as notificationsCount,"
								+" (select set_as_mail_default_text from users_activity_log act_log where act_log.act_done_by_user_id = "+userId+" and act_log.set_as_mail_default_text = '1') as default_text_option, "
								+" (select activity_content from users_activity_log act_log where act_log.act_done_by_user_id = "+userId+" and act_log.set_as_mail_default_text = '1') as mail_default_text ";
					
			try{
//				System.out.println(qryStr);
				List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
				if(list!=null)
					return list.get(0);
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}
			return null;
		}
		
		public int getPendingInterestsCount(UsersBean objUserBean){
			jdbcTemplate = custom.getJdbcTemplate();
			int userId = objUserBean.getId();
			Map<String,Object> user_settings = (Map<String,Object>)session.getAttribute("user_settings");
			String inner_where_clause = "  u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ";
			
			if(((String)user_settings.get("contact_filter")).equalsIgnoreCase("filter")){
				if(StringUtils.isNotBlank((String)user_settings.get("filter_age_from"))){
					inner_where_clause += " and ifnull(floor((datediff(current_date(),u.dob))/365),0) between "+user_settings.get("filter_age_from")+" and "+user_settings.get("filter_age_to")+" ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_marital_status"))){
					inner_where_clause += " and find_in_set(u.maritalStatus,'"+user_settings.get("filter_marital_status")+"')>0 ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_caste"))){
					inner_where_clause += " and find_in_set(u.caste,'"+user_settings.get("filter_caste")+"')>0 ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_religion"))){
					inner_where_clause += " and find_in_set(u.religion,'"+user_settings.get("filter_religion")+"')>0 ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_mothertongue"))){
					inner_where_clause += " and find_in_set(u.motherTongue,'"+user_settings.get("filter_mothertongue")+"')>0 ";
				}
				if(StringUtils.isNotBlank((String)user_settings.get("filter_country"))){
					inner_where_clause += " and find_in_set(u.currentCountry,'"+user_settings.get("filter_country")+"')>0 ";
				}
			}
			/*String qryStr = "select (select count(*) from express_intrest_view where user_id = "+userId+" and interested = '1' and status in ('0','1')) as sentInterestCount, "
						+"(select count(*) from express_intrest_view where profile_id = "+userId+" and interested = '1' and status = '1') as receivedInterestCount, "
						+"(select count(*) from express_intrest_view where user_id = "+userId+" and status = '2') as acceptedInterestCount, "
						+"(select count(*) from express_intrest_view where profile_id = "+userId+" and profile_viewed_status = '1') as profileViewedCount";*/
			String subStr = "  u.status in ('1') and u.role_id not in (1) and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
			String qryStr= "select  (select count(*) from (select count(1) from users_activity_log act_log, users u where act_log.act_done_by_user_id=u.id and act_log.act_done_on_user_id="+userId+" and act_log.activity_type in ('interest_request','message') and act_log.activity_status in ('0') and "+inner_where_clause+" group by u.id) tc) as  pendingRequestsCount ";
					
			try{
				System.out.println(qryStr);
				int count = jdbcTemplate.queryForInt(qryStr);
				return count;
			}catch(Exception e){
				e.printStackTrace();
				return 0;
			}
		}
		
		public int getNotificationsCount(UsersBean objUserBean){
			jdbcTemplate = custom.getJdbcTemplate();
			int userId = objUserBean.getId();
			try{
				String qry = "select (select count(*) from user_notifications where profile_id = "+userId+" and read_status = '0' and user_id in (select u.id from users u where u.id = user_id and u.status = '1' ) "
						+ " and if(notifi_type='short_listed',((select count(*) from user_settings us where us.user_id =user_notifications.user_id and us.know_shortlisted_option = '1')=1),1) "
						+" ) as notificationsCount";
				int count = jdbcTemplate.queryForInt(qry);
				return count;
			}catch(Exception e){
				e.printStackTrace();
				return 0;
			}
		}
		
		public int getViewedNotContactedCount(UsersBean objUserBean){
			jdbcTemplate = custom.getJdbcTemplate();
			int userId = objUserBean.getId();
			try{
				String qry = "select (select count(*) from users u where u.id in (select act.act_done_on_user_id from users_activity_log act where act.act_done_by_user_id="+userId+" and act.act_done_on_user_id=u.id and act.activity_type = 'profile_viewed' ) "
								+" and u.id not in (select act.act_done_on_user_id from users_activity_log act where act.act_done_by_user_id="+userId+" and act.act_done_on_user_id=u.id and act.activity_type in ('interest_request','message','mobile_no_viewed') ) "
								+" and u.status in ('1') and u.role_id not in (1) and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ) as notificationsCount";
				int count = jdbcTemplate.queryForInt(qry);
				return count;
			}catch(Exception e){
				e.printStackTrace();
				return 0;
			}
		}
		
		public List<Map<String,Object>> getAllSubscribedUsersForWeeklyMatchEmails(){
			jdbcTemplate = custom.getJdbcTemplate();
			String qryStr = "select * from users where status = '1' and role_id not in (1) and id in (select us.user_id from user_settings us where us.weekly_matches_emails = '1') ";
			try{
				List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
				if(list!=null)
					return list;
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}
			return null;
		}
		
		public int getFreeMembersCount(){
			jdbcTemplate = custom.getJdbcTemplate();
			String qryStr = "select count(*) from users where role_id = "+MatrimonyConstants.FREE_USER_ROLE_ID+" and status = '1'";
			try{
				int free_users_count = jdbcTemplate.queryForInt(qryStr);
				return free_users_count;
			}catch(Exception e){
				e.printStackTrace();
				return 0;
			}
		}
		
		public List<Map<String,Object>> getEmployeesList(){
			jdbcTemplate = custom.getJdbcTemplate();
			String qryStr = "select * from users where role_id =  "+MatrimonyConstants.AARNA_EMPLOYEE_ROLE_ID+" and status = '1' order by profiles_start_index ";
			try{
				List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
					return list;
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}
		}
		
		public List<Map<String,Object>> getOldRequests(){
			jdbcTemplate = custom.getJdbcTemplate();
			String qryStr = "select * from express_intrest where date(created_on) < str_to_date('2018-04-03','%Y-%m-%d')";
			try{
				List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
					return list;
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}
		}
		
		public boolean createActivityLogEntry(String query){
			jdbcTemplate = custom.getJdbcTemplate();
			
			try{
				
				int updated_count = jdbcTemplate.update(query);
				if(updated_count == 1){
					return true;
				}
			}catch(Exception e){
				e.printStackTrace();
				return false;
			}
			return false;
		}
		
		public boolean updateEmployeeProfilesSlot(int user_id, int start_index, int size){
			jdbcTemplate = custom.getJdbcTemplate();
			String updateQry = "update users set profiles_start_index = "+start_index+"  , profiles_size = "+size+"   where id = "+user_id;
			try{
				int updated_count = jdbcTemplate.update(updateQry);
				if(updated_count == 1){
					return true;
				}
			}catch(Exception e){
				e.printStackTrace();
				return false;
			}
			return false;
		}
		
		public boolean rotateEmployeesProfilesSlot(int free_users_count){
			jdbcTemplate = custom.getJdbcTemplate();
			String updateQry = "update users set profiles_start_index = if((profiles_start_index+profiles_size)>"+free_users_count+",1,(profiles_start_index+profiles_size))  where  role_id =  "+MatrimonyConstants.AARNA_EMPLOYEE_ROLE_ID+" and status = '1'  ";
			try{
				int updated_count = jdbcTemplate.update(updateQry);
				if(updated_count > 0){
					return true;
				}
			}catch(Exception e){
				e.printStackTrace();
				return false;
			}
			return false;
		}
		
		public List<Map<String,Object>> getAllSubscribedUsersForDailyMatchEmails(){
			jdbcTemplate = custom.getJdbcTemplate();
			String qryStr = "select * from users where status = '1' and role_id not in (1) and id in (select us.user_id from user_settings us where us.daily_matches_emails = '1') ";
			try{
				List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
				if(list!=null)
					return list;
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}
			return null;
		}
		
		public List<Map<String, String>> getProfilesFilteredByPreferences(Map<String,Object> profile){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			String handlerObj[] = null;
			try{
			buffer.append("select u.id,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.gender, "
					+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  " 
					+"u.maritalStatus, u.caste,c.name as casteName, u.education, " 
					+" u.height ,h.inches,h.cm,u.annualIncome,cntry.name as countryName, ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString, u.createProfileFor, u.unique_code ,  "
					+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage "
					+" from users u left join "
					+" religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join  "
					+" cast c on c.id=u.caste left join height h on h.id=u.height left join "
					+"  occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
					+ " left join city cit on cit.id=u.currentCity left join countries cntry on cntry.id = u.currentCountry "
					+" where u.status  in ('1')  ");
					handlerObj = new String[] {"id","currentCityName","occupation","occupationName","educationName","created_time","updated_time",
							"role_id","username","password","email","gender","firstName","lastName","dob","religion","religionName","motherTongue","motherTongueName",
							"maritalStatus",
							"caste","casteName","education","height","inches","cm","annualIncome","countryName","age","dobString","createProfileFor","unique_code","profileImage"};
			
					String tempQryStr = " from vuserrequirement ureq where ureq.userId = "+profile.get("id")+" ";
					buffer.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) >= if((select ureq.rAgeFrom "+tempQryStr+")='' or (select ureq.rAgeFrom "+tempQryStr+") is null,floor((datediff(current_date(),u.dob))/365),(select ureq.rAgeFrom "+tempQryStr+"))");
					buffer.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) <= if((select ureq.rAgeTo "+tempQryStr+")='' or (select ureq.rAgeTo "+tempQryStr+") is null,floor((datediff(current_date(),u.dob))/365),(select ureq.rAgeTo "+tempQryStr+"))");
					buffer.append( " and cast(u.height as unsigned) >= cast(ifnull(if((select ureq.rHeight "+tempQryStr+" )='' or (select ureq.rHeight "+tempQryStr+" )='all' or (select ureq.rHeight  "+tempQryStr+" ) is null,null,(select ureq.rHeight  "+tempQryStr+" )),u.height) as unsigned ) ");
					buffer.append( " and cast(u.height as unsigned) <= cast(ifnull(if((select ureq.rHeightTo "+tempQryStr+" )='' or (select ureq.rHeightTo "+tempQryStr+" )='all' or (select ureq.rHeightTo  "+tempQryStr+" ) is null,null,(select ureq.rHeightTo  "+tempQryStr+" )),u.height) as unsigned ) ");
					buffer.append( " and  FIND_IN_SET(u.maritalStatus,if((select ureq.rMaritalStatus "+tempQryStr+" )='' or (select ureq.rMaritalStatus "+tempQryStr+" )='all' or (select ureq.rMaritalStatus  "+tempQryStr+" ) is null,u.maritalStatus,(select ureq.rMaritalStatus  "+tempQryStr+" ))) > 0    ");
					buffer.append( " and FIND_IN_SET(u.caste,if((select ureq.rCaste "+tempQryStr+" )='' or (select ureq.rCaste "+tempQryStr+" )='all' or (select ureq.rCaste  "+tempQryStr+" ) is null,u.caste,(select ureq.rCaste  "+tempQryStr+" )))>0  ");
					buffer.append( " and FIND_IN_SET(u.currentCountry,if((select ureq.rCountry "+tempQryStr+" )='' or (select ureq.rCountry "+tempQryStr+" )='all' or (select ureq.rCountry  "+tempQryStr+" ) is null,u.currentCountry,(select ureq.rCountry  "+tempQryStr+" ))) > 0 ");
					buffer.append( " and FIND_IN_SET(u.education,if((select ureq.rEducation "+tempQryStr+" )='' or (select ureq.rEducation "+tempQryStr+" )='all' or (select ureq.rEducation "+tempQryStr+" )='any'  or (select ureq.rEducation  "+tempQryStr+" ) is null,u.education,(select ureq.rEducation  "+tempQryStr+" ))) > 0  ");
					
					buffer.append(" and u.status in ('1') and u.gender not in  ('"+profile.get("gender")+"') ");
					buffer.append(" and u.id not in  ("+profile.get("id")+") and u.role_id not in (1) ");
					
					buffer.append(" group by u.id limit "+MatrimonyConstants.EMAIL_PROFILES_LIMIT);
					
								
					String sql =buffer.toString();
					System.out.println(sql);
					
					RowValueCallbackHandler handler = new RowValueCallbackHandler(handlerObj);
					jdbcTemplate.query(sql, handler);
					List<Map<String, String>> result = handler.getResult();
					return result;
			}catch(Exception e){
					e.printStackTrace();
					return null;
				}
			//return new LinkedList<Map<String, String>>();
	 }
		
	public List<Map<String,Object>> getUserPhotos(int userId){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select * from vuser_images where user_id = "+userId+" and status = '1' order by id desc";
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
			if(list!=null)
				return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public List<Map<String,Object>> getApprovedUserPhotos(int userId){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select id,image,approved_status,SUBSTRING_INDEX(image, '/', 1) AS folder_name,SUBSTRING_INDEX(SUBSTRING_INDEX(image, '/', 2), '/', -1) AS image_name from vuser_images where user_id = "+userId+" and status = '1' and approved_status = '1' order by is_profile_picture desc ";
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
			if(list!=null)
				return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	// called from admin login -- not being used
	/*public List<Map<String,Object>> getInterestRequests(int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select *,(select username from users where id=user_id) as fromName,(select username from users where id=profile_id) as toName,date_format(created_on,'%d-%M-%Y') as sentOn from express_intrest where interested = '1' order by created_on desc  ";
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
			if(list!=null)
				return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}*/
	
	/*public List<Map<String,Object>> getReceivedInterestRequests(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as fromName,date_format(created_on,'%d-%M-%Y') as receivedOn, "
				+" (select count(*) from express_intrest_view ei where ei.profile_id = "+userId+" and ei.interested = '1' and status = '1') as total_records "
				+" from express_intrest where profile_id = "+userId+" and interested = '1' and status = '1' order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " ei.user_id = u.id and ei.profile_id = "+userId+" and ei.interested = '1' and ei.status = '1' and u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select ei.id as requestId,u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from users u,express_intrest ei where "+inner_where_clause+") as total_records, "
				+" (select ifnull((select short_listed from express_intrest where user_id = "+objUserBean.getId()+" and profile_id = u.id),0)) as short_listed "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity,  "
				+"  express_intrest ei  where "+inner_where_clause+" ");
		
		//buffer.append(where_clause);
		buffer.append(" group by u.id ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by u.package_id desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null)
				return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}*/
	
	public List<Map<String,Object>> getPendingInterestRequests(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		Map<String,Object> user_settings = (Map<String,Object>)session.getAttribute("user_settings");
		StringBuffer buffer = new StringBuffer();
		
		//String inner_where_clause = " ei.user_id = u.id and ei.profile_id = "+userId+" and ((ei.interested = '1' and ei.status = '1') or (message_sent_status = '1' and message_status in ('0','2'))) and u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ";
		//StringBuffer where_clause = new StringBuffer(" temp.role_id not in (1) and temp.status in ('1') and temp.gender not in  ('"+objUserBean.getGender()+"') and temp.id not in  ("+userId+") ");
		StringBuffer inner_where_clause = new StringBuffer("  u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")  ");
		if(((String)user_settings.get("contact_filter")).equalsIgnoreCase("filter")){
			if(StringUtils.isNotBlank((String)user_settings.get("filter_age_from"))){
				inner_where_clause.append(" and ifnull(floor((datediff(current_date(),u.dob))/365),0) between "+user_settings.get("filter_age_from")+" and "+user_settings.get("filter_age_to")+" ");
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_marital_status"))){
				inner_where_clause.append(" and find_in_set(u.maritalStatus,'"+user_settings.get("filter_marital_status")+"')>0 ");
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_caste"))){
				inner_where_clause.append(" and find_in_set(u.caste,'"+user_settings.get("filter_caste")+"')>0 ");
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_religion"))){
				inner_where_clause.append(" and find_in_set(u.religion,'"+user_settings.get("filter_religion")+"')>0 ");
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_mothertongue"))){
				inner_where_clause.append(" and find_in_set(u.motherTongue,'"+user_settings.get("filter_mothertongue")+"')>0 ");
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_country"))){
				inner_where_clause.append(" and find_in_set(u.currentCountry,'"+user_settings.get("filter_country")+"')>0 ");
			}
		}
		//StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		/*buffer.append("select temp.*,ifnull(activity.activity_content,'') as  activity_content,max(activity.created_time) from"
				+ "(select (select ei.id from express_intrest_view ei where ei.user_id = u.id and ei.profile_id="+objUserBean.getId()+") as requestId,u.id,u.gender,sta.name as currentStateName,cit.name as currentCityName,u.occupation,ifnull(oc.name,'') as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and message_sent_status='1') as message_sent_status, "
				+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" (select count(*) from express_intrest_view intr where intr.user_id=u.id and intr.profile_id="+objUserBean.getId()+"  and mobile_no_viewed_status='1') as myMobileNumViewed, "
				+" (select count(*) from express_intrest_view intr where intr.user_id=u.id and intr.profile_id="+objUserBean.getId()+"  and message_sent_status='1') as message_sent_to_me, "
				+" (select count(*) from express_intrest_view intr where intr.user_id=u.id and intr.profile_id="+objUserBean.getId()+"  and short_listed='1') as shortListedMe, "
				+" (select count(*) from express_intrest_view intr where intr.user_id=u.id and intr.profile_id="+objUserBean.getId()+"  and profile_viewed_status='1') as myProfileViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(1) from (select count(1) from users u,express_intrest ei where "+inner_where_clause+" AND ei.user_id = u.id and ei.profile_id = "+userId+" and ((ei.interested = '1' and ei.status = '1') or (message_sent_status = '1' and message_status in ('0','2')))   group by u.id ) tc) as total_records, "
				+" (select ifnull((select short_listed from express_intrest where user_id = "+objUserBean.getId()+" and profile_id = u.id),0)) as short_listed, "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity,"
				+ " express_intrest ei where "+inner_where_clause+" and ei.user_id = u.id and ei.profile_id = "+userId+" and ((ei.interested = '1' and ei.status = '1') or (message_sent_status = '1' and message_status in ('0','2'))) group by u.id ) temp, "
				+" users_activity_log activity where activity.act_done_on_user_id  = "+objUserBean.getId()+" and activity.act_done_by_user_id = temp.id and activity.activity_type in ('interest_request','message','message_replied') ");
				//+"  express_intrest ei  where "+inner_where_clause+" ");
*/		
		
		buffer.append("select temp.*,activity.id as requestId,ifnull(activity.activity_content,'') as  activity_content,max(activity.created_time) "
				+ "  from "
				+ "(select u.id,u.gender,sta.name as currentStateName,cit.name as currentCityName,u.occupation,ifnull(oc.name,'') as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from (select count(1) from users u,users_activity_log act where "+inner_where_clause+" and act.act_done_by_user_id  = u.id and act.act_done_on_user_id = "+objUserBean.getId()+" and act.activity_type in ('interest_request','message') and act.activity_status in ('0')  group by u.id ) tc) as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity "
				+ " where "+inner_where_clause 
				+ " group by u.id) temp, "
				+" users_activity_log activity where activity.act_done_on_user_id  = "+objUserBean.getId()+" and activity.act_done_by_user_id = temp.id and activity.activity_type in ('interest_request','message') "
				+ " and activity.activity_status in ('0') ");
				//+"  express_intrest ei  where "+inner_where_clause+" ");
		//buffer.append(where_clause);
		buffer.append(" group by temp.id ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time) desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
				
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public List<Map<String,Object>> getFilteredRequests(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		Map<String,Object> user_settings = (Map<String,Object>)session.getAttribute("user_settings");
		StringBuffer buffer = new StringBuffer();
		
		String inner_where_clause = "  u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ";
		if(((String)user_settings.get("contact_filter")).equalsIgnoreCase("anyone")){
			return new LinkedList<Map<String,Object>>();
		}
		if(((String)user_settings.get("contact_filter")).equalsIgnoreCase("filter")){
			String inner_sub_str = "";
			if(StringUtils.isNotBlank((String)user_settings.get("filter_age_from"))){
				inner_sub_str += "or ifnull(floor((datediff(current_date(),u.dob))/365),0) < "+user_settings.get("filter_age_from")+" or ifnull(floor((datediff(current_date(),u.dob))/365),0) > "+user_settings.get("filter_age_to")+" ";
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_marital_status"))){
				inner_sub_str += "or find_in_set(u.maritalStatus,'"+user_settings.get("filter_marital_status")+"')=0 ";
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_caste"))){
				inner_sub_str += "or find_in_set(u.caste,'"+user_settings.get("filter_caste")+"')=0 ";
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_religion"))){
				inner_sub_str += "or find_in_set(u.religion,'"+user_settings.get("filter_religion")+"')=0 ";
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_mothertongue"))){
				inner_sub_str += "or find_in_set(u.motherTongue,'"+user_settings.get("filter_mothertongue")+"')=0 ";
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_country"))){
				inner_sub_str += "or find_in_set(u.currentCountry,'"+user_settings.get("filter_country")+"')=0 ";
			}
			if(StringUtils.isNotBlank(inner_sub_str)){
				inner_sub_str = inner_sub_str.substring(2);// to remove un-necessary starting string 'or'
				inner_where_clause += " and ("+inner_sub_str+")";
			}
		}
		
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select temp.*,activity.id as requestId,ifnull(activity.activity_content,'') as  activity_content,max(activity.created_time) "
				+ "  from "
				+" (select u.id,u.gender,sta.name as currentStateName,cit.name as currentCityName,u.occupation,ifnull(oc.name,'') as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from (select count(1) from users u,users_activity_log activity where activity.act_done_on_user_id  = "+objUserBean.getId()+" and activity.act_done_by_user_id = u.id and activity.activity_type in ('interest_request','message') and activity.activity_status in ('0') and "+inner_where_clause+" group by u.id ) tc) as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity  "
				+ " where "+inner_where_clause 
				+ " group by u.id) temp, "
				+" users_activity_log activity where activity.act_done_on_user_id  = "+objUserBean.getId()+" and activity.act_done_by_user_id = temp.id and activity.activity_type in ('interest_request','message') "
				+ " and activity.activity_status in ('0') ");

		
		//buffer.append(where_clause);
		buffer.append(" group by temp.id  ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time)  desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
				
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public List<Map<String,Object>> getProfileViewedMembers(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*String where_clause = "ei.user_id = u.id and ei.profile_id = "+userId+" and ei.profile_viewed_status = '1'";
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = "  u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")  ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select temp.*,activity.id as requestId,ifnull(activity.activity_content,'') as  activity_content,max(activity.created_time) "
				+ "  from "
				+" (select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(1) from users u,users_activity_log activity where activity.act_done_on_user_id  = "+objUserBean.getId()+" and activity.act_done_by_user_id = u.id and activity.activity_type in ('profile_viewed') and  "+inner_where_clause+") as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity  "
				+ " where "+inner_where_clause 
				+ " group by u.id) temp, "
				+" users_activity_log activity where activity.act_done_on_user_id  = "+objUserBean.getId()+" and activity.act_done_by_user_id = temp.id and activity.activity_type in ('profile_viewed') "
				+ "  ");

		
		//buffer.append(where_clause);
		buffer.append(" group by temp.id  ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time)  desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public List<Map<String,Object>> getShortlistedMeMembers(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*String where_clause = "ei.user_id = u.id and ei.profile_id = "+userId+" and ei.profile_viewed_status = '1'";
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") "
		 +" and ((select count(*) from user_settings us where us.user_id = u.id and us.know_shortlisted_option = '1')=1) ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select temp.*,activity.id as requestId,ifnull(activity.activity_content,'') as  activity_content,max(activity.created_time) "
				+ "  from "
				+"(select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from users u,users_activity_log activity where activity.act_done_on_user_id  = "+objUserBean.getId()+" and activity.act_done_by_user_id = u.id and activity.activity_type in ('short_listed') and "+inner_where_clause+") as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity  "
				+ " where "+inner_where_clause 
				+ " group by u.id) temp, "
				+" users_activity_log activity where activity.act_done_on_user_id  = "+objUserBean.getId()+" and activity.act_done_by_user_id = temp.id "
				+ "and activity.activity_type in ('short_listed') ");

		
		//buffer.append(where_clause);
		buffer.append(" group by temp.id ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time)  desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public List<Map<String,Object>> getShortlistedByMeMembers(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*String where_clause = "ei.user_id = u.id and ei.profile_id = "+userId+" and ei.profile_viewed_status = '1'";
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")  ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select temp.*,activity.id as requestId,ifnull(activity.activity_content,'') as  activity_content,max(activity.created_time) "
				+ "  from "
				+"(select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from (select count(1) from users u,users_activity_log activity where activity.act_done_by_user_id  = "+objUserBean.getId()+" and activity.act_done_on_user_id = u.id and activity.activity_type in ('short_listed') and "+inner_where_clause+" group by u.id) tc) as total_records, "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity  "
				+ " where "+inner_where_clause 
				+ " group by u.id) temp, "
				+" users_activity_log activity where activity.act_done_by_user_id  = "+objUserBean.getId()+" and activity.act_done_on_user_id = temp.id "
				+ " and activity.activity_type in ('short_listed') ");

		
		//buffer.append(where_clause);
		buffer.append(" group by temp.id  ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time)  desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public List<Map<String,Object>> getMyMobileNoViewedByMembers(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*String where_clause = "ei.user_id = u.id and ei.profile_id = "+userId+" and ei.profile_viewed_status = '1'";
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = "  u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")  ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select temp.*,activity.id as requestId,ifnull(activity.activity_content,'') as  activity_content,max(activity.created_time) "
				+ "  from "
				+"(select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from (select count(1) from users u,users_activity_log activity where "+inner_where_clause+" and activity.act_done_on_user_id  = "+objUserBean.getId()+" and activity.act_done_by_user_id = u.id and activity.activity_type in ('interest_request','message','mobile_no_viewed') group by u.id) tc) as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity  "
				+ " where "+inner_where_clause 
				+ " group by u.id) temp, "
				+" users_activity_log activity where activity.act_done_on_user_id  = "+objUserBean.getId()+" and activity.act_done_by_user_id = temp.id "
				+ " and activity.activity_type in ('interest_request','message','mobile_no_viewed') ");

		
		//buffer.append(where_clause);
		buffer.append(" group by temp.id  ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time)  desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public List<Map<String,Object>> getMobileNumViewedByMeList(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*String where_clause = "ei.user_id = u.id and ei.profile_id = "+userId+" and ei.profile_viewed_status = '1'";
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = "  u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select temp.*,activity.id as requestId,ifnull(activity.activity_content,'') as  activity_content,max(activity.created_time) "
				+ "  from "
				+"(select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from (select count(1) from users u,users_activity_log activity where activity.act_done_on_user_id  = u.id and activity.act_done_by_user_id = "+objUserBean.getId()+" and activity.activity_type in ('interest_request','message','mobile_no_viewed') and "+inner_where_clause+" group by u.id) tc) as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity  "
				+ " where "+inner_where_clause 
				+ " group by u.id) temp, "
				+" users_activity_log activity where activity.act_done_on_user_id  = temp.id and activity.act_done_by_user_id = "+objUserBean.getId()+" and "
						+ " activity.activity_type in ('interest_request','message','mobile_no_viewed') ");

		
		//buffer.append(where_clause);
		buffer.append(" group by temp.id  ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time)  desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	/****   accepted tab filter options      ****/
	public List<Map<String,Object>> getAcceptedRequestsByFilterCriteria(String userId, Map<String,String> acceptedByMap, Map<String,String> readStatusMap, Map<String,String> communicationTypeMap, int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		
		String activity_type_str = "";
		if(        (((String)communicationTypeMap.get("all")).equalsIgnoreCase("true"))
				|| (((String)communicationTypeMap.get("interests")).equalsIgnoreCase("true") && ((String)communicationTypeMap.get("messages")).equalsIgnoreCase("true") && ((String)communicationTypeMap.get("mobile_no_viewed")).equalsIgnoreCase("true"))
				|| (((String)communicationTypeMap.get("all")).equalsIgnoreCase("false")) && ((String)communicationTypeMap.get("interests")).equalsIgnoreCase("false") && ((String)communicationTypeMap.get("messages")).equalsIgnoreCase("false") && ((String)communicationTypeMap.get("mobile_no_viewed")).equalsIgnoreCase("false")){
			
			activity_type_str = " and activity_type in ('interest_accepted','message_accepted','message_replied') ";
			
		}else if(((String)communicationTypeMap.get("interests")).equalsIgnoreCase("true")
				|| ((String)communicationTypeMap.get("messages")).equalsIgnoreCase("true")
				|| ((String)communicationTypeMap.get("mobile_no_viewed")).equalsIgnoreCase("true")){
						String sub_str = "";
						if(((String)communicationTypeMap.get("interests")).equalsIgnoreCase("true")){
							sub_str += " or activity_type in ('interest_accepted') ";
						}
						if(((String)communicationTypeMap.get("messages")).equalsIgnoreCase("true")){
							sub_str += " or activity_type in ('message_accepted') ";
						}
						/*if(((String)communicationTypeMap.get("mobile_no_viewed")).equalsIgnoreCase("true")){
							sub_str += " or activity_type in ('mobile_no_viewed') ";
						}*/
						if(StringUtils.isNotBlank(sub_str)){
							sub_str = sub_str.substring(3);
							activity_type_str += " and ("+sub_str+") ";
						}
						
		}
		
		StringBuffer act_done_by_clause = new StringBuffer("  ");
		
		//String done_on_users = " select act.act_done_on_user_id from users_activity_log act where act.act_done_by_user_id = "+objUserBean.getId()+" "+activity_type_str+" ";
		//String done_by_users = " select act.act_done_by_user_id from users_activity_log act where act.act_done_on_user_id = "+objUserBean.getId()+" "+activity_type_str+" ";
		
		if(    (((String)acceptedByMap.get("accepted_by_me")).equalsIgnoreCase("true") && ((String)acceptedByMap.get("accepted_by_others")).equalsIgnoreCase("true"))
			|| (((String)acceptedByMap.get("accepted_by_me")).equalsIgnoreCase("false") && ((String)acceptedByMap.get("accepted_by_others")).equalsIgnoreCase("false"))){
			
			act_done_by_clause.append(" ((activity.act_done_by_user_id  = temp.id and activity.act_done_on_user_id = "+objUserBean.getId()+") or (activity.act_done_on_user_id  = temp.id and activity.act_done_by_user_id = "+objUserBean.getId()+")) ");
			
			//accepted_by_str = "  (activity.act_done_by_user_id = "+objUserBean.getId()+" or  activity.act_done_on_user_id = "+objUserBean.getId()+") ";
		}else if(((String)acceptedByMap.get("accepted_by_me")).equalsIgnoreCase("true")){
			
			act_done_by_clause.append(" (activity.act_done_on_user_id  = temp.id and activity.act_done_by_user_id = "+objUserBean.getId()+")");
			//accepted_by_str = "  activity.act_done_by_user_id = "+objUserBean.getId()+" ";
		}else if(((String)acceptedByMap.get("accepted_by_others")).equalsIgnoreCase("true")){
			
			act_done_by_clause.append(" (activity.act_done_by_user_id  = temp.id and activity.act_done_on_user_id = "+objUserBean.getId()+")");
			//accepted_by_str = "  activity.act_done_on_user_id = "+objUserBean.getId()+" ";
		}
		
		
		
		
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
		//StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select temp.*,activity.id as requestId,ifnull(activity.activity_content,'') as  activity_content,max(activity.created_time) "
				+ "  from "
				+ "(select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from (select count(1) from users u,users_activity_log activity where "+inner_where_clause+" and "+act_done_by_clause.toString().replaceAll("temp.id", "u.id")+"  "+activity_type_str+"  group by u.id ) tc) as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=id and act_log.activity_type = 'short_listed') as short_listed,  "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				//+" from users_activity_log activity left join users u on activity.act_done_on_user_id=u.id left join userrequirement ur on u.id=ur.userId "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity "
				+ " where "+inner_where_clause 
				+ " group by u.id) temp, "
				+" users_activity_log activity where "+act_done_by_clause+" "
				+ " "+activity_type_str+"  ");

				//+"  express_intrest ei  where "+inner_where_clause+" ");
		
		//buffer.append(" WHERE "+accepted_by_str+" "+activity_type_str+" GROUP BY u.id  ");
		buffer.append("  GROUP BY temp.id   ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time)  desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	/****   rejected tab filter options      ****/
	public List<Map<String,Object>> getRejectedRequestsByFilterCriteria(String userId, Map<String,String> rejectedByMap, Map<String,String> readStatusMap, Map<String,String> communicationTypeMap, int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		
		String activity_type_str = "";
		if(        (((String)communicationTypeMap.get("all")).equalsIgnoreCase("true"))
				|| (((String)communicationTypeMap.get("interests")).equalsIgnoreCase("true") && ((String)communicationTypeMap.get("messages")).equalsIgnoreCase("true") && ((String)communicationTypeMap.get("mobile_no_viewed")).equalsIgnoreCase("true"))
				|| (((String)communicationTypeMap.get("all")).equalsIgnoreCase("false")) && ((String)communicationTypeMap.get("interests")).equalsIgnoreCase("false") && ((String)communicationTypeMap.get("messages")).equalsIgnoreCase("false") && ((String)communicationTypeMap.get("mobile_no_viewed")).equalsIgnoreCase("false")){
			
			activity_type_str = " and activity_type in ('interest_rejected','message_rejected') ";
			
		}else if(((String)communicationTypeMap.get("interests")).equalsIgnoreCase("true")
				|| ((String)communicationTypeMap.get("messages")).equalsIgnoreCase("true")
				|| ((String)communicationTypeMap.get("mobile_no_viewed")).equalsIgnoreCase("true")){
						String sub_str = "";
						if(((String)communicationTypeMap.get("interests")).equalsIgnoreCase("true")){
							sub_str += " or activity_type in ('interest_rejected') ";
						}
						if(((String)communicationTypeMap.get("messages")).equalsIgnoreCase("true")){
							sub_str += " or activity_type in ('message_rejected') ";
						}
						/*if(((String)communicationTypeMap.get("mobile_no_viewed")).equalsIgnoreCase("true")){
							sub_str += " or activity_type in ('mobile_no_viewed') ";
						}*/
						if(StringUtils.isNotBlank(sub_str)){
							sub_str = sub_str.substring(3);
							activity_type_str = " and ("+sub_str+") ";
						}
						
		}
		
		StringBuffer act_done_by_clause = new StringBuffer("  ");
		
		//String done_on_users = " select act.act_done_on_user_id from users_activity_log act where act.act_done_by_user_id = "+objUserBean.getId()+" "+activity_type_str+" ";
		//String done_by_users = " select act.act_done_by_user_id from users_activity_log act where act.act_done_on_user_id = "+objUserBean.getId()+" "+activity_type_str+" ";
		
		if(    (((String)rejectedByMap.get("rejected_by_me")).equalsIgnoreCase("true") && ((String)rejectedByMap.get("rejected_by_others")).equalsIgnoreCase("true"))
				|| (((String)rejectedByMap.get("rejected_by_me")).equalsIgnoreCase("false") && ((String)rejectedByMap.get("rejected_by_others")).equalsIgnoreCase("false"))){
				
				act_done_by_clause.append(" ((activity.act_done_by_user_id  = temp.id and activity.act_done_on_user_id = "+objUserBean.getId()+") or (activity.act_done_on_user_id  = temp.id and activity.act_done_by_user_id = "+objUserBean.getId()+")) ");
				
				//accepted_by_str = "  (activity.act_done_by_user_id = "+objUserBean.getId()+" or  activity.act_done_on_user_id = "+objUserBean.getId()+") ";
			}else if(((String)rejectedByMap.get("rejected_by_me")).equalsIgnoreCase("true")){
				
				act_done_by_clause.append(" (activity.act_done_on_user_id  = temp.id and activity.act_done_by_user_id = "+objUserBean.getId()+")");
				//accepted_by_str = "  activity.act_done_by_user_id = "+objUserBean.getId()+" ";
			}else if(((String)rejectedByMap.get("rejected_by_others")).equalsIgnoreCase("true")){
				
				act_done_by_clause.append(" (activity.act_done_by_user_id  = temp.id and activity.act_done_on_user_id = "+objUserBean.getId()+")");
				//accepted_by_str = "  activity.act_done_on_user_id = "+objUserBean.getId()+" ";
			}
		
		
		
		
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = "  u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
		//StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select temp.*,activity.id as requestId "
				+ "  from "
				+ "(select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from (select count(1) from users u,users_activity_log activity where "+inner_where_clause+" and "+act_done_by_clause.toString().replaceAll("temp.id", "u.id")+"  "+activity_type_str+"  group by u.id ) tc) as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=id and act_log.activity_type = 'short_listed') as short_listed,  "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				//+" from users_activity_log activity left join users u on activity.act_done_on_user_id=u.id left join userrequirement ur on u.id=ur.userId "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity  "
				+ " where "+inner_where_clause+" group by u.id) temp,  "
				+" users_activity_log activity where "+act_done_by_clause+"  "
				+activity_type_str+"  ");

		
		//buffer.append(" WHERE "+rejected_by_str+" "+activity_type_str+" GROUP BY u.id  ");
		buffer.append(" GROUP BY temp.id    ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time)  desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	/****   pending tab filter options      ****/
	public List<Map<String,Object>> getPendingRequestsByFilterCriteria(String userId, Map<String,String> readStatusMap, Map<String,String> communicationTypeMap, int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		Map<String,Object> user_settings = (Map<String,Object>)session.getAttribute("user_settings");
		StringBuffer buffer = new StringBuffer();
		
		String activity_type_str = "";
		if(        (((String)communicationTypeMap.get("all")).equalsIgnoreCase("true"))
				|| (((String)communicationTypeMap.get("interests")).equalsIgnoreCase("true") && ((String)communicationTypeMap.get("messages")).equalsIgnoreCase("true") && ((String)communicationTypeMap.get("mobile_no_viewed")).equalsIgnoreCase("true"))
				|| (((String)communicationTypeMap.get("all")).equalsIgnoreCase("false")) && ((String)communicationTypeMap.get("interests")).equalsIgnoreCase("false") && ((String)communicationTypeMap.get("messages")).equalsIgnoreCase("false") && ((String)communicationTypeMap.get("mobile_no_viewed")).equalsIgnoreCase("false")){
			
			activity_type_str = " activity_type in ('interest_request','message')  ";
			
		}else if(((String)communicationTypeMap.get("interests")).equalsIgnoreCase("true")
				|| ((String)communicationTypeMap.get("messages")).equalsIgnoreCase("true")
				|| ((String)communicationTypeMap.get("mobile_no_viewed")).equalsIgnoreCase("true")){
						String sub_str = "";
						if(((String)communicationTypeMap.get("interests")).equalsIgnoreCase("true")){
							sub_str += " or activity_type in ('interest_request') ";
						}
						if(((String)communicationTypeMap.get("messages")).equalsIgnoreCase("true")){
							sub_str += " or activity_type in ('message') ";
						}
						/*if(((String)communicationTypeMap.get("mobile_no_viewed")).equalsIgnoreCase("true")){
							sub_str += " or  mobile_no_viewed_status = '1' ";
						}*/
						if(StringUtils.isNotBlank(sub_str)){
							sub_str = sub_str.substring(3);
							activity_type_str += "("+sub_str+" )";
						}
		}
		
		String inner_where_clause = "  u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ";
		
		if(((String)user_settings.get("contact_filter")).equalsIgnoreCase("filter")){
			if(StringUtils.isNotBlank((String)user_settings.get("filter_age_from"))){
				inner_where_clause += " and ifnull(floor((datediff(current_date(),u.dob))/365),0) between "+user_settings.get("filter_age_from")+" and "+user_settings.get("filter_age_to")+" ";
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_marital_status"))){
				inner_where_clause += " and find_in_set(u.maritalStatus,'"+user_settings.get("filter_marital_status")+"')>0 ";
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_caste"))){
				inner_where_clause += " and find_in_set(u.caste,'"+user_settings.get("filter_caste")+"')>0 ";
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_religion"))){
				inner_where_clause += " and find_in_set(u.religion,'"+user_settings.get("filter_religion")+"')>0 ";
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_mothertongue"))){
				inner_where_clause += " and find_in_set(u.motherTongue,'"+user_settings.get("filter_mothertongue")+"')>0 ";
			}
			if(StringUtils.isNotBlank((String)user_settings.get("filter_country"))){
				inner_where_clause += " and find_in_set(u.currentCountry,'"+user_settings.get("filter_country")+"')>0 ";
			}
		}
		//StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select temp.*,activity.id as requestId,ifnull(activity.activity_content,'') as  activity_content,max(activity.created_time) "
				+ "  from "
				+ "(select u.id,u.gender,sta.name as currentStateName,cit.name as currentCityName,u.occupation,ifnull(oc.name,'') as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from (select count(1) from users u,users_activity_log act where "+inner_where_clause+" and act.act_done_by_user_id  = u.id and act.act_done_on_user_id = "+objUserBean.getId()+" and "+activity_type_str+" and act.activity_status in ('0')  group by u.id ) tc) as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=id and act_log.activity_type = 'short_listed') as short_listed,  "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity  "
				+ " where "+inner_where_clause 
				+ " group by u.id) temp, "
				+" users_activity_log activity where activity.act_done_on_user_id  = "+objUserBean.getId()+" and activity.act_done_by_user_id = temp.id "
				+ " and "+activity_type_str
				+ " and activity.activity_status in ('0') ");

				
		
		//buffer.append(where_clause);
		buffer.append(" group by temp.id  ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time)  desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public List<Map<String,Object>> getacceptedRequests(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as receivedOn, "
				+" (select count(*) from express_intrest_view ei where ei.user_id = "+userId+" and ei.interested = '1' and status = '2') as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status = '2' order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		//String inner_where_clause = " ((ei.user_id = u.id and ei.profile_id = "+userId+") or ((ei.user_id = "+userId+" and ei.profile_id = u.id))) and ((ei.interested = '1' and ei.status = '2') or (message_sent_status = '1' and message_status in (1,2))) and u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
		String inner_where_clause = "  u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select temp.*,activity.id as requestId"
				+ "   from "
				+ "(select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from (select count(1) from users u,users_activity_log act where "+inner_where_clause+" and ((act.act_done_by_user_id  = u.id and act.act_done_on_user_id = "+objUserBean.getId()+") or (act.act_done_on_user_id  = u.id and act.act_done_by_user_id = "+objUserBean.getId()+")) and act.activity_type in ('message_accepted','message_replied','interest_accepted')  group by u.id ) tc) as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=id and act_log.activity_type = 'short_listed') as short_listed,  "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity "
				+ " where "+inner_where_clause+" group by u.id) temp,  "
				+" users_activity_log activity where ((activity.act_done_by_user_id  = temp.id and activity.act_done_on_user_id = "+objUserBean.getId()+") or (activity.act_done_on_user_id  = temp.id and activity.act_done_by_user_id = "+objUserBean.getId()+"))  and activity.activity_type in ('message_accepted','message_replied','interest_accepted') "
				+ "");
				//+"  express_intrest ei  where "+inner_where_clause+" ");
		
		//buffer.append(where_clause);
		buffer.append(" group by temp.id ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time) desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		return null;
	}
	
	public Map<String,Object> getRecentActivityOf(String userId,Integer profile_id,String request_type){
		jdbcTemplate = custom.getJdbcTemplate();
		try{
				StringBuffer buffer = new StringBuffer();
				if(request_type.equalsIgnoreCase("pending_requests")){
					String where_clause = " act_done_on_user_id = "+userId+"  and act_done_by_user_id = "+profile_id+" and activity_type in ('interest_request','message') and activity_status in ('0')";
					buffer.append("select *,date_format(created_time,'%d-%b-%Y') as activity_done_on,(select count(*) from users_activity_log where "+where_clause+") as conversations_count from users_activity_log where  "+where_clause+" order by created_time desc limit 1 ");
				}
				if(request_type.equalsIgnoreCase("filtered_requests")){
					String where_clause = " act_done_on_user_id = "+userId+"  and act_done_by_user_id = "+profile_id+" and activity_type in ('interest_request','message') ";
					buffer.append("select *,(select count(*) from users_activity_log where "+where_clause+") as conversations_count from users_activity_log where  "+where_clause+" order by created_time desc limit 1 ");
				}
				if(request_type.equalsIgnoreCase("accepted_requests")){
					String where_clause = " find_in_set(act_done_on_user_id,('"+userId+","+profile_id+"'))>0 and find_in_set(act_done_by_user_id,('"+userId+","+profile_id+"'))>0 and activity_type in ('message_accepted','message_replied','interest_accepted') ";
					buffer.append("select *,date_format(created_time,'%d-%b-%Y') as activity_done_on, (select activity_content from users_activity_log where act_done_on_user_id = "+userId+" and act_done_by_user_id = "+profile_id+" and activity_status in ('1') and activity_type in ('message') order by created_time desc limit 1) as activity_content, "
								+ " (select activity_content from users_activity_log where find_in_set(act_done_on_user_id,('"+userId+","+profile_id+"'))>0 and find_in_set(act_done_by_user_id,('"+userId+","+profile_id+"'))>0 and activity_type in ('message_replied') order by created_time desc limit 1) as replied_msg_content, "
								+" (select count(*) from users_activity_log where "+where_clause+") as  conversations_count "
								+" from users_activity_log where "+where_clause+"  order by created_time desc limit 1 ");
				}
				if(request_type.equalsIgnoreCase("rejected_requests")){
					String where_clause = " find_in_set(act_done_on_user_id,('"+userId+","+profile_id+"'))>0 and find_in_set(act_done_by_user_id,('"+userId+","+profile_id+"'))>0 and activity_type in ('message_rejected','interest_rejected') ";
					buffer.append("select *,date_format(created_time,'%d-%b-%Y') as activity_done_on, "
								+" (select count(*) from users_activity_log where "+where_clause+") as  conversations_count "
								+" from users_activity_log where "+where_clause+"  order by created_time desc limit 1 ");
				}
				if(request_type.equalsIgnoreCase("sent_requests")){
					String where_clause = " act_done_by_user_id = "+userId+" and act_done_on_user_id = "+profile_id+" and activity_type not in ('profile_viewed')";
					buffer.append("select *,date_format(created_time,'%d-%b-%Y') as activity_done_on, "
								+" (select count(*) from users_activity_log where "+where_clause+") as  conversations_count "
								+"	from users_activity_log where "+where_clause+"  order by created_time desc limit 1 ");
				}
				if(request_type.equalsIgnoreCase("awaiting_requests")){
					String where_clause = " act_done_by_user_id = "+userId+" and act_done_on_user_id = "+profile_id+" and activity_type in ('interest_request','message') and activity_status = '0'";
					buffer.append("select *,date_format(created_time,'%d-%b-%Y') as activity_done_on, "
							+" (select count(*) from users_activity_log where "+where_clause+") as  conversations_count "
							+" from users_activity_log where "+where_clause+"  order by created_time desc limit 1 ");
				}
				
				List<Map<String,Object>> recent_activity = jdbcTemplate.queryForList(buffer.toString());
				if(recent_activity != null && recent_activity.size()>0){
					return recent_activity.get(0);
				}
				return null;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	/****   others accepted    ****/
	/*public List<Map<String,Object>> getRequestsAcceptedMe(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as receivedOn, "
				+" (select count(*) from express_intrest_view ei where ei.user_id = "+userId+" and ei.interested = '1' and status = '2') as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status = '2' order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " ei.profile_id = u.id and ei.user_id = "+userId+" and ei.interested = '1' and ei.status = '2' and u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and message_sent_status='1') as message_sent_status, "
				+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from users u,express_intrest ei where "+inner_where_clause+") as total_records, "
				+" (select ifnull((select short_listed from express_intrest where user_id = "+objUserBean.getId()+" and profile_id = u.id),0)) as short_listed "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity,  "
				+"  express_intrest ei  where "+inner_where_clause+" ");
		
		//buffer.append(where_clause);
		buffer.append(" group by u.id ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by u.package_id desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null)
				return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}*/
	
	/*public List<Map<String,Object>> getRequestsRejectedByMe(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as receivedOn, "
				+" (select count(*) from express_intrest_view ei where ei.user_id = "+userId+" and ei.interested = '1' and status = '2') as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status = '2' order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " ei.user_id = u.id and ei.profile_id = "+userId+" and ei.interested = '1' and ei.status = '3' and u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and message_sent_status='1') as message_sent_status, "
				+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from users u,express_intrest ei where "+inner_where_clause+") as total_records, "
				+" (select ifnull((select short_listed from express_intrest where user_id = "+objUserBean.getId()+" and profile_id = u.id),0)) as short_listed "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity,  "
				+"  express_intrest ei  where "+inner_where_clause+" ");
		
		//buffer.append(where_clause);
		buffer.append(" group by u.id ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by u.package_id desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null)
				return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}*/
	
	public List<Map<String,Object>> getRejectedRequests(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as receivedOn, "
				+" (select count(*) from express_intrest_view ei where ei.user_id = "+userId+" and ei.interested = '1' and status = '2') as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status = '2' order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = "  u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select temp.*,activity.id as requestId "
				+ "  from "
				+"(select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from (select count(1) from users u,users_activity_log act where "+inner_where_clause+" and ((act.act_done_by_user_id  = u.id and act.act_done_on_user_id = "+objUserBean.getId()+") or (act.act_done_on_user_id  = u.id and act.act_done_by_user_id = "+objUserBean.getId()+")) and act.activity_type in ('message_rejected','interest_rejected')  group by u.id ) tc) as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=id and act_log.activity_type = 'short_listed') as short_listed,  "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity  "
				+ " where "+inner_where_clause+" group by u.id) temp,  "
				+" users_activity_log activity where ((activity.act_done_by_user_id  = temp.id and activity.act_done_on_user_id = "+objUserBean.getId()+") or (activity.act_done_on_user_id  = temp.id and activity.act_done_by_user_id = "+objUserBean.getId()+"))  and "
						+ "activity.activity_type in ('message_rejected','interest_rejected') ");

		
		//buffer.append(where_clause);
		buffer.append(" group by temp.id  ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time)  desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public List<Map<String,Object>> getsentRequests(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as sentOn, "
				+" (select count(*) from express_intrest_view ei where ei.profile_id = "+userId+" and ei.interested = '1' and status in ('0','1')) as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status in ('0','1') order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = "  u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+objUserBean.getId()+")";
		StringBuffer where_clause = new StringBuffer(" temp.role_id not in (1) and temp.status in ('1') and temp.gender not in  ('"+objUserBean.getGender()+"') and temp.id not in  ("+userId+") ");
		buffer.append("select temp.*,activity.id as requestId,ifnull(activity.activity_content,'') as  activity_content,max(activity.created_time) "
				+ "  from "
				+" (select u.id,u.package_id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from (select count(1) from users u,users_activity_log activity  where  activity.act_done_on_user_id=u.id and  activity.act_done_by_user_id = "+objUserBean.getId()+" and activity.activity_type not in ('profile_viewed')  and "+inner_where_clause+" GROUP BY u.id  ) tc ) as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
				//+" ifnull(activity.activity_content,'') as  activity_content,"
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users_activity_log activity left join users u on activity.act_done_on_user_id=u.id  left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity "
				+ " where "+inner_where_clause 
				+ " group by u.id) temp,"
				+" users_activity_log activity where activity.act_done_by_user_id = "+objUserBean.getId()+" and temp.id = activity.act_done_on_user_id and "
						+ "activity.activity_type not in ('profile_viewed') ");
				//+"  users_activity_log activity  where  activity.act_done_by_user_id=u.id and  activity.act_done_by_user_id = "+objUserBean.getId()+" ");
		
		//buffer.append(where_clause);
		buffer.append(" GROUP BY temp.id  ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time)  desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public List<Map<String,Object>> getAwaitingRequests(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as sentOn, "
				+" (select count(*) from express_intrest_view ei where ei.profile_id = "+userId+" and ei.interested = '1' and status in ('0','1')) as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status in ('0','1') order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = "  u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select temp.*,activity.id as requestId,ifnull(activity.activity_content,'') as  activity_content,max(activity.created_time) "
				+ "  from "
				+"(select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from (select count(1) from users u,users_activity_log activity where activity.act_done_by_user_id  = "+objUserBean.getId()+" and activity.act_done_on_user_id = u.id  and activity.activity_type in ('interest_request','message') and activity.activity_status in ('0') and "+inner_where_clause+" group by u.id) tc ) as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity  "
				+ " where "+inner_where_clause 
				+ " group by u.id) temp, "
				+" users_activity_log activity where activity.act_done_by_user_id  = "+objUserBean.getId()+" and activity.act_done_on_user_id = temp.id and activity.activity_type in ('interest_request','message') "
				+" and activity.activity_status in ('0')  ");

		
		//buffer.append(where_clause);
		buffer.append(" group by temp.id  ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by max(activity.created_time)  desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null){
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public List<Map<String,Object>> getyetToBeViewedList(String userId,int page_no,String withPhoto,String alreadyContacted,Map<String,String> filterOptions){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as sentOn, "
				+" (select count(*) from express_intrest_view ei where ei.profile_id = "+userId+" and ei.interested = '1' and status in ('0','1')) as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status in ('0','1') order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " u.id not in (select act_log.act_done_on_user_id from users_activity_log act_log where act_log.act_done_by_user_id = "+userId+" and act_log.activity_type in ('profile_viewed'))  ";
		StringBuffer where_clause = new StringBuffer("  u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ");
		// add checkboxes criteria also
		if(StringUtils.isNotBlank(withPhoto) && withPhoto.equalsIgnoreCase("true")){
			where_clause.append(" and u.id in (select umg.user_id from vuser_images umg where umg.is_profile_picture = '1' and umg.approved_status = '1') ");
		}
		if(StringUtils.isNotBlank(alreadyContacted) && alreadyContacted.equalsIgnoreCase("true")){
			where_clause.append(" and u.id not in(select act_done_on_user_id from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+"  and act_log.activity_type in ('interest_request','message','mobile_no_viewed')) ");
		}
		// filter results options
		if(filterOptions != null){
			if(StringUtils.isNotBlank(filterOptions.get("with_photo")) && ((String)filterOptions.get("with_photo")).equalsIgnoreCase("true")){
				where_clause.append(" and u.id in (select umg.user_id from vuser_images umg where umg.is_profile_picture = '1' and umg.approved_status = '1') ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("with_in_day")) && ((String)filterOptions.get("with_in_day")).equalsIgnoreCase("true")){
				where_clause.append(" and u.created_time between date_add(now(), interval -1 day) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("with_in_week")) && ((String)filterOptions.get("with_in_week")).equalsIgnoreCase("true")){
				where_clause.append(" and u.created_time between date_add(now(), interval -1 week) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("with_in_month")) && ((String)filterOptions.get("with_in_month")).equalsIgnoreCase("true")){
				where_clause.append(" and u.created_time between date_add(now(), interval -1 month) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("created_at_any_time")) && ((String)filterOptions.get("created_at_any_time")).equalsIgnoreCase("true")){
				//where_clause.append(" and u.created_time between date_add(now(), interval -1 month) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("age_from"))){
				where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) >= "+filterOptions.get("age_from")+" ");
				where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) <= "+filterOptions.get("age_to")+" ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("marital_status"))){
				where_clause.append( " and  FIND_IN_SET(u.maritalStatus,'"+filterOptions.get("marital_status")+"')>0    ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("height_from"))){
				where_clause.append( " and cast(u.height as unsigned) >= cast('"+filterOptions.get("height_from")+"' as unsigned ) ");
				where_clause.append( " and cast(u.height as unsigned) <= cast('"+filterOptions.get("height_to")+"' as unsigned ) ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("mother_tongue"))){
				where_clause.append( " and FIND_IN_SET(u.motherTongue,'"+filterOptions.get("mother_tongue")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("caste")) && !((String)filterOptions.get("caste")).equalsIgnoreCase("null")){
				where_clause.append( " and FIND_IN_SET(u.caste,'"+filterOptions.get("caste")+"')>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("education"))){
				where_clause.append( " and FIND_IN_SET(u.education,'"+filterOptions.get("education")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("occupation"))){
				where_clause.append( " and FIND_IN_SET(u.occupation,'"+filterOptions.get("occupation")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("annual_income"))){
				where_clause.append(" and FIND_IN_SET(u.annualIncome,'"+filterOptions.get("occupation")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("country"))){
				where_clause.append( " and FIND_IN_SET(u.currentCountry,'"+filterOptions.get("country")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("state"))){
				where_clause.append( " and FIND_IN_SET(u.currentState,'"+filterOptions.get("state")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("city")) && !((String)filterOptions.get("city")).equalsIgnoreCase("null")){
				where_clause.append( " and FIND_IN_SET(u.currentCity,'"+filterOptions.get("city")+"' )>0  ");
			}
		}
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from users u where "+where_clause+" and "+inner_where_clause+" ) as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity  "
				+"    where "+where_clause+" and "+inner_where_clause);
		
		
		//buffer.append(where_clause);
		buffer.append(" group by u.id ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by u.created_time desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null)
				return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public List<Map<String,Object>> getViewedNotContactedList(String userId,int page_no,String withPhoto,Map<String,String> filterOptions){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as sentOn, "
				+" (select count(*) from express_intrest_view ei where ei.profile_id = "+userId+" and ei.interested = '1' and status in ('0','1')) as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status in ('0','1') order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " u.id  in   (select act_log.act_done_on_user_id from users_activity_log act_log where u.id=act_log.act_done_on_user_id and act_log.act_done_by_user_id = "+userId+" and act_log.activity_type = 'profile_viewed') "
				+ " and  u.id  not in  (select act_log.act_done_on_user_id from users_activity_log act_log where u.id=act_log.act_done_on_user_id and act_log.act_done_by_user_id = "+userId+" and act_log.activity_type in ('interest_request','message','mobile_no_viewed') )   ";
		StringBuffer where_clause = new StringBuffer("  u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ");
		if(StringUtils.isNotBlank(withPhoto) && withPhoto.equalsIgnoreCase("true")){
			where_clause.append(" and u.id in (select umg.user_id from vuser_images umg where umg.is_profile_picture = '1' and umg.approved_status = '1' and umg.status = '1') ");
		}
		// filter results options
		if(filterOptions != null){
			if(StringUtils.isNotBlank(filterOptions.get("with_photo")) && ((String)filterOptions.get("with_photo")).equalsIgnoreCase("true")){
				where_clause.append(" and u.id in (select umg.user_id from vuser_images umg where umg.is_profile_picture = '1' and umg.approved_status = '1') ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("with_in_day")) && ((String)filterOptions.get("with_in_day")).equalsIgnoreCase("true")){
				where_clause.append(" and u.created_time between date_add(now(), interval -1 day) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("with_in_week")) && ((String)filterOptions.get("with_in_week")).equalsIgnoreCase("true")){
				where_clause.append(" and u.created_time between date_add(now(), interval -1 week) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("with_in_month")) && ((String)filterOptions.get("with_in_month")).equalsIgnoreCase("true")){
				where_clause.append(" and u.created_time between date_add(now(), interval -1 month) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("created_at_any_time")) && ((String)filterOptions.get("created_at_any_time")).equalsIgnoreCase("true")){
				//where_clause.append(" and u.created_time between date_add(now(), interval -1 month) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("age_from"))){
				where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) >= "+filterOptions.get("age_from")+" ");
				where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) <= "+filterOptions.get("age_to")+" ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("marital_status"))){
				where_clause.append( " and  FIND_IN_SET(u.maritalStatus,'"+filterOptions.get("marital_status")+"')>0    ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("height_from"))){
				where_clause.append( " and cast(u.height as unsigned) >= cast('"+filterOptions.get("height_from")+"' as unsigned ) ");
				where_clause.append( " and cast(u.height as unsigned) <= cast('"+filterOptions.get("height_to")+"' as unsigned ) ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("mother_tongue"))){
				where_clause.append( " and FIND_IN_SET(u.motherTongue,'"+filterOptions.get("mother_tongue")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("caste")) && !((String)filterOptions.get("caste")).equalsIgnoreCase("null")){
				where_clause.append( " and FIND_IN_SET(u.caste,'"+filterOptions.get("caste")+"')>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("education"))){
				where_clause.append( " and FIND_IN_SET(u.education,'"+filterOptions.get("education")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("occupation"))){
				where_clause.append( " and FIND_IN_SET(u.occupation,'"+filterOptions.get("occupation")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("annual_income"))){
				where_clause.append(" and FIND_IN_SET(u.annualIncome,'"+filterOptions.get("occupation")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("country"))){
				where_clause.append( " and FIND_IN_SET(u.currentCountry,'"+filterOptions.get("country")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("state"))){
				where_clause.append( " and FIND_IN_SET(u.currentState,'"+filterOptions.get("state")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("city")) && !((String)filterOptions.get("city")).equalsIgnoreCase("null")){
				where_clause.append( " and FIND_IN_SET(u.currentCity,'"+filterOptions.get("city")+"' )>0  ");
			}
		}
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from users u where  "+inner_where_clause+" and "+where_clause+ ") as total_records, "
				+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
				+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity where "+where_clause
				+"   and "+inner_where_clause+" ");
		
		
		
		//buffer.append(where_clause);
		buffer.append(" group by u.id ");
		
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		buffer.append(" order by u.package_id desc limit "+page_size+" offset "+(page_no*page_size)+" ");
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
			if(list!=null)
				return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	public List<Map<String,Object>> getUpdatedProfiles(int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		String inner_where_clause = " ui.user_id in (select u.id from users u where u.status='1') and ui.status = '1' and ui.approved_status = '0' ";
		//String qryStr = "select *,(select count(*) from users where status = '1') as total_count,date_format(updated_time,'%d-%M-%Y') as updatedOn from users where status = '1' order by updated_time desc limit "+page_size+" offset "+(page_no*page_size)+" ";
		String qryStr = "select *,(select u.username from users u where u.id = ui.user_id) as username, date_format(updated_on,'%d-%M-%Y') as updatedOn, "
						+" (select count(*) from (select * from vuser_images ui where  "+inner_where_clause+" group by ui.user_id) tt) as total_count  from vuser_images ui " 
						+" where "+inner_where_clause+" group by username order by ui.updated_on "
						+" limit "+page_size+" offset "+(page_no*page_size)+" ";
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
			if(list!=null)
				return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public List<MemberShipBean> getPackagesList(){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select * from package  where status='1' order by price asc ";
		try{
			List<MemberShipBean> list = jdbcTemplate.query(qryStr,
					ParameterizedBeanPropertyRowMapper.newInstance(MemberShipBean.class));
			if(list!=null)
				return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}

	public boolean approvePhoto(String photoId,String approvedStatus){
		
		jdbcTemplate = custom.getJdbcTemplate();
		String sSql  = null;
		
		try {
			String status = approvedStatus.equals("1")?"1":"2";
			sSql = "update user_images set approved_status = '"+status+"' where id =  "+photoId;
			
			int updated_count = jdbcTemplate.update(sSql);
			if (updated_count == 1) {
				// set as profile pic if profile pic is not yet set 
				String picQry = "select count(*) from vuser_images where user_id = (select uimg.user_id from vuser_images uimg where uimg.id = "+photoId+" limit 1) and status = '1' and is_profile_picture = '1'";
				int profile_pic_count = jdbcTemplate.queryForInt(picQry);
				if(profile_pic_count==0){
					picQry = "update user_images set is_profile_picture = '1' where id = "+photoId;
					int updated = jdbcTemplate.update(picQry);
				}
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {

		}
		return false;
	}
public int approvePhotoAll(String photoIds,String approvedStatus){
		
		jdbcTemplate = custom.getJdbcTemplate();
		String sSql  = null;
		
		try {
			String status = approvedStatus.equals("1")?"1":"2";
			sSql = "update user_images set approved_status = '"+status+"' where find_in_set(id,'"+photoIds+"')>0";
			
			int updated_count = jdbcTemplate.update(sSql);
			return updated_count;	
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
public boolean deletePhoto(String photoId){
		
		jdbcTemplate = custom.getJdbcTemplate();
		String sSql  = null;
		
		try {
			sSql = "update user_images set status = '0' , is_profile_picture = '0' where id =  "+photoId;
			
			int updated_count = jdbcTemplate.update(sSql);
			if (updated_count == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {

		}
		return false;
	}
	
	public boolean setAsProfilePicture(String photoId,int userId){
		
		jdbcTemplate = custom.getJdbcTemplate();
		String sSql  = null;
		
		try {
			sSql = "update user_images set is_profile_picture = '0' where user_id = "+userId;
			jdbcTemplate.update(sSql);
			sSql = "update user_images set is_profile_picture = '1' where id =  "+photoId;
			
			int updated_count = jdbcTemplate.update(sSql);
			if (updated_count == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {

		}
		return false;
	}
	
	public String getProfilePicture(int userId){
		
		jdbcTemplate = custom.getJdbcTemplate();
		String sSql  = null;
		
		try {
			sSql = "select image from vuser_images where user_id =  "+userId+" and is_profile_picture = '1' and status = '1'";
			List<Map<String,Object>> list = jdbcTemplate.queryForList(sSql);
			if(list.size()>0){
				String image = (String)list.get(0).get("image");
				return image;
			}
			return "";
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		} finally {

		}
	}
	
	public List<Map<String,Object>> getPackageExpiredProfiles(int package_id){
		jdbcTemplate = custom.getJdbcTemplate();
		//String qryStr = "select u.*,u.id as userId,p.*,date_format(package_joined_date,'%d-%M-%Y') as package_joined_date from users u, package p  where u.package_id = p.id and p.id = "+package_id+" and p.status = '1' and current_date() > (select DATE_ADD(u.package_joined_date, INTERVAL p.duration MONTH)) and u.membership_status='0' group by u.package_id order by u.package_id desc";
		String qryStr = "select * from (select u.*,u.id as userId,date_format(package_joined_date,'%d-%M-%Y') as package_joined_datee, "
		+ "(case duration_type when 'day' then (select datediff(date_add(u.package_joined_date, interval pack.duration day),current_date()))    "
		+ "						when 'month' then (select datediff(date_add(u.package_joined_date, interval pack.duration month),current_date()))  	"
		+ "						when 'year' then (select datediff(date_add(u.package_joined_date, interval pack.duration year),current_date()))  	"
		+ "			else -1	end ) as validity  from users u, package pack where u.package_id = pack.id and pack.status = '1' and pack.id = "+package_id+" ) temp "
		+ " where temp.validity between 0 and 10 ";
		//String qryStr = "select u.*,u.id as userId,p.*,date_format(package_joined_date,'%d-%M-%Y') as package_joined_date from users u, package p  where u.package_id = p.id and p.id = "+package_id+" and p.status = '1'  group by u.package_id order by u.package_id desc";
		try{
			List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
			if(list!=null)
				return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	/*public int getAllowedProfilesLimit(int userId){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select allowed_profiles_limit from package where id = (select u.package_id from users u where u.id="+userId+")";
		try{
			int allowed_profiles_limit = jdbcTemplate.queryForInt(qryStr);
			qryStr = "select count(*) from express_intrest_view where user_id = "+userId+" and (mobile_no_viewed_status = '1' or interested = '1' or message_sent_status = '1') "
					+" and date(created_on) >= (SELECT date(u.package_joined_date) from users u where u.id = "+userId+") ";
			int viewed_profiles = jdbcTemplate.queryForInt(qryStr);
			return (allowed_profiles_limit-viewed_profiles);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}*/
	
	/*public int getAllowedProfilesLimit(int userId){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select allowed_profiles_limit from package where id = (select u.package_id from users u where u.id="+userId+")";
		try{
			int allowed_profiles_limit = jdbcTemplate.queryForInt(qryStr);
			qryStr = "select count(1) from (select 1 from users_activity_log where act_done_by_user_id = "+userId+" and activity_type in ('interest_request','mobile_no_viewed','message') "
					+" and date(created_time) >= (SELECT date(u.package_joined_date) from users u where u.id = "+userId+") "
					+ " group by act_done_on_user_id) temp ";
			int already_contacted_profiles = jdbcTemplate.queryForInt(qryStr);
			return (allowed_profiles_limit-already_contacted_profiles);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}*/
	
	public String getAllowedProfilesLimit(int userId){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select allowed_profiles_limit from package where id = (select u.package_id from users u where u.id="+userId+")";
		try{
			String allowed_profiles_limit = jdbcTemplate.queryForObject(qryStr,String.class);
			if(StringUtils.isNotBlank(allowed_profiles_limit) && "unlimited".equalsIgnoreCase(allowed_profiles_limit)){
				return "unlimited";
			}
			qryStr = "select count(1) from (select 1 from users_activity_log where act_done_by_user_id = "+userId+" and activity_type in ('interest_request','mobile_no_viewed','message') "
					+" and date(created_time) >= (SELECT date(u.package_joined_date) from users u where u.id = "+userId+") "
					+ " group by act_done_on_user_id) temp ";
			int already_contacted_profiles = jdbcTemplate.queryForInt(qryStr);
			return ((Integer.parseInt(allowed_profiles_limit)-already_contacted_profiles))+"";
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	/*public boolean saveOtp(String mobileNum,String otp){
		jdbcTemplate = custom.getJdbcTemplate();
		UsersBean userSessionBean =  (UsersBean) session.getAttribute("cacheGuest");
		String selectQry = "select count(*) from user_otps where user_id = "+userSessionBean.getId()+" and mobile_no = "+mobileNum+" and date(updated_time) = current_date() ";
		int existing_count = jdbcTemplate.queryForInt(selectQry);
		String qryStr = "";
		if(existing_count==0){
			qryStr = "insert into user_otps(created_time,updated_time,user_id,mobile_no,otp,status,count) "
					+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','"+new java.sql.Timestamp(new DateTime().getMillis())+"',"+userSessionBean.getId()+","+mobileNum+","+otp+",'0',1)";
		}else{
			qryStr = "update user_otps set updated_time = '"+new java.sql.Timestamp(new DateTime().getMillis())+"', otp = "+otp+", count = (count+1) where user_id = "+userSessionBean.getId()+" and mobile_no = "+mobileNum;
		}
		
		try{
			int inserted_count = jdbcTemplate.update(qryStr);
			if(inserted_count==1)
				return true;
			
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return false;
	}*/
	public boolean saveOtp(String user_id,String mobileNum,String otp){
		return this.saveOtp(user_id, mobileNum, otp, "0");
	}
	public boolean saveOtp(String user_id,String mobileNum,String otp,String status){
		jdbcTemplate = custom.getJdbcTemplate();
		String selectQry = "select count(*) from user_otps where user_id = "+user_id+" and mobile_no = "+mobileNum+" and date(updated_time) = current_date() ";
		int existing_count = jdbcTemplate.queryForInt(selectQry);
		String qryStr = "";
		if(existing_count==0){
			qryStr = "insert into user_otps(created_time,updated_time,user_id,mobile_no,otp,status,count) "
					+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','"+new java.sql.Timestamp(new DateTime().getMillis())+"',"+user_id+","+mobileNum+","+otp+",'"+status+"',1)";
		}else{
			qryStr = "update user_otps set updated_time = '"+new java.sql.Timestamp(new DateTime().getMillis())+"', otp = "+otp+", count = (count+1) where user_id = "+user_id+" and mobile_no = "+mobileNum+" and date(updated_time) = current_date() ";
		}
		
		try{
			int inserted_count = jdbcTemplate.update(qryStr);
			if(inserted_count==1)
				return true;
			
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	public boolean updateOtpCount(String mobileNum,String otp){
		jdbcTemplate = custom.getJdbcTemplate();
		UsersBean userSessionBean =  (UsersBean) session.getAttribute("cacheGuest");
		String qryStr = "update user_otps set count = (count+1), updated_time = '"+new java.sql.Timestamp(new DateTime().getMillis())+"' where mobile_no = "+mobileNum+" and user_id = "+userSessionBean.getId()+" and otp = "+otp+" and date(updated_time) = current_date() ";
		try{
			int updated_count = jdbcTemplate.update(qryStr);
			if(updated_count==1)
				return true;
			
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	public boolean updateOtpStatus(String mobileNum,String otp){
		jdbcTemplate = custom.getJdbcTemplate();
		UsersBean userSessionBean =  (UsersBean) session.getAttribute("cacheGuest");
		String qryStr = "update user_otps set status='1', updated_time = '"+new java.sql.Timestamp(new DateTime().getMillis())+"' where mobile_no = "+mobileNum+" and user_id = "+userSessionBean.getId()+" and otp = "+otp+" and date(updated_time) = current_date() ";
		try{
			int updated_count = jdbcTemplate.update(qryStr);
			if(updated_count==1)
				return true;
			
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	public String getOtpOf(String userId, String mobileNum){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select otp from user_otps where user_id = "+userId+" and mobile_no = "+mobileNum+" and date(updated_time) = current_date() ";
		try{
			long otp = jdbcTemplate.queryForLong(qryStr);
			return otp+"";
			
		}catch(Exception e){
			e.printStackTrace();
			return "";
		}
	}
	
	public int getOTPCount(String mobileNum){
		jdbcTemplate = custom.getJdbcTemplate();
		UsersBean userSessionBean =  (UsersBean) session.getAttribute("cacheGuest");
		String qryStr = "select count from user_otps where user_id = "+userSessionBean.getId()+" and mobile_no = "+mobileNum+" and date(updated_time) = current_date() ";
		try{
			int count = jdbcTemplate.queryForInt(qryStr);
			return count;
			
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}

	}
	
	public int getProfileFilledStatus(UsersBean userProfile){
		int filled_status = 0;
		 if(StringUtils.isNotBlank(userProfile.getAboutMyself())){
			 filled_status += 10;
		 }
		 if(StringUtils.isNotBlank(userProfile.getDisability())){
			 filled_status += 5;
		 }
		 if(StringUtils.isNotBlank(userProfile.getFatherName())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getMotherName())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getfOccupation())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getmOccupation())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getNoOfBrothers())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getNoOfSisters())){
			 filled_status += 1; 
		 }
		 if(StringUtils.isNotBlank(userProfile.getNoOfBrothersMarried())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getImage())){
			 filled_status += 20;
		 }
		 
		 if(StringUtils.isNotBlank(userProfile.getrAgeFrom())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getrHeight())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getrMaritalStatus())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getrReligion())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getrCaste())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getrMotherTongue())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getrCountry())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getrState())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getrEducation())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getrWorkingWith())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getrOccupation())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getrAnnualIncome())){
			 filled_status += 1;
		 }
		 if(StringUtils.isNotBlank(userProfile.getrDiet())){
			 filled_status += 1;
		 }
		return filled_status;
	}
	public boolean updateLoginTime(UsersBean objUsersBean,String loginActive) {
		 jdbcTemplate = custom.getJdbcTemplate();
			boolean isStatusUpdate = false;
			try {
				String sSql = "update users set last_login_time = ?, loginActive=? where id = ?";
				int iCount = jdbcTemplate.update(sSql,
						new java.sql.Timestamp(new Date().getTime()),loginActive,	objUsersBean.getId());
				if (iCount != 0) {
					isStatusUpdate = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {

			}
			return isStatusUpdate;
		}
	public String getOtpStatus(UsersBean objUserBean){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select status from user_otps where user_id = "+objUserBean.getId()+" and mobile_no = "+objUserBean.getMobile()+" order by updated_time desc limit 1";
		try {
			String otpStatus = jdbcTemplate.queryForObject(qryStr, String.class);
			return otpStatus;
		} catch (EmptyResultDataAccessException e) {
			return "0";
		} catch (Exception ge) {
			return "0";
		} finally {

		}
		//return "0";
	}
	public String genOtp()
	   {
	   String tempStr = System.currentTimeMillis() + "";
	   String otp = tempStr.substring(7);
	   return otp;
	   }
	public UsersBean getUser(String inputVal){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select *,AES_DECRYPT(PASSWORD,'mykey') as password from   users where email ='"+inputVal+"' or username='"+inputVal+"' or mobile='"+inputVal+"'";
		try {
			List<UsersBean> list = jdbcTemplate.query(qryStr,ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(list!=null && list.size()>0){
				return list.get(0);
			}
			return null;
		} catch (Exception ge) {
			return null;
		}
	}
	
	public Map<String,Object> getUserMap(String inputVal){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select *,AES_DECRYPT(PASSWORD,'mykey') as password,(select us.auto_login from user_settings us where us.user_id=users.id) as auto_login from   users where email ='"+inputVal+"' or username='"+inputVal+"' or mobile='"+inputVal+"'";
		try {
			Map<String,Object> user = jdbcTemplate.queryForMap(qryStr);
			return user;
		} catch (Exception ge) {
			return null;
		}
	}
	
	public List<Map<String, Object>> reporsData(ReportsBean objreReportsBean){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,ifnull(oc.name,'--') as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, ifnull(u.mobile,'---') as mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,floor((datediff(current_date(),u.dob))/365) as age, IFNULL(p.name, 'Free Register') as planPackage from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity left join package p on u.package_id = p.id "
				+" where 1=1  ");
		
					if(objreReportsBean.getPackages().equals("FreeRegister")){
						
						buffer.append( " and u.role_id ='4' and "
								+" (select status from user_otps where user_id =u.id   and mobile_no = u.mobile order by user_otps.updated_time desc limit 1) is not null "
								+" and (select status from user_otps where user_id =u.id   and mobile_no = u.mobile order by user_otps.updated_time desc limit 1) <> '0' ");
					}else if(StringUtils.isNotBlank(objreReportsBean.getPackages())){
						buffer.append( " and u.package_id ="+objreReportsBean.getPackages() );
					}
					if(StringUtils.isNotBlank(objreReportsBean.getFromdate()) && StringUtils.isNotBlank(objreReportsBean.getTodate())){
						buffer.append( " and Date(u.created_time) BETWEEN Date('"+new java.sql.Timestamp(objreReportsBean.getFromdate1().getTime())+"') AND Date('"+new java.sql.Timestamp(objreReportsBean.getTodate1().getTime())+"') " );
					}
					if(StringUtils.isNotBlank(objreReportsBean.getCaste())){
						buffer.append( " and u.caste="+objreReportsBean.getCaste() );
					}
					if(StringUtils.isNotBlank(objreReportsBean.getOccupation())){
						buffer.append( " and u.occupation ="+objreReportsBean.getOccupation() );
					}
							buffer.append(" group by u.id ");
							buffer.append(" order by u.created_time desc ");
							String sql =buffer.toString();
							System.out.println(sql);
							
							
							List<Map<String, Object>> result = jdbcTemplate.queryForList(sql);
							return result;
		
	
	}

	
	public Map<String,Object> getMembershipDetails(UsersBean objUserBean){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select *,(case duration_type when 'day' then (date_format((select (date_add(u.package_joined_date, interval pack.duration DAY))),'%d-%b-%Y'))    	"
				+ " when 'month' then (date_format((select (date_add(u.package_joined_date, interval pack.duration month))),'%d-%b-%Y'))  		"
				+ " when 'year' then (date_format((select (date_add(u.package_joined_date, interval pack.duration YEAR))),'%d-%b-%Y'))  		else 'Unlimited'	end )  as renewal_date, "
				+" date_format((select date(updated_time) from paymenthistory where memberId = "+objUserBean.getId()+" and paymentStatus = 'success' order by updated_time desc limit 1),'%d-%b-%Y')  as last_renewed_date, "
				+" (case duration_type when 'day' then (select datediff(date_add(u.package_joined_date, interval pack.duration day),current_date())) " 
                +"   	when 'month' then (select datediff(date_add(u.package_joined_date, interval pack.duration month),current_date())) "
                +" 		when 'year' then (select datediff(date_add(u.package_joined_date, interval pack.duration year),current_date())) "
                +" 		else -1101	"
                + "end "
                +") as validity  "
				+ "from users u, package pack where u.package_id = pack.id and pack.status = '1' and  u.id = "+objUserBean.getId();
		try {
			List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
			if(list!=null && list.size()>0){
				return list.get(0);
			}
			return null;
		} catch (Exception ge) {
			return null;
		} 
	}

	public UsersBean emailVerificationCheck(String email,String code) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * FROM users where  email=? AND `unique_code`=?  ";
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{email,code},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	public boolean updateEmailVerification(String email) {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update users set emailverify='1' where email = ?";
		int deleted_count = jdbcTemplate.update(sql, new Object[]{email});
		if(deleted_count>0){
			return true;
		}
		return false;
	}
	
	public UsersBean emailverifycationCheck(String email) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * FROM users where  email=? AND `emailverify`='0'  ";
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{email},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	public int updateMembershipStatusBasedOnValidity(){
		jdbcTemplate = custom.getJdbcTemplate();
		
		
		
		try {
			// get all the members whose membership plan validity will expire 1 or 4 or 7 days and send sms&mails
			String select_qry = "select * from (select u.id, "
					+ "(case duration_type when 'day' then (select datediff(date_add(u.package_joined_date, interval pack.duration day),current_date()))    "
					+ "	when 'month' then (select datediff(date_add(u.package_joined_date, interval pack.duration month),current_date()))  	"
					+ "	when 'year' then (select datediff(date_add(u.package_joined_date, interval pack.duration year),current_date()))  	"
					+ "	else -1	end ) as validity  from users u, package pack where u.package_id = pack.id and pack.status = '1' ) temp "
					+ " where temp.validity in (1,4,7)";
			List<Map<String,Object>> members_list = jdbcTemplate.queryForList(select_qry);
			for(Map<String,Object> member:members_list){
				//send bulk SMS and bulk email to all
				try{
					String days_str = ((Long)member.get("validity"))>1?"days":"day";
					SendSMS.sendSMS(" Dear member, your membership plan will expire in "+member.get("validity")+" "+days_str, member.get("mobile")+"");
				} catch (Exception ex) {
					ex.printStackTrace();
				} 
			}
			// Now update the status of all members whose plan is expired today i.e. on current date.
			String update_members = "select *,group_concat(temp.id) from (select u.id, "
					+ "(case duration_type when 'day' then (select datediff(date_add(u.package_joined_date, interval pack.duration day),current_date()))    "
					+ "	when 'month' then (select datediff(date_add(u.package_joined_date, interval pack.duration month),current_date()))  	"
					+ "	when 'year' then (select datediff(date_add(u.package_joined_date, interval pack.duration year),current_date()))  	"
					+ "	else -1	end ) as validity  from users u, package pack where u.package_id = pack.id and pack.status = '1' ) temp "
					+ " where temp.validity = 0";
			String members_ids = jdbcTemplate.queryForObject(update_members, String.class);
			String update_qry = " update users set membership_status = '0' where find_in_set(id,'"+members_ids+"')>0 ";
			int updated_count = jdbcTemplate.update(update_qry);
			return updated_count;
		} catch (Exception ge) {
			return 0;
		} 
		
	}

	public boolean profileVerifyedBy(int id,int sessionId) {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update users set profileVerifyedBy=? where id = ?";
		int deleted_count = jdbcTemplate.update(sql, new Object[]{sessionId,id});
		if(deleted_count>0){
			return true;
		}
		return false;
	}
	public List<UsersBean> bulksmsmail(ReportsBean objReportsBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
		 StringBuffer buffer = new StringBuffer();
					 buffer.append("SELECT * FROM users where 1=1  ");
					 if(StringUtils.isNotBlank(objReportsBean.getPackages())){
						 buffer.append(" and package_id in("+objReportsBean.getPackages()+")");
					 }
					 if(objReportsBean.getProfiles().equals("1")){
						 buffer.append(" and role_id in('4')");
					 }
					 if(objReportsBean.getProfiles().equals("2")){
						 buffer.append(" and status in('1') ");		 
					 }
					 if(objReportsBean.getTodate1() != null && objReportsBean.getFromdate1() != null){
						 buffer.append(" and Date(created_time) between Date('"+new java.sql.Timestamp(objReportsBean.getFromdate1().getTime())+"') and Date('"+new java.sql.Timestamp(objReportsBean.getTodate1().getTime())+ "') ");
					 }
			String sql = buffer.toString();
			System.out.println(sql);
			List<UsersBean> retlist = jdbcTemplate.query(sql,	new Object[]{},	ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist;
			return null;
		}
	
	public List<Map<String, Object>> getLoginUsers(){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		buffer.append("select   CASE WHEN u.status IN ('0') THEN 'In Active' WHEN u.status in ('1') THEN 'Active'  ELSE '-----' END as profileStatus,   u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,floor((datediff(current_date(),u.dob))/365) as age, IFNULL(p.name, 'Free Register') as planPackage,u.profileVerifyedBy,u.`last_login_time`,u.loginActive from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity left join package p on u.package_id = p.id "
				+"  WHERE DATE(u.`last_login_time`) =CURRENT_DATE  ");
			buffer.append(" group by u.id ");
							String sql =buffer.toString();
							System.out.println(sql);
							
							
							List<Map<String, Object>> result = jdbcTemplate.queryForList(sql);
							return result;
		
	
	}
	public List<Map<String, Object>> getPackageCount(){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		buffer.append("SELECT COUNT(`users`.`package_id`) as count, `package`.`name` FROM `users` RIGHT  JOIN `package`  ON (`package`.`id`=`users`.`package_id`) where `package`.`status` = '1' and `users`.`status` = '1'  GROUP BY `package`.`id` ");
							String sql =buffer.toString();
							System.out.println(sql);
							List<Map<String, Object>> result = jdbcTemplate.queryForList(sql);
							return result;
		
	
	}
	public List<Map<String, Object>> getFreeUsersCount(){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		buffer.append("SELECT COUNT(*) AS totalcount,'Free register' AS package FROM users WHERE role_id ='4'  and status = '1'");
							String sql =buffer.toString();
							System.out.println(sql);
							List<Map<String, Object>> result = jdbcTemplate.queryForList(sql);
							return result;
		
	
	}

	/*public List<Map<String, Object>> getActivitiesOf(String user_id, String profile_id){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		buffer.append("select * from users_activity_log where (act_done_by_user_id = "+user_id+" and act_done_on_user_id = "+profile_id+") or "  
					+"(act_done_by_user_id = "+profile_id+" and act_done_on_user_id = "+user_id+") order by created_time desc  ");
			
							String sql =buffer.toString();
							
							List<Map<String, Object>> result = jdbcTemplate.queryForList(sql);
							return result;
		
	
	}*/
	/*
	 * This function is used to display selected values as a string in UI 
	 */
	/*public Map<String,Object> getPartnerPreferencesValuesForUser(UsersBean userBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
		 StringBuffer buffer = new StringBuffer();
		 try{
			 buffer.append("SELECT * FROM users where 1=1  ");
			 String sql = buffer.toString();
			 Map<String,Object> valuesMap = jdbcTemplate.queryForMap(sql);
			 return valuesMap;
		 } 
		 catch (Exception ge) {
			return null;
		 } 
	}*/
	
	public List<Map<String, Object>> getNotifications(UsersBean objUserBean,boolean all_notifications){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		buffer.append("select *,(select concat(u.firstName,' ',u.lastName) from users u where u.id=user_notifications.user_id) as fullName, "
				+" (select u.username from users u where u.id=user_notifications.user_id) as userName,date_format(user_notifications.created_on,'%d-%M-%Y %H:%i') as created_on, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=user_notifications.user_id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage "
				+" from user_notifications where profile_id = "+objUserBean.getId()+" and user_type = 'member' "
				+"  and user_id in (select u.id from users u where u.id = user_id and u.status = '1' ) and user_notifications.read_status = '0' "
				+" and if(notifi_type='short_listed',((select count(*) from user_settings us where us.user_id =user_notifications.user_id and us.know_shortlisted_option = '1')=1),1) "
				+ " order by user_notifications.created_on desc ");
		if(!all_notifications){
			buffer.append(" limit 10 offset 0");
		}
		String sql =buffer.toString();
		
		List<Map<String, Object>> notifications = jdbcTemplate.queryForList(sql);
		return notifications;
		
	
	}
	public List<Map<String, Object>> getAdminNotifications(String notification_type,boolean all_notifications){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		buffer.append("select *,(select concat(u.firstName,' ',u.lastName) from users u where u.id=user_notifications.user_id) as fullName, "
				+" (select u.username from users u where u.id=user_notifications.user_id) as userName,date_format(user_notifications.created_on,'%d-%M-%Y') as created_on, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=user_notifications.user_id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage "
				+" from user_notifications where user_type = 'admin' and notifi_type = '"+notification_type+"' order by created_on desc ");
		if(!all_notifications){
			buffer.append(" limit 10 offset 0");
		}
		String sql =buffer.toString();
		
		List<Map<String, Object>> notifications = jdbcTemplate.queryForList(sql);
		return notifications;
		
	
	}
	public List<Map<String, Object>> getAdminNotifications(boolean all_notifications){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		buffer.append("select *,(select concat(u.firstName,' ',u.lastName) from users u where u.id=user_notifications.profile_id) as fullName, "
				+" (select u.username from users u where u.id=user_notifications.profile_id) as userName,date_format(user_notifications.created_on,'%d-%M-%Y') as created_on, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=user_notifications.profile_id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage "
				+" from user_notifications where user_type = 'admin'  order by created_on desc ");
		if(!all_notifications){
			buffer.append(" limit 10 offset 0");
		}
		String sql =buffer.toString();
		
		List<Map<String, Object>> notifications = jdbcTemplate.queryForList(sql);
		return notifications;
		
	
	}
	public boolean updateNotificationStatus(String notification_id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			boolean isStatusUpdate = false;
			try {
				String sSql = "update user_notifications set read_status = '1' where id = "+notification_id;
				int iCount = jdbcTemplate.update(sSql);
				if (iCount == 1) {
					isStatusUpdate = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
				return isStatusUpdate;
			} finally {

			}
			return isStatusUpdate;
		}
	public boolean addAdminNotifications(String profileId,String amount){
		jdbcTemplate = custom.getJdbcTemplate();
		boolean inserted = false;
		StringBuffer buffer = new StringBuffer();
		try {
			buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type,amount) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','admin',"+profileId+",3,'payment','"+amount+"')");;
			int iCount = jdbcTemplate.update(buffer.toString());
			if (iCount == 1) {
				inserted = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {

		}
		return inserted;
	}
	public boolean addAdminNotifications(String profileId){
		jdbcTemplate = custom.getJdbcTemplate();
		boolean inserted = false;
		StringBuffer buffer = new StringBuffer();
		try {
			buffer.append("insert into user_notifications(created_on,user_type,user_id,profile_id,notifi_type) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','admin',"+profileId+",3,'payment')");;
			int iCount = jdbcTemplate.update(buffer.toString());
			if (iCount == 1) {
				inserted = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {

		}
		return inserted;
	}
	
	public List<Map<String, Object>> paymentreporsData(ReportsBean objreReportsBean){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,ifnull(oc.name,'--') as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, ifnull(u.mobile,'---') as mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,floor((datediff(current_date(),u.dob))/365) as age, IFNULL(p.name, 'Free Register') as planPackage,p.price as price from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity left join package p on u.package_id = p.id "
				+" where 1=1  ");
		
					 if(StringUtils.isNotBlank(objreReportsBean.getPackages())){
						buffer.append( " and u.package_id ="+objreReportsBean.getPackages() );
					}
					if(StringUtils.isNotBlank(objreReportsBean.getFromdate()) && StringUtils.isNotBlank(objreReportsBean.getTodate())){
						buffer.append( " and Date(u.created_time) BETWEEN Date('"+new java.sql.Timestamp(objreReportsBean.getFromdate1().getTime())+"') AND Date('"+new java.sql.Timestamp(objreReportsBean.getTodate1().getTime())+"') " );
					}
					if(StringUtils.isNotBlank(objreReportsBean.getCaste())){
						buffer.append( " and u.caste="+objreReportsBean.getCaste() );
					}
						buffer.append( " and u.role_id not in ('4' ) ");
					
							buffer.append(" group by u.id ");
							buffer.append(" order by u.created_time desc ");
							String sql =buffer.toString();
							System.out.println(sql);
							
							
							List<Map<String, Object>> result = jdbcTemplate.queryForList(sql);
							return result;
		
	
	}
	
	public List<Map<String, Object>> getConversationsList(UsersBean objUserBean,String profile_id){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		buffer.append("select *,date_format(created_time,'%d-%b-%Y') as created_on from users_activity_log where (act_done_by_user_id = "+objUserBean.getId()+" and act_done_on_user_id = "+profile_id+") "
				+" or (act_done_by_user_id = "+profile_id+" and act_done_on_user_id = "+objUserBean.getId()+") "
				+ "and activity_type not in ('profile_viewed') order by created_time desc ");
		String sql =buffer.toString();
		
		List<Map<String, Object>> notifications = jdbcTemplate.queryForList(sql);
		return notifications;
		
	
	}
	
	public boolean deleteConversation(String id){

		jdbcTemplate = custom.getJdbcTemplate();
		String qry = "delete from users_activity_log where id = "+id;
		
		try{
			int count = jdbcTemplate.update(qry);
			if(count==1){
				return true;
			}
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return false;
	
	}
	
	public List<Map<String, Object>> getHomeSearchResult( UsersBean searchCriteriaBean){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		buffer.append("select u.id ,u.gender,u.age,u.firstName,u.lastName,u.aboutMyself as About,u.createProfileFor,c.name as castName,"
				+ "ct.name as cityName,rl.name as religionName,ed.name as Education,u.occupation as Proffession, u.annualIncome as Income, "
				+" floor((datediff(current_date(),u.dob))/365) as age, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" occ.name as Proffession "
				+" from users u,"
				+ " cast c,city ct,religion rl,education ed, occupation occ "
				+ " where  occ.id=u.occupation "
				+ "and  ct.id=u.currentCity  and ed.id=u.education and u.religion = rl.id and u.caste = c.id ");
		if(StringUtils.isNotBlank(searchCriteriaBean.getGender())) {
			buffer.append(" and   u.gender = '"+searchCriteriaBean.getGender()+"'"); 
		}
		if(StringUtils.isNotBlank(searchCriteriaBean.getrAgeFrom()) && StringUtils.isNotBlank(searchCriteriaBean.getrAgeTo())) {
			buffer.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) >= "+searchCriteriaBean.getrAgeFrom()+" ");
			buffer.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) <= "+searchCriteriaBean.getrAgeTo()+" ");
//			buffer.append(" and   ur.rAgeFrom='"+searchCriteriaBean.getrAgeFrom()+"' and ur.rAgeTo='"+searchCriteriaBean.getrAgeTo()+"'"); 
		}
		if(StringUtils.isNotBlank(searchCriteriaBean.getReligionId())) {
			buffer.append(" and   u.religion='"+searchCriteriaBean.getReligionId()+"'"); 
		}
		if(StringUtils.isNotBlank(searchCriteriaBean.getCastId())) {
			buffer.append(" and u.caste='"+searchCriteriaBean.getCastId()+"'"); 
		}
		buffer.append(" and u.status = '1' and u.role_id not in ('1') group by u.id order by u.package_id desc limit 20");
		String sql =buffer.toString();
		//System.out.println("-----sql----"+sql);
		List<Map<String, Object>> searchList = jdbcTemplate.queryForList(sql);
		return searchList;
		
	
	}
	
	public List<Map<String, Object>> getHomeSearchResult1( UsersBean searchCriteriaBean,String list_type){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		buffer.append("select u.id ,u.gender,u.age,u.firstName,u.lastName,u.aboutMyself as About,u.createProfileFor,c.name as castName,"
				+ "ct.name as cityName,rl.name as religionName,ed.name as Education,u.occupation as Proffession, u.annualIncome as Income, "
				+" floor((datediff(current_date(),u.dob))/365) as age, "
				+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
				+" occ.name as Proffession "
				+" from users u,"
				+ "cast c,city ct,religion rl,education ed, occupation occ "
				+ " where occ.id=u.occupation "
				+ " and ct.id=u.currentCity  and ed.id=u.education and u.religion=rl.id and u.caste = c.id ");
		if(list_type.equals("religion")) {
//			buffer.append (ur.rReligion = searchCriteriaBean.getReligionId() );
			buffer.append("and u.religion='"+searchCriteriaBean.getId()+"'"); 
		}
		if(list_type.equals("cast")) {
//			buffer.append (ur.rReligion = searchCriteriaBean.getReligionId() );
			buffer.append("and u.caste='"+searchCriteriaBean.getId()+"'"); 
		}
		buffer.append(" and u.status = '1' and u.role_id not in ('1') group by u.id order by u.package_id desc limit 20");
		String sql =buffer.toString();
		//System.out.println("-----sql----"+sql);
		List<Map<String, Object>> searchList = jdbcTemplate.queryForList(sql);
		return searchList;
		
	
	}
	
	@Transactional
	public boolean deleteNotification(int id,String mail_type) {
		jdbcTemplate = custom.getJdbcTemplate();
		boolean delete = false;
		if(mail_type.equalsIgnoreCase("member")){
			mail_type="member";
		}
		if(mail_type.equalsIgnoreCase("admin")){
			mail_type="admin";
		}
		try{
			String sql = "delete from user_notifications where id='"+id+"' and user_type='"+mail_type+"'";
			int intDelete = jdbcTemplate.update(sql, new Object[]{id});
			if(intDelete != 0){
				delete = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return delete;
	}
	
	@Transactional
	public boolean deleteALLNotification(String mail_type) {
		jdbcTemplate = custom.getJdbcTemplate();
		boolean delete = false;
		if(mail_type.equalsIgnoreCase("member")){
			mail_type="member";
		}
		if(mail_type.equalsIgnoreCase("admin")){
			mail_type="admin";
		}
		try{
			String sql = "delete from user_notifications where user_type='"+mail_type+"'";
			int intDelete = jdbcTemplate.update(sql, new Object[] {});
			if(intDelete != 0){
				delete = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return delete;
	}
	
	public List<Map<String, Object>> getRecentlyViewedProfiles(UsersBean objUserBean){
		return this.getRecentlyViewedProfiles(objUserBean, null);
	}
	
	public List<Map<String, Object>> getRecentlyViewedProfiles(UsersBean objUserBean,Map<String,String> filterOptions){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		StringBuffer where_clause = new StringBuffer(" u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+objUserBean.getId()+")");
		// filter results options
		if(filterOptions != null){
			if(StringUtils.isNotBlank(filterOptions.get("with_photo")) && ((String)filterOptions.get("with_photo")).equalsIgnoreCase("true")){
				where_clause.append(" and u.id in (select umg.user_id from vuser_images umg where umg.is_profile_picture = '1' and umg.approved_status = '1') ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("with_in_day")) && ((String)filterOptions.get("with_in_day")).equalsIgnoreCase("true")){
				where_clause.append(" and u.created_time between date_add(now(), interval -1 day) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("with_in_week")) && ((String)filterOptions.get("with_in_week")).equalsIgnoreCase("true")){
				where_clause.append(" and u.created_time between date_add(now(), interval -1 week) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("with_in_month")) && ((String)filterOptions.get("with_in_month")).equalsIgnoreCase("true")){
				where_clause.append(" and u.created_time between date_add(now(), interval -1 month) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("created_at_any_time")) && ((String)filterOptions.get("created_at_any_time")).equalsIgnoreCase("true")){
				//where_clause.append(" and u.created_time between date_add(now(), interval -1 month) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("age_from"))){
				where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) >= "+filterOptions.get("age_from")+" ");
				where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) <= "+filterOptions.get("age_to")+" ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("marital_status"))){
				where_clause.append( " and  FIND_IN_SET(u.maritalStatus,'"+filterOptions.get("marital_status")+"')>0    ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("height_from"))){
				where_clause.append( " and cast(u.height as unsigned) >= cast('"+filterOptions.get("height_from")+"' as unsigned ) ");
				where_clause.append( " and cast(u.height as unsigned) <= cast('"+filterOptions.get("height_to")+"' as unsigned ) ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("mother_tongue"))){
				where_clause.append( " and FIND_IN_SET(u.motherTongue,'"+filterOptions.get("mother_tongue")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("caste")) && !((String)filterOptions.get("caste")).equalsIgnoreCase("null")){
				where_clause.append( " and FIND_IN_SET(u.caste,'"+filterOptions.get("caste")+"')>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("education"))){
				where_clause.append( " and FIND_IN_SET(u.education,'"+filterOptions.get("education")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("occupation"))){
				where_clause.append( " and FIND_IN_SET(u.occupation,'"+filterOptions.get("occupation")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("annual_income"))){
				where_clause.append(" and FIND_IN_SET(u.annualIncome,'"+filterOptions.get("occupation")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("country"))){
				where_clause.append( " and FIND_IN_SET(u.currentCountry,'"+filterOptions.get("country")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("state"))){
				where_clause.append( " and FIND_IN_SET(u.currentState,'"+filterOptions.get("state")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("city")) && !((String)filterOptions.get("city")).equalsIgnoreCase("null")){
				where_clause.append( " and FIND_IN_SET(u.currentCity,'"+filterOptions.get("city")+"' )>0  ");
			}
		}
		///
		try{
			if(objUserBean.getRoleId()==MatrimonyConstants.AARNA_PREMIUM_USER_ROLE_ID 
					|| objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_USER_ROLE_ID
					|| objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_PLUS_USER_ROLE_ID 
					|| objUserBean.getRoleId()==MatrimonyConstants.CLASSIC_USER_ROLE_ID
					|| objUserBean.getRoleId()==MatrimonyConstants.LAUNCHING_OFFER_ROLE_ID
					|| objUserBean.getRoleId()==MatrimonyConstants.CLASSIC_PLUS_USER_ROLE_ID){
				buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
						+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
						+"u.currentState, u.currentCity, " 
						+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
						+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
						+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
						+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
						+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
						//+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
						+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
						//+" (select count(*) from (select count(*) from users u left join user_images uimg on u.id = uimg.user_id "+where_clause+" group by u.id) tmp) as total_records, "
						+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, u.createProfileFor, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
						+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
						+" from users u left join userrequirement ur on u.id=ur.userId "
						+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
						+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
						+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
						+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
						+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity, "
						+ "(select * from users_activity_log act where act.act_done_by_user_id = "+objUserBean.getId()+" and act.activity_type = 'profile_viewed') activity ");
						//+" where u.status not in ('0')   and u.id not in (select ei.profile_id from express_intrest ei where ei.user_id="+objUserBean.getId()+" and ei.mobile_no_viewed_status = '1')");
			}else{
				buffer.append("select u.id,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.gender, "
						//+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  " 
						+" u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  "
						+"u.maritalStatus, u.caste,c.name as casteName, u.education, u.aboutMyself, " 
						+" u.height ,h.inches,h.cm, ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
						//+" (select count(*) from users u "+where_clause+") as total_records, "
						+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, u.createProfileFor, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
						+" '0' as expressedInterest, '0' as message_sent_status,'0' as mobileNumViewed, GROUP_CONCAT(uimg.image) as image "
						+" from users u left join "
						+" religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join  "
						+" cast c on c.id=u.caste left join height h on h.id=u.height left join "
						+"  occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
						+ " left join city cit on cit.id=u.currentCity  left join user_images uimg on uimg.user_id=u.id,  "
						+ "(select * from users_activity_log act where act.act_done_by_user_id = "+objUserBean.getId()+" and act.activity_type = 'profile_viewed') activity ");
						//+" where u.status not in ('0')  ");
			} 
			buffer.append(" where  "+where_clause+" and u.id = activity.act_done_on_user_id group by u.id order by activity.created_time desc ");
		List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
		int total_records = 0;
		if(list.size()>0){
			//get total records count
			//String count_qry = "select count(1) from (select count(1) from users u left join user_images uimg on u.id = uimg.user_id where "+where_clause+" group by u.id) tmp ";
			//total_records = jdbcTemplate.queryForInt(count_qry);
			list.get(0).put("total_records", "10");//this value will be not used in jsp. so...
		}
		/*int total_records = 0;
		if(list.size()>0){
			//get total records count
			String count_qry = "select count(1) from (select count(1) from users u left join user_images uimg on u.id = uimg.user_id "+where_clause+" group by u.id) tmp ";
			total_records = jdbcTemplate.queryForInt(count_qry);
			list.get(0).put("total_records", total_records+"");
		}*/
		return list;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Map<String, Object>> getPremiumMembers(UsersBean objUserBean){
		return this.getPremiumMembers(objUserBean, null);
	}
	
	public List<Map<String, Object>> getPremiumMembers(UsersBean objUserBean,Map<String,String> filterOptions){

		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		StringBuffer where_clause = new StringBuffer(" u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+objUserBean.getId()+")");
		// filter results options
		if(filterOptions != null){
			if(StringUtils.isNotBlank(filterOptions.get("with_photo")) && ((String)filterOptions.get("with_photo")).equalsIgnoreCase("true")){
				where_clause.append(" and u.id in (select umg.user_id from vuser_images umg where umg.is_profile_picture = '1' and umg.approved_status = '1') ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("with_in_day")) && ((String)filterOptions.get("with_in_day")).equalsIgnoreCase("true")){
				where_clause.append(" and u.created_time between date_add(now(), interval -1 day) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("with_in_week")) && ((String)filterOptions.get("with_in_week")).equalsIgnoreCase("true")){
				where_clause.append(" and u.created_time between date_add(now(), interval -1 week) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("with_in_month")) && ((String)filterOptions.get("with_in_month")).equalsIgnoreCase("true")){
				where_clause.append(" and u.created_time between date_add(now(), interval -1 month) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("created_at_any_time")) && ((String)filterOptions.get("created_at_any_time")).equalsIgnoreCase("true")){
				//where_clause.append(" and u.created_time between date_add(now(), interval -1 month) and now() ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("age_from"))){
				where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) >= "+filterOptions.get("age_from")+" ");
				where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) <= "+filterOptions.get("age_to")+" ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("marital_status"))){
				where_clause.append( " and  FIND_IN_SET(u.maritalStatus,'"+filterOptions.get("marital_status")+"')>0    ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("height_from"))){
				where_clause.append( " and cast(u.height as unsigned) >= cast('"+filterOptions.get("height_from")+"' as unsigned ) ");
				where_clause.append( " and cast(u.height as unsigned) <= cast('"+filterOptions.get("height_to")+"' as unsigned ) ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("mother_tongue"))){
				where_clause.append( " and FIND_IN_SET(u.motherTongue,'"+filterOptions.get("mother_tongue")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("caste")) && !((String)filterOptions.get("caste")).equalsIgnoreCase("null")){
				where_clause.append( " and FIND_IN_SET(u.caste,'"+filterOptions.get("caste")+"')>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("education"))){
				where_clause.append( " and FIND_IN_SET(u.education,'"+filterOptions.get("education")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("occupation"))){
				where_clause.append( " and FIND_IN_SET(u.occupation,'"+filterOptions.get("occupation")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("annual_income"))){
				where_clause.append(" and FIND_IN_SET(u.annualIncome,'"+filterOptions.get("occupation")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("country"))){
				where_clause.append( " and FIND_IN_SET(u.currentCountry,'"+filterOptions.get("country")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("state"))){
				where_clause.append( " and FIND_IN_SET(u.currentState,'"+filterOptions.get("state")+"' )>0  ");
			}
			if(StringUtils.isNotBlank(filterOptions.get("city")) && !((String)filterOptions.get("city")).equalsIgnoreCase("null")){
				where_clause.append( " and FIND_IN_SET(u.currentCity,'"+filterOptions.get("city")+"' )>0  ");
			}
		}
		///
		try{
			if(objUserBean.getRoleId()==MatrimonyConstants.AARNA_PREMIUM_USER_ROLE_ID 
					|| objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_USER_ROLE_ID
					|| objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_PLUS_USER_ROLE_ID 
					|| objUserBean.getRoleId()==MatrimonyConstants.CLASSIC_USER_ROLE_ID
					|| objUserBean.getRoleId()==MatrimonyConstants.LAUNCHING_OFFER_ROLE_ID
					|| objUserBean.getRoleId()==MatrimonyConstants.CLASSIC_PLUS_USER_ROLE_ID){
				buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
						+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
						+"u.currentState, u.currentCity, " 
						+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
						+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
						+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
						+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
						+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
						//+" (select count(*) from express_intrest_view intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed, "
						+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
						//+" (select count(*) from (select count(*) from users u left join user_images uimg on u.id = uimg.user_id "+where_clause+" group by u.id) tmp) as total_records, "
						+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, u.createProfileFor, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
						+" (select highlight_profile from package where id = u.package_id) as profile_highlighter "
						+" from users u left join userrequirement ur on u.id=ur.userId "
						+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
						+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
						+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
						+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
						+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity ");
						//+" where u.status not in ('0')   and u.id not in (select ei.profile_id from express_intrest ei where ei.user_id="+objUserBean.getId()+" and ei.mobile_no_viewed_status = '1')");
			}else{
				buffer.append("select u.id,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.gender, "
						//+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  " 
						+" u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  "
						+"u.maritalStatus, u.caste,c.name as casteName, u.education, u.aboutMyself, " 
						+" u.height ,h.inches,h.cm, ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
						//+" (select count(*) from users u "+where_clause+") as total_records, "
						+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and  uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, u.createProfileFor, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+objUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as short_listed, "
						+" '0' as expressedInterest, '0' as message_sent_status,'0' as mobileNumViewed, GROUP_CONCAT(uimg.image) as image "
						+" from users u left join "
						+" religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join  "
						+" cast c on c.id=u.caste left join height h on h.id=u.height left join "
						+"  occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
						+ " left join city cit on cit.id=u.currentCity  left join user_images uimg on uimg.user_id=u.id ");
						//+" where u.status not in ('0')  ");
			} 
			where_clause.append(" and u.package_id in (select id from package where status = '1' ) ");
			buffer.append(" where  "+where_clause+"  group by u.id");
		List<Map<String,Object>> list = jdbcTemplate.queryForList(buffer.toString());
		int total_records = 0;
		if(list.size()>0){
			//get total records count
			String count_qry = "select count(1) from (select count(1) from users u left join user_images uimg on u.id = uimg.user_id  where "+where_clause+" group by u.id) tmp ";
			total_records = jdbcTemplate.queryForInt(count_qry);
			list.get(0).put("total_records", total_records+"");
		}
		return list;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean saveEmailData(UsersBean senderBean, UsersBean receiverBean,String baseurl,String mail_type) throws Exception{
		jdbcTemplate = custom.getJdbcTemplate();
		if(senderBean==null) {
			senderBean = new UsersBean();
		}
		StringBuffer sender_details = new StringBuffer();//senderBean.getAge()+" Yrs, "+senderBean.getHeight()+" Ft, "+senderBean.getReligionName()+", "+senderBean.getCasteName()+", <br> Location: "+senderBean.getCurrentCityName()+", <br> Education : "+senderBean.getEducationName()+", <br> Occupation : "+senderBean.getOccupationName()+" ");
		StringBuffer receiver_email = new StringBuffer();
		StringBuffer receiver_password = new StringBuffer();
		StringBuffer baseurllink = new StringBuffer(baseurl);
		// url formation
		String actionUrl = "";
		String sender_image = "";
		String short_str = "";
		String emailVerifylink="";
		if(mail_type.equalsIgnoreCase("shortlisted")){
			short_str = " shortlisted your profile";
			sender_details.append(senderBean.getAge()+" Yrs, "+senderBean.getHeight()+" Ft, "+senderBean.getReligionName()+", "+senderBean.getCasteName()+", <br> Location: "+senderBean.getCurrentCityName()+", <br> Education : "+senderBean.getEducationName()+", <br> Occupation : "+senderBean.getOccupationName()+" ");
			actionUrl = baseurl+"/fullProfile?un="+receiverBean.getUsername()+"&pun="+senderBean.getUsername()+"&suc="+receiverBean.getUnique_code()+"&puc="+senderBean.getUnique_code();
			sender_image = this.getProfilePicture(senderBean.getId());
		}else if(mail_type.equalsIgnoreCase("message_mail")){
			short_str = " sent you a personal message";
			sender_details.append(senderBean.getAge()+" Yrs, "+senderBean.getHeight()+" Ft, "+senderBean.getReligionName()+", "+senderBean.getCasteName()+", <br> Location: "+senderBean.getCurrentCityName()+", <br> Education : "+senderBean.getEducationName()+", <br> Occupation : "+senderBean.getOccupationName()+" ");
			actionUrl = baseurl+"/fullProfile?un="+receiverBean.getUsername()+"&pun="+senderBean.getUsername()+"&suc="+receiverBean.getUnique_code()+"&puc="+senderBean.getUnique_code();
			sender_image = this.getProfilePicture(senderBean.getId());
		}else if(mail_type.equalsIgnoreCase("profileviewed")){
			short_str = " viewed your profile";
			sender_details.append(senderBean.getAge()+" Yrs, "+senderBean.getHeight()+" Ft, "+senderBean.getReligionName()+", "+senderBean.getCasteName()+", <br> Location: "+senderBean.getCurrentCityName()+", <br> Education : "+senderBean.getEducationName()+", <br> Occupation : "+senderBean.getOccupationName()+" ");
			actionUrl = baseurl+"/fullProfile?un="+receiverBean.getUsername()+"&pun="+senderBean.getUsername()+"&suc="+receiverBean.getUnique_code()+"&puc="+senderBean.getUnique_code();
			sender_image = this.getProfilePicture(senderBean.getId());
		}else if(mail_type.equalsIgnoreCase("interestrequest")){
			short_str = " sent you an interest";					////////
			sender_details.append(senderBean.getAge()+" Yrs, "+senderBean.getHeight()+" Ft, "+senderBean.getReligionName()+", "+senderBean.getCasteName()+", <br> Location: "+senderBean.getCurrentCityName()+", <br> Education : "+senderBean.getEducationName()+", <br> Occupation : "+senderBean.getOccupationName()+" ");
			actionUrl = baseurl+"/fullProfile?un="+receiverBean.getUsername()+"&pun="+senderBean.getUsername()+"&suc="+receiverBean.getUnique_code()+"&puc="+senderBean.getUnique_code();
			sender_image = this.getProfilePicture(senderBean.getId());
		
		
		}else if(mail_type.equalsIgnoreCase("welcome_mail")){
			short_str = " Find Your Match Now";
			
		}else if(mail_type.equalsIgnoreCase("user_registered")){				
			short_str = " Dear  Admin";
		}else if(mail_type.equalsIgnoreCase("active_profile_mail")){
			short_str = "Your Profile is Active Now";
		}else if(mail_type.equalsIgnoreCase("admin_send_password")){
			short_str = "admin send password";
			receiver_password.append(receiverBean.getPassword());
		}else if(mail_type.equalsIgnoreCase("admin_reset_password")){
			short_str = "admin reset password";
			receiver_password.append(receiverBean.getPassword());
		}else if(mail_type.equalsIgnoreCase("change_password")){
			short_str = "change password";
		}else if(mail_type.equalsIgnoreCase("forgot_password")){
			short_str = "forgot password";
		}else if(mail_type.equalsIgnoreCase("emailVerify_mail")){
			short_str = "emailVerify  mail";
			emailVerifylink = baseurl+"/users/emailvarificationlink?email="+receiverBean.getEmail()+"&code="+receiverBean.getUnique_code();
		}
		else if(mail_type.equalsIgnoreCase("refer_friend")){
			short_str = " Get unlimited matches ";
			try{
				
				StringBuffer buffer = new StringBuffer(" insert into emails_data(sender_user_id,receiver_user_id,sender_email,receiver_display_name,sender_user_name,receiver_user_name,receiver_email,mail_content,status,type,full_profile_action_url,sender_image,receiver_password,shortstr,emailVerifylink,base_url,created_on) "
									+ "	values("+senderBean.getId()+","+receiverBean.getId()+",'"+senderBean.getEmail()+"','"+receiverBean.getFirstName()+" "+receiverBean.getLastName()+" ("+receiverBean.getUsername()+")','"+senderBean.getUsername()+"','"+receiverBean.getUsername()+"','"+receiverBean.getEmail()+"','"+receiverBean.getMail_content()+"','0','"+mail_type+"','"+actionUrl+"','"+sender_image+"','"+receiver_password+"','"+short_str+"','"+emailVerifylink+"','"+baseurllink+"',current_timestamp())");
				int inserted_count = jdbcTemplate.update(buffer.toString());
				if(inserted_count==1){
					return true;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		try{
			
			StringBuffer buffer = new StringBuffer(" insert into emails_data(sender_user_id,receiver_user_id,sender_email,sender_details,sender_display_name,receiver_display_name,sender_user_name,receiver_user_name,receiver_email,mail_content,status,type,full_profile_action_url,sender_image,receiver_password,shortstr,emailVerifylink,base_url,created_on) "
								+ "	values("+senderBean.getId()+","+receiverBean.getId()+",'"+senderBean.getEmail()+"','"+sender_details.toString()+"','"+senderBean.getFirstName()+" "+senderBean.getLastName()+" ("+senderBean.getUsername()+")','"+receiverBean.getFirstName()+" "+receiverBean.getLastName()+" ("+receiverBean.getUsername()+")','"+senderBean.getUsername()+"','"+receiverBean.getUsername()+"','"+receiverBean.getEmail()+"','"+receiverBean.getMail_content()+"','0','"+mail_type+"','"+actionUrl+"','"+sender_image+"','"+receiver_password+"','"+short_str+"','"+emailVerifylink+"','"+baseurllink+"',current_timestamp())");
			int inserted_count = jdbcTemplate.update(buffer.toString());
			if(inserted_count==1){
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Map<String,Object>> getEmailEntriesToSend(){
		jdbcTemplate = custom.getJdbcTemplate();
		List<Map<String,Object>> list = null;
		try{
			
			String  qry = " select *,DATE_FORMAT(created_on, '%d-%M-%Y') as created_on from emails_data where status = '0' "; // 0 means yet to send email
			list = jdbcTemplate.queryForList(qry);
			return list;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean updateEmailDeliveryStatus(int id,String status){
		jdbcTemplate = custom.getJdbcTemplate();
		
		try{
			
			StringBuffer buffer = new StringBuffer(" update emails_data set status = '"+status+"' where id = "+id);
			int updated_count = jdbcTemplate.update(buffer.toString());
			if(updated_count==1){
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public String getBaseUrl(){
		jdbcTemplate = custom.getJdbcTemplate();
		
		try{
			
			StringBuffer buffer = new StringBuffer(" select base_url from emails_data where  base_url is not null and base_url <> '' limit 1");
			String baseUrl = jdbcTemplate.queryForObject(buffer.toString(), String.class);
			if(StringUtils.isNotBlank(baseUrl)){
				return baseUrl.split("admin")[0];
			}
			return "";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public Map<String, Integer> getDisplayCounts(){
		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		Map<String, Integer> countsMap = new HashMap<String, Integer>();
		countsMap.put("inactive_count", 0);
		countsMap.put("updated_count", 0);
		try{
				String inactiveQry = "select count(1) from users u"
						+" where u.status in ('0') and u.role_id not in (1) and "
						+" ((select status from user_otps where user_id =u.id   and mobile_no = u.mobile order by user_otps.updated_time desc limit 1) is not null) "
						+" and ((select status from user_otps where user_id =u.id   and mobile_no = u.mobile order by user_otps.updated_time desc limit 1) <> '0') ";
				
				String updatedProfilesQry = "select count(1) from (select count(1) from vuser_images ui " 
						+" where ui.user_id in (select u.id from users u where u.status='1') and ui.status = '1' and ui.approved_status = '0' group by user_id) temp  ";

				int inactiveCount = jdbcTemplate.queryForInt(inactiveQry);
				int updatedProfilesCount = jdbcTemplate.queryForInt(updatedProfilesQry);
				countsMap.put("inactive_count", inactiveCount);
				countsMap.put("updated_count", updatedProfilesCount);
				return countsMap;
			}catch (Exception e) {
				e.printStackTrace();
				return null;
			}
	}
	
	public int getApprovalPendingPhotosOf(String user_id){
		jdbcTemplate = custom.getJdbcTemplate();
		
		try{
				StringBuffer buffer = new StringBuffer(" select count(1) from vuser_images ui where ui.user_id = "+user_id+" and ui.status = '1' and ui.approved_status = '0'");
				int count = 0;
				count = jdbcTemplate.queryForInt(buffer.toString());
				return count;
			}catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
	}
	
	public List<Map<String,Object>> getPreferredLocationProfiles(UsersBean userBean){
		jdbcTemplate = custom.getJdbcTemplate();
		List<Map<String,Object>> list = null;
		try{
			String rVal = userBean.getrCity();
			String where_clause = " 1 ";
			if(StringUtils.isNotBlank(rVal) && !rVal.equalsIgnoreCase("all") && !rVal.equalsIgnoreCase("any")) {
				where_clause = " find_in_set(u.currentCity,'"+rVal+"')>0 ";
			}
			String  qry = " select *,"
					+ " ifnull(floor((datediff(current_date(),dob))/365),'') as age,"
					+ " (select inches from height where id=u.height ) as heightInches ,"
					+ " (select name from city where id=u.currentCity) as currentCityName, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
					+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and uimg.status = '1' and uimg.is_profile_picture='1') as profileImage "
					+ " from users u, userrequirement ureq where ureq.userId = u.id and u.status = '1' and u.gender not in ('"+userBean.getGender()+"') and "+where_clause+" limit 2";
			list = jdbcTemplate.queryForList(qry);
			qry = " select count(1) from users u, userrequirement ureq where ureq.userId = u.id and u.status = '1' and u.gender not in ('"+userBean.getGender()+"') and "+where_clause;
			int count = jdbcTemplate.queryForInt(qry);
			if(count>0){
				list.get(0).put("list_size", count);
			}
			return list;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Map<String,Object>> getPreferredLocationProfilesAll(UsersBean userBean){
		jdbcTemplate = custom.getJdbcTemplate();
		List<Map<String,Object>> list = null;
		try{
			String rVal = userBean.getrCity();
			String where_clause = " 1 ";
			if(StringUtils.isNotBlank(rVal) && !rVal.equalsIgnoreCase("all") && !rVal.equalsIgnoreCase("any")) {
				where_clause = " find_in_set(u.currentCity,'"+rVal+"')>0 ";
			}
			String  qry = " select *,"
					+ " ifnull(floor((datediff(current_date(),dob))/365),'') as age,"
					+ " (select inches from height where id=u.height ) as heightInches ,"
					+ " (select name from city where id=u.currentCity) as currentCityName, "
					+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and uimg.status = '1' and uimg.is_profile_picture='1') as profileImage,"
					+ " (select name from religion where id=u.religion) as religionName, "
					+ " (select name from cast where id=u.caste) as castName, "
					+ " (select name from occupation where id=u.occupation) as occupationName, "
					+ " (select name from countries where id=u.currentCountry) as currentCountryName, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as shortlisted, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed "
					+ " from users u, userrequirement ureq where ureq.userId = u.id and u.status = '1' and u.gender not in ('"+userBean.getGender()+"') and "+where_clause;
			list = jdbcTemplate.queryForList(qry);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	public List<Map<String,Object>> getPreferredProfessionProfiles(UsersBean userBean){
		jdbcTemplate = custom.getJdbcTemplate();
		List<Map<String,Object>> list = null;
		try{
			String rVal = userBean.getrOccupation();
			String where_clause = " 1 ";
			String offset_str = " offset 2 ";
			if(StringUtils.isNotBlank(rVal) && !rVal.equalsIgnoreCase("all") && !rVal.equalsIgnoreCase("any")) {
				where_clause = " find_in_set(u.occupation,'"+rVal+"')>0 ";
				offset_str = "";
			}
			String  qry = " select *,"
					+ " ifnull(floor((datediff(current_date(),dob))/365),'') as age,"
					+ " (select inches from height where id=u.height ) as heightInches ,"
					+ " (select name from city where id=u.currentCity) as currentCityName, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
					+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and uimg.status = '1' and uimg.is_profile_picture='1') as profileImage "
					+ " from users u, userrequirement ureq where ureq.userId = u.id and u.status = '1' and u.gender not in ('"+userBean.getGender()+"') and "+where_clause+" limit 2 "+offset_str;
			list = jdbcTemplate.queryForList(qry);
			qry = " select count(1) from users u, userrequirement ureq where ureq.userId = u.id and u.status = '1' and u.gender not in ('"+userBean.getGender()+"') and "+where_clause;
			int count = jdbcTemplate.queryForInt(qry);
			if(count>0){
				list.get(0).put("list_size", count);
			}
			return list;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Map<String,Object>> getpreferredProfessionProfilesAll(UsersBean userBean){
		jdbcTemplate = custom.getJdbcTemplate();
		List<Map<String,Object>> list = null;
		try{
			String rVal = userBean.getrOccupation();
			String where_clause = " 1 ";
			if(StringUtils.isNotBlank(rVal) && !rVal.equalsIgnoreCase("all") && !rVal.equalsIgnoreCase("any")) {
				where_clause = " find_in_set(u.occupation,'"+rVal+"')>0 ";
			}
			String  qry = " select *,"
					+ " ifnull(floor((datediff(current_date(),dob))/365),'') as age,"
					+ " (select inches from height where id=u.height ) as heightInches ,"
					+ " (select name from city where id=u.currentCity) as currentCityName, "
					+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and uimg.status = '1' and uimg.is_profile_picture='1') as profileImage, "
					+ " (select name from religion where id=u.religion) as religionName, "
					+ " (select name from cast where id=u.caste) as castName, "
					+ " (select name from occupation where id=u.occupation) as occupationName, "
					+ " (select name from countries where id=u.currentCountry) as currentCountryName, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as shortlisted, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed "
					+ " from users u, userrequirement ureq where ureq.userId = u.id and u.status = '1' and u.gender not in ('"+userBean.getGender()+"') and "+where_clause;
			list = jdbcTemplate.queryForList(qry);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Map<String,Object>> getPreferredEducationProfiles(UsersBean userBean){
		jdbcTemplate = custom.getJdbcTemplate();
		List<Map<String,Object>> list = null;
		try{
			String rVal = userBean.getrEducation();
			String where_clause = " 1 ";
			String offset_str = " offset 4 ";
			if(StringUtils.isNotBlank(rVal) && !rVal.equalsIgnoreCase("all") && !rVal.equalsIgnoreCase("any")) {
				where_clause = " find_in_set(u.education,'"+rVal+"')>0 ";
				offset_str = "";
			}
			String  qry = " select *,"
					+ " ifnull(floor((datediff(current_date(),dob))/365),'') as age,"
					+ " (select inches from height where id=u.height ) as heightInches ,"
					+ " (select name from city where id=u.currentCity) as currentCityName, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
					+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and uimg.status = '1' and uimg.is_profile_picture='1') as profileImage "
					+ " from users u, userrequirement ureq where ureq.userId = u.id and u.status = '1' and u.gender not in ('"+userBean.getGender()+"') and "+where_clause+" limit 2 "+offset_str;
			list = jdbcTemplate.queryForList(qry);
			qry = " select count(1) from users u, userrequirement ureq where ureq.userId = u.id and u.status = '1' and u.gender not in ('"+userBean.getGender()+"') and  "+where_clause;
			int count = jdbcTemplate.queryForInt(qry);
			if(count>0){
				list.get(0).put("list_size", count);
			}
			return list;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Map<String,Object>> getPreferredEducationProfilesAll(UsersBean userBean){
		jdbcTemplate = custom.getJdbcTemplate();
		List<Map<String,Object>> list = null;
		try{
				String rVal = userBean.getrEducation();
				String where_clause = " 1 ";
				if(StringUtils.isNotBlank(rVal) && !rVal.equalsIgnoreCase("all") && !rVal.equalsIgnoreCase("any")) {
					where_clause = " find_in_set(u.education,'"+rVal+"')>0 ";
				}
			String  qry = " select *,"
					+ " ifnull(floor((datediff(current_date(),dob))/365),'') as age,"
					+ " (select inches from height where id=u.height ) as heightInches ,"
					+ " (select name from city where id=u.currentCity) as currentCityName, "
					+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and uimg.status = '1' and uimg.is_profile_picture='1') as profileImage,"
					+ " (select name from religion where id=u.religion) as religionName, "
					+ " (select name from cast where id=u.caste) as castName, "
					+ " (select name from occupation where id=u.occupation) as occupationName, "
					+ " (select name from countries where id=u.currentCountry) as currentCountryName, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as shortlisted, "
					+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed "
					+ " from users u, userrequirement ureq where ureq.userId = u.id and u.status = '1' and u.gender not in ('"+userBean.getGender()+"') and "+where_clause;
			list = jdbcTemplate.queryForList(qry);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Map<String,Object>> getSimilarProfiles(UsersBean presentProfile,UsersBean sessionBean){
		jdbcTemplate = custom.getJdbcTemplate();
		List<Map<String,Object>> list = null;
		try{
				String qry = " select *,"
						+ " ifnull(floor((datediff(current_date(),dob))/365),'') as age,"
						+ " (select inches from height where id=u.height ) as heightInches ,"
						+ " (select name from city where id=u.currentCity) as currentCityName, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+sessionBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
						+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and uimg.status = '1' and uimg.is_profile_picture='1') as profileImage "
						+ " from users u where u.status = '1' and u.gender ='"+presentProfile.getGender()+"' and  u.religion = "+presentProfile.getReligion()+" and u.caste =  "+presentProfile.getCaste()+" and u.id not in ("+presentProfile.getId()+") limit 2";
			list = jdbcTemplate.queryForList(qry);
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	public List<Map<String,Object>> getSimilarProfilesAll(UsersBean userBean,String profile_id,String gender,String religion_id,String caste_id){
		jdbcTemplate = custom.getJdbcTemplate();
		List<Map<String,Object>> list = null;
		try{
				String qry = " select *,"
						+ " ifnull(floor((datediff(current_date(),dob))/365),'') as age,"
						+ " (select inches from height where id=u.height ) as heightInches ,"
						+ " (select name from city where id=u.currentCity) as currentCityName, "
						+ " (select name from religion where id=u.religion) as religionName, "
						+ " (select name from cast where id=u.caste) as castName, "
						+ " (select name from occupation where id=u.occupation) as occupationName, "
						+ " (select name from countries where id=u.currentCountry) as currentCountryName, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'message') as message_sent_status, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'short_listed') as shortlisted, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+userBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'mobile_no_viewed') as mobileNumViewed ,"
						+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and uimg.status = '1' and uimg.is_profile_picture='1') as profileImage "
						+ " from users u where u.status = '1' and u.gender ='"+gender+"'  and u.religion = "+religion_id+" and u.caste =  "+caste_id+" and u.id not in "+'('+profile_id+')';
			list = jdbcTemplate.queryForList(qry);
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}
	
	public List<Map<String,Object>> getLatestUpdatedProfiles(UsersBean sessionUserBean){
		jdbcTemplate = custom.getJdbcTemplate();
		List<Map<String,Object>> list = null;
		try{
				String qry = "select *,if(data_updated_time=photo_updated_time,'photo','data') as updated_content from "
						+ " (select u.*,uimg.updated_on, date_format(updated_time,'%d-%b-%Y %h %p') as data_updated_time,max(updated_on), "
						+ " ifnull(floor((datediff(current_date(),dob))/365),'') as agee,"
						+ " (select inches from height where id=u.height ) as heightInches ,"
						+ " (select name from city where id=u.currentCity) as currentCityName, "
						+ " (select name from religion where id=u.religion) as religionName, "
						+ " (select name from cast where id=u.caste) as castName, "
						+ " (select name from occupation where id=u.occupation) as occupationName, "
						+ " (select name from countries where id=u.currentCountry) as currentCountryName, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+sessionUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
						+ " date_format(max(updated_on),'%d-%b-%Y %h %p') as photo_updated_time from users u left join vuser_images uimg on  u.id=uimg.user_id "
						+ " where u.status = '1' and u.gender not in ('"+sessionUserBean.getGender()+"') and uimg.status = '1' and uimg.approved_status = '1' "
						+" group by u.id order by u.updated_time desc limit 10) temp ";
						
				list =	jdbcTemplate.queryForList(qry);	
				if(list != null && list.size()>0){
					String user_ids = "";
					for(Map<String,Object> obj:list){
						user_ids += ","+obj.get("id");
					}
					if(StringUtils.isNotBlank(user_ids)){
						user_ids = user_ids.substring(1);
						qry = " select user_id,image,is_profile_picture from user_images where  find_in_set(user_id,'"+user_ids+"')>0 and is_profile_picture = '1' ";
						List<Map<String,Object>> profile_image_list = jdbcTemplate.queryForList(qry);
						if(profile_image_list != null && profile_image_list.size()>0){
							for(Map<String,Object> image_obj:profile_image_list){
								for(Map<String,Object> user_obj:list){
									String str1 = String.valueOf(((Integer)image_obj.get("user_id")));
									String str2 = String.valueOf(((Integer)user_obj.get("id")));
									//if(((Integer)image_obj.get("user_id"))==((Integer)user_obj.get("id"))){
									if(str1.equalsIgnoreCase(str2)){
										//user_obj.put("profileImage", image_obj.get("image"));
										Object tt = image_obj.get("image");
										user_obj.put("profileImage", image_obj.get("image")+"");
									}
								}
							}
						}
					}
					
				}
				return list;	
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public List<Map<String,Object>> getLatestUpdatedProfilesAll(UsersBean sessionUserBean){
		jdbcTemplate = custom.getJdbcTemplate();
		List<Map<String,Object>> list = null;
		try{
				String qry = "select *,if(data_updated_time=photo_updated_time,'photo','data') as updated_content from "
						+ " (select u.*,uimg.updated_on, date_format(updated_time,'%d-%b-%Y %h %p') as data_updated_time,max(updated_on), "
						+ " ifnull(floor((datediff(current_date(),dob))/365),'') as agee,"
						+ " (select inches from height where id=u.height ) as heightInches ,"
						+ " (select name from city where id=u.currentCity) as currentCityName, "
						+ " (select name from religion where id=u.religion) as religionName, "
						+ " (select name from cast where id=u.caste) as castName, "
						+ " (select name from occupation where id=u.occupation) as occupationName, "
						+ " (select name from countries where id=u.currentCountry) as currentCountryName, "
						+" (select count(1) from users_activity_log act_log where act_log.act_done_by_user_id="+sessionUserBean.getId()+" and act_log.act_done_on_user_id=u.id and act_log.activity_type = 'interest_request') as expressedInterest, "
						+ " date_format(max(updated_on),'%d-%b-%Y %h %p') as photo_updated_time from users u left join vuser_images uimg on  u.id=uimg.user_id "
						+ " where u.status = '1' and u.gender not in ('"+sessionUserBean.getGender()+"') and uimg.status = '1' and uimg.approved_status = '1' "
						+" group by u.id order by u.updated_time desc) temp ";
						
				list =	jdbcTemplate.queryForList(qry);	
				if(list != null && list.size()>0){
					String user_ids = "";
					for(Map<String,Object> obj:list){
						user_ids += ","+obj.get("id");
					}
					if(StringUtils.isNotBlank(user_ids)){
						user_ids = user_ids.substring(1);
						qry = " select user_id,image,is_profile_picture from user_images where  find_in_set(user_id,'"+user_ids+"')>0 and is_profile_picture = '1' ";
						List<Map<String,Object>> profile_image_list = jdbcTemplate.queryForList(qry);
						if(profile_image_list != null && profile_image_list.size()>0){
							for(Map<String,Object> image_obj:profile_image_list){
								for(Map<String,Object> user_obj:list){
									String str1 = String.valueOf(((Integer)image_obj.get("user_id")));
									String str2 = String.valueOf(((Integer)user_obj.get("id")));
									//if(((Integer)image_obj.get("user_id"))==((Integer)user_obj.get("id"))){
									if(str1.equalsIgnoreCase(str2)){
										//user_obj.put("profileImage", image_obj.get("image"));
										Object tt = image_obj.get("image");
										user_obj.put("profileImage", image_obj.get("image")+"");
									}
								}
							}
						}
					}
					
				}
				return list;	
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public List<Map<String,Object>> getLatestBridesAndGrooms(){
		jdbcTemplate = custom.getJdbcTemplate();
		List<Map<String,Object>> list = null;
		try{
			String  qry = " select * from (select *,"
					+ " (select inches from height where id=u.height ) as heightInches ,"
					+ " (select name from religion where id=u.religion) as religionName, "
					+ " (select name from city where id=u.currentCity) as currentCityName, "
					+"  (select st.name from state st where st.id = u.currentState) as currentStateName ,"
					+" (select uimg.image from vuser_images uimg where uimg.user_id=u.id and uimg.status = '1' and uimg.approved_status = '1' and uimg.is_profile_picture='1') as profileImage "
					+ " from users u where  u.status = '1'  order by created_time desc"
					+ " ) temp where profileImage is not null limit 10";
						
				list =	jdbcTemplate.queryForList(qry);	
				return list;	
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public UsersBean getUserByEmailId(String email_id) {
		 jdbcTemplate = custom.getJdbcTemplate();
		 try{
			 UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			int count = jdbcTemplate.queryForInt("select count(*) from users where email = ?", new Object[]{email_id});
			if(count==0){
				return null;
			}
			String sql = "SELECT *  FROM users where  email = ?";
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{email_id},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		 }catch (Exception e) {
				e.printStackTrace();
				return null;
			}
	}
	
	public boolean updateProfileFilledPercentage(String user_id,String percentage_val){
		jdbcTemplate = custom.getJdbcTemplate();
		String updateQry = " update users set profile_filled_percentage = '"+percentage_val+"'  where id = "+user_id;
		try{
			int count = jdbcTemplate.update(updateQry);
			if(count == 1){
				return true;
			}
			return false;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}

	}
	public int getPriceAfterConcession(String package_id,int package_price, String user_id){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "";
		int finalPrice = 0;
		try{
			String selectQry = "select count(*) from users where status = '1' and referred_by = '"+user_id+"' and profile_filled_percentage >= 80";
			int members_count = jdbcTemplate.queryForInt(selectQry);
			if(members_count>=MatrimonyConstants.REFERRED_MEMBERS_COUNT){
				float concession_amount = MatrimonyConstants.CONCESSION_PRECENTAGE / 100;
				concession_amount = package_price * concession_amount;
				finalPrice = Math.round(concession_amount);
			}else{
				finalPrice = package_price;
			}
			return finalPrice;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
}

