
package com.aurospaces.neighbourhood.db.dao;

import java.util.Date;
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





@Repository(value = "usersDao")
public class UsersDao extends BaseUsersDao
{
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	@Autowired HttpSession session;
	
	public UsersBean loginChecking(LoginBean objUsersBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT u.*,ureq.*,ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,  GROUP_CONCAT(uimg.image) as image, (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
							+" cst.name as casteName, rel.name as religionName, edu.name as educationName, curcity.name as currentCityName ,"
							+" occ.name as occupationName,  "
							+" DATE_FORMAT(u.dob, '%d-%M-%Y') as dob, DATE_FORMAT(u.created_time, '%d-%M-%Y') as createdTimeAsString, "
							+" date_format(last_login_time,'%d-%b-%Y %r') as last_login_time "
							+" FROM users u left join user_images uimg on uimg.user_id=u.id left join userrequirement ureq on ureq.userId=u.id  "
							+" left join cast cst on cst.id=u.caste left join religion rel on rel.id=u.religion "
							+" left join education edu on edu.id=u.education left join occupation occ on occ.id=u.occupation left join city curcity on curcity.id=u.currentCity "
							+" where  AES_DECRYPT(PASSWORD,'mykey')= ? and  (email =? or username=? or mobile=? )";
		 	System.out.println(sql);
			List<Map<String,Object>> list = jdbcTemplate.queryForList("select * from users where AES_DECRYPT(PASSWORD,'mykey')= ? and  (email =? or username=? or mobile=? )", new Object[]{objUsersBean.getPassword(),objUsersBean.getUserName(),objUsersBean.getUserName(),objUsersBean.getUserName()});
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
			String sql = "SELECT u.*,ureq.*,ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,  GROUP_CONCAT(uimg.image) as image, (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
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
							+" (select occup.name from occupation occup where occup.id = u.fOccupation) fOccupationName, "
							+" (select occup.name from occupation occup where occup.id = u.mOccupation) mOccupationName, "
							+" (select GROUP_CONCAT(rMaritalStatus) from userrequirement where userId = "+id+") as rMaritalStatusName, "
							+" (select GROUP_CONCAT(rel.name) from religion rel where find_in_set(rel.id,(select rReligion from userrequirement where userId = "+id+"))>0) as rReligionName, "
							+" (select GROUP_CONCAT(name) from cast where find_in_set(id,(select rCaste from userrequirement where userId = "+id+"))>0) as rCasteName, "
							+" (select GROUP_CONCAT(rDiet) from userrequirement where userId = "+id+") as rDietName, "
							+" (select GROUP_CONCAT(name) from language where find_in_set(id,(select rMotherTongue from userrequirement where userId = "+id+"))>0) as rMotherTongueName, "
							+" (select GROUP_CONCAT(name) from education where find_in_set(id,(select rEducation from userrequirement where userId = "+id+"))>0) as rEducationName, "
							+" (select GROUP_CONCAT(name) from occupation where find_in_set(id,(select rOccupation from userrequirement where userId = "+id+"))>0) as rOccupationName, "
							+" (select GROUP_CONCAT(name) from countries where find_in_set(id,(select rCountry from userrequirement where userId = "+id+"))>0) as rCountryName, "
							+" (select GROUP_CONCAT(name) from state where find_in_set(id,(select rState from userrequirement where userId = "+id+"))>0) as rStateName, "
							+" (select h.inches from height h where h.id = (select ur.rHeight from userrequirement ur where ur.userId = "+id+")) as rHeightInches, "
							+" (select h.inches from height h where h.id = (select ur.rHeightTo from userrequirement ur where ur.userId = "+id+")) as rHeightToInches, "
							+" (select count(*) from express_intrest intr where intr.user_id="+sessionBean.getId()+" and intr.profile_id="+id+"  and mobile_no_viewed_status='1') as mobileNumViewed " 
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
			buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
					+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
					+"u.currentState, u.currentCity, " 
					+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
					+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
					+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
					+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
					+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,floor((datediff(current_date(),u.dob))/365) as age, IFNULL(p.name, 'Free Register') as planPackage,u.profileVerifyedBy from users u left join userrequirement ur on u.id=ur.userId "
					+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
					+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
					+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
					+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
					+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity left join package p on u.package_id = p.id "
					+" where 1=1  ");
								
								if(type.equals("all")){
									buffer.append( " and u.status in( '1')" );
								}
								if(type.equals("delete")){
									buffer.append( " and u.status in( '2')" );
								}
								if(type.equals("inactive")){
									buffer.append( " and u.status in( '0') and u.role_id not in (1)" );
								}
								if(type.equals("admin")){
									buffer.append( " and u.registerwith is not null " );
								}
								if(type.equals("free")){
									buffer.append( " and u.role_id in ('4') " );
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
								if(type.equals("hidden")){
									buffer.append( " and u.status in( '3')" );
								}
								buffer.append(" group by u.id ");
								buffer.append(" order by u.created_time desc ");
								String sql =buffer.toString();
								System.out.println(sql);
								
								RowValueCallbackHandler handler = new RowValueCallbackHandler(new String[] {"id","currentStateName","currentCityName","occupation","occupationName","educationName","userrequirementId","image","created_time","updated_time",
										"role_id","username","password","email","createProfileFor","gender","firstName","lastName","dob","religion","religionName","motherTongue","motherTongueName","currentCountry","currentCountryName",
										"currentState","currentCity","maritalStatus",
										"caste","casteName","gotram","star","starName","dosam","dosamName","education","workingWith","companyName","annualIncome",
										"monthlyIncome","diet","smoking","drinking","height","inches","cm",
										"bodyType","bodyTypeName","complexion","complexionName","mobile","aboutMyself","disability",
										"status","showall","userId","rAgeFrom","rAgeTo","rHeight","rMaritalStatus","rReligion","requiredReligionName","rCaste","requiredCasteName","rMotherTongue","requiredMotherTongue","haveChildren","rCountry","requiredCountry","rState","rEducation","requiredEducationName",
										"rWorkingWith","rOccupation","requiredOccupationName","rAnnualIncome","rCreateProfileFor","rDiet","dobString","age","planPackage","profileVerifyedBy"});
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
							+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, ifnull(floor((datediff(current_date(),u.dob))/365),'') as age, DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString, "
							+" (select count(*) from users u "+where_clause+") as total_records, "
							+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage "
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
							+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id and interested='1') as expressedInterest, ifnull(u.age,'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString "
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
	 
	 public boolean expressInterestTo(String profileId){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				try{
					int updated_count = 0;
					int existing_count = jdbcTemplate.queryForInt("select count(*) from express_intrest ei where ei.user_id="+objUserBean.getId()+" and ei.profile_id="+profileId);
					if(existing_count==0){
						buffer.append("insert into express_intrest(user_id,profile_id,interested,created_on,intrest_to,allowed_profiles_limit) values(?,?,?,?,?,?)");
						updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{objUserBean.getId(),profileId,"1",
												new java.sql.Timestamp(new DateTime().getMillis()),profileId,MatrimonyConstants.PREMIUM_USER_PROFILES_LIMIT});
					}else if(existing_count>0){
						buffer.append("update express_intrest set interested = '1',created_on = ? where user_id = ? and profile_id = ?");
						updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{new java.sql.Timestamp(new DateTime().getMillis()),objUserBean.getId(),profileId});
					}
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
	 }
	 
	 public boolean viewedProfile(String profileId){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			int updated_count = 0;
			if(objUserBean!=null){
				try{
					int existing_count = jdbcTemplate.queryForInt("select count(*) from express_intrest ei where ei.user_id="+objUserBean.getId()+" and ei.profile_id="+profileId+" ");
					if(existing_count==0){
						buffer.append("insert into express_intrest(user_id,profile_id,created_on,profile_viewed_status) values(?,?,?,?)");
						updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{objUserBean.getId(),profileId,
												new java.sql.Timestamp(new DateTime().getMillis()),"1"});
					}else if(existing_count>0){
						String selectQry = "select count(*) from express_intrest ei where ei.user_id="+objUserBean.getId()+" and ei.profile_id="+profileId+" and profile_viewed_status = '1'";
						int viewed_count = jdbcTemplate.queryForInt(selectQry);
						if(viewed_count==0){
							buffer.append("update express_intrest set profile_viewed_status = '1',created_on = ? where user_id = ? and profile_id = ?");
							updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{new java.sql.Timestamp(new DateTime().getMillis()),objUserBean.getId(),profileId});
						}
					}
					if(updated_count > 0){
						int to_be_viewed = Integer.parseInt(objUserBean.getYetToBeViewedCount());
						objUserBean.setYetToBeViewedCount(to_be_viewed>0?(to_be_viewed-1)+"":"0");
						objUserBean.setViewedNotContactedCount((Integer.parseInt(objUserBean.getViewedNotContactedCount())+1)+"");
						session.setAttribute("cacheGuest",objUserBean);
					}
					
				}catch(Exception e){
					e.printStackTrace();
					return false;
				}
			}
			return false;
	 }
	 
	 public boolean shortlistProfile(String profileId){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				try{
					int existing_count = jdbcTemplate.queryForInt("select count(*) from express_intrest ei where ei.user_id="+objUserBean.getId()+" and ei.profile_id="+profileId+" ");
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
	 }
	 
	 @SuppressWarnings("deprecation")
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
	 }
	 
	 @SuppressWarnings("deprecation")
	public boolean acceptInterestRequests(String requestIds,String acceptFlag){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			String columnValue = acceptFlag.equals("1")?"2":"3";
			if(objUserBean!=null){
				try{
					int updated_count = jdbcTemplate.update("update express_intrest set status = '"+columnValue+"' where find_in_set(id,'"+requestIds+"')>0");
					if(updated_count>0){
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
					int count = jdbcTemplate.queryForInt("select count(*) from express_intrest ei where ei.user_id="+userId+" and mobile_no_viewed_status='1'");
					return count;
					
				}catch(Exception e){
					e.printStackTrace();
					return 0;
				}
	 }
	 public boolean viewMobileNumber(String profileId){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				try{
					int updated_count = 0;
					int existing_count = jdbcTemplate.queryForInt("select count(*) from express_intrest ei where ei.user_id="+objUserBean.getId()+" and ei.profile_id="+profileId+"");
					if(existing_count==0){
						buffer.append("insert into express_intrest(user_id,profile_id,mobile_no_viewed_status,created_on) values(?,?,?,?)");
						updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{objUserBean.getId(),profileId,"1",
								new java.sql.Timestamp(new DateTime().getMillis())});
						
					}else if(existing_count>0){
						buffer.append("update express_intrest set mobile_no_viewed_status = '1',created_on = ? where user_id = ? and profile_id = ?");
						updated_count = jdbcTemplate.update(buffer.toString(), new Object[]{new java.sql.Timestamp(new DateTime().getMillis()),objUserBean.getId(),profileId});
					}
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
	 }
	 
	 public List<Map<String, String>> getProfilesFilteredByPreferences(){
		 return this.getProfilesFilteredByPreferences(0);
	 }
	 
	 public List<Map<String, String>> getProfilesFilteredByPreferences(int page_no){
			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			StringBuffer where_clause = new StringBuffer(" where u.status in ('1') and u.role_id not in (1) ");
			String handlerObj[] = null;
			UsersBean objUserBean = null;
			objUserBean = (UsersBean) session.getAttribute("cacheUserBean");
			if(objUserBean==null)
				objUserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objUserBean!=null){
				
				String tempQryStr = " from userrequirement ureq where ureq.userId = "+objUserBean.getId()+" ";
				where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) >= if((select ureq.rAgeFrom "+tempQryStr+")='' or (select ureq.rAgeFrom "+tempQryStr+") is null,floor((datediff(current_date(),u.dob))/365),(select ureq.rAgeFrom "+tempQryStr+"))");
				where_clause.append( " and cast(floor((datediff(current_date(),u.dob))/365) as decimal(10,2)) <= if((select ureq.rAgeTo "+tempQryStr+")='' or (select ureq.rAgeTo "+tempQryStr+") is null,floor((datediff(current_date(),u.dob))/365),(select ureq.rAgeTo "+tempQryStr+"))");
				//buffer.append( " and u.age between (select ureq.rAgeFrom "+tempQryStr+") and (select ureq.rAgeTo "+tempQryStr+")  ") ;
				where_clause.append( " and cast(u.height as unsigned) >= cast(ifnull(if((select ureq.rHeight "+tempQryStr+" )='' or (select ureq.rHeight "+tempQryStr+" )='all' or (select ureq.rHeight  "+tempQryStr+" ) is null,null,(select ureq.rHeight  "+tempQryStr+" )),u.height) as unsigned ) ");
				where_clause.append( " and cast(u.height as unsigned) <= cast(ifnull(if((select ureq.rHeightTo "+tempQryStr+" )='' or (select ureq.rHeightTo "+tempQryStr+" )='all' or (select ureq.rHeightTo  "+tempQryStr+" ) is null,null,(select ureq.rHeightTo  "+tempQryStr+" )),u.height) as unsigned ) ");
				where_clause.append( " and  FIND_IN_SET(u.maritalStatus,if((select ureq.rMaritalStatus "+tempQryStr+" )='' or (select ureq.rMaritalStatus "+tempQryStr+" )='all' or (select ureq.rMaritalStatus  "+tempQryStr+" ) is null,u.maritalStatus,(select ureq.rMaritalStatus  "+tempQryStr+" ))) > 0    ");
				where_clause.append( " and FIND_IN_SET(u.caste,if((select ureq.rCaste "+tempQryStr+" )='' or (select ureq.rCaste "+tempQryStr+" )='all' or (select ureq.rCaste  "+tempQryStr+" ) is null,u.caste,(select ureq.rCaste  "+tempQryStr+" )))>0  ");
				where_clause.append( " and FIND_IN_SET(u.currentCountry,if((select ureq.rCountry "+tempQryStr+" )='' or (select ureq.rCountry "+tempQryStr+" )='all' or (select ureq.rCountry  "+tempQryStr+" ) is null,u.currentCountry,(select ureq.rCountry  "+tempQryStr+" ))) > 0 ");
				where_clause.append( " and FIND_IN_SET(u.education,if((select ureq.rEducation "+tempQryStr+" )='' or (select ureq.rEducation "+tempQryStr+" )='all' or (select ureq.rEducation "+tempQryStr+" )='any'  or (select ureq.rEducation  "+tempQryStr+" ) is null,u.education,(select ureq.rEducation  "+tempQryStr+" ))) > 0  ");
				//buffer.append( " and u.occupation = ifnull((select ureq.rOccupation "+tempQryStr+"),u.occupation) ");
				
				if(objUserBean.getRoleId()!=1){
					where_clause.append(" and u.gender not in  ('"+objUserBean.getGender()+"') ");
					where_clause.append(" and u.id not in  ("+objUserBean.getId()+") ");
					//buffer.append(" and u.status not in  ('0') ");
				}
				
				if(objUserBean.getRoleId()==MatrimonyConstants.AARNA_PREMIUM_USER_ROLE_ID 
						|| objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_USER_ROLE_ID
						|| objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_PLUS_USER_ROLE_ID 
						|| objUserBean.getRoleId()==MatrimonyConstants.CLASSIC_USER_ROLE_ID
						|| objUserBean.getRoleId()==MatrimonyConstants.CLASSIC_PLUS_USER_ROLE_ID){
					
					buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,ifnull(oc.name,'') as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
							+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
							+"u.currentState, u.currentCity, " 
							+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
							+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
							+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
							+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
							+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
							+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
							+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
							//+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
							+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
							+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
							+" (select count(*) from users u "+where_clause+") as total_records, u.createProfileFor,  "
							+" (select ifnull((select short_listed from express_intrest where user_id = "+objUserBean.getId()+" and profile_id = u.id),0)) as short_listed "
							//+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage "
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
							"rWorkingWith","rOccupation","requiredOccupationName","rAnnualIncome","rCreateProfileFor","rDiet","expressedInterest","mobileNumViewed","age","dobString","total_records","profileImage","createProfileFor","short_listed"};
				}else{
					buffer.append("select u.id,cit.name as currentCityName,u.occupation,ifnull(oc.name,'') as occupationName,ed.name as educationName,co.name as currentCountryName, u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.gender, "
							//+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  " 
							+" u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  "
							+"u.maritalStatus, u.caste,c.name as casteName, u.education, " 
							+" u.height ,h.inches,h.cm, ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
							+" (select count(*) from users u "+where_clause+") as total_records, "
							+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, u.createProfileFor,  "
							+" (select ifnull((select short_listed from express_intrest where user_id = "+objUserBean.getId()+" and profile_id = u.id),0)) as short_listed, "
							+" '0' as expressedInterest, '0' as mobileNumViewed "
							+" from users u left join "
							+" religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join  "
							+" cast c on c.id=u.caste left join height h on h.id=u.height left join "
							+"  occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
							+ " left join city cit on cit.id=u.currentCity left join countries co on co.id=u.currentCountry ");
							//+" where u.status not in ('0')   ");
					handlerObj = new String[] {"id","currentCityName","occupation","occupationName","educationName","currentCountryName","created_time","updated_time",
							"role_id","username","password","email","gender","dob","religion","religionName","motherTongue","motherTongueName",
							"maritalStatus",
							"caste","casteName","education","height","inches","cm","age","dobString","total_records","profileImage","createProfileFor","short_listed","expressedInterest","mobileNumViewed"};
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
					
					buffer.append(" group by u.id ");
					
					int page_size = MatrimonyConstants.PAGINATION_SIZE;
					buffer.append(" order by u.package_id desc limit "+page_size+" offset "+(page_no*page_size)+" ");
					
					
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
								System.out.println(sql);
								
								RowValueCallbackHandler handler = new RowValueCallbackHandler(handlerObj);
								jdbcTemplate.query(sql, handler);
								List<Map<String, String>> result = handler.getResult();
								return result;
			}
			return new LinkedList<Map<String, String>>();
	 }
	 
	 public List<Map<String, String>> getSearchResults(UsersBean searchCriteriaBean,int page_no,String listType){
		 return this.getSearchResults(searchCriteriaBean, page_no, listType, null, null, null);
	 }
	 
	 public List<Map<String, String>> getSearchResults(UsersBean searchCriteriaBean,int page_no,String listType,String withPhoto,String alreadyViewed,String alreadyContacted){
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
					where_clause.append( " and upper(u.username) like upper('%"+searchCriteriaBean.getUsername()+"%')  ");
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
					if(StringUtils.isNotBlank(searchCriteriaBean.getrMaritalStatus())){
						where_clause.append( " and  FIND_IN_SET(u.maritalStatus,'"+searchCriteriaBean.getrMaritalStatus()+"')>0    ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrReligion())){
						where_clause.append( " and FIND_IN_SET(u.education,'"+searchCriteriaBean.getrEducation()+"')>0  ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrCaste())){
						where_clause.append( " and FIND_IN_SET(u.caste,'"+searchCriteriaBean.getrCaste()+"')>0  ");
					}
					if(StringUtils.isNotBlank(searchCriteriaBean.getrEducation())){
						where_clause.append( " and FIND_IN_SET(u.education,'"+searchCriteriaBean.getrEducation()+"' )>0  ");
					}
				}
				if(objUserBean.getRoleId()!=1){
					where_clause.append(" and u.gender not in  ('"+objUserBean.getGender()+"') ");
					where_clause.append(" and u.id not in  ("+objUserBean.getId()+") ");
				}
				
				// add checkboxes criteria also
				if(StringUtils.isNotBlank(withPhoto) && withPhoto.equalsIgnoreCase("true")){
					where_clause.append(" and image is not null and image not in ('') and uimg.approved_status = '1'");
				}
				if(StringUtils.isNotBlank(alreadyViewed) && alreadyViewed.equalsIgnoreCase("true")){
					where_clause.append(" and u.id not in(select exp.profile_id from express_intrest exp where exp.user_id = "+objUserBean.getId()+" and exp.profile_viewed_status = '1') ");
				}
				if(StringUtils.isNotBlank(alreadyContacted) && alreadyContacted.equalsIgnoreCase("true")){
					where_clause.append(" and u.id not in(select exp.profile_id from express_intrest exp where exp.user_id = "+objUserBean.getId()+" and (exp.mobile_no_viewed_status = '1' or exp.interested = '1')) ");
				}
				//
				
				if(objUserBean.getRoleId()==MatrimonyConstants.AARNA_PREMIUM_USER_ROLE_ID 
						|| objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_USER_ROLE_ID
						|| objUserBean.getRoleId()==MatrimonyConstants.PREMIUM_PLUS_USER_ROLE_ID 
						|| objUserBean.getRoleId()==MatrimonyConstants.CLASSIC_USER_ROLE_ID
						|| objUserBean.getRoleId()==MatrimonyConstants.CLASSIC_PLUS_USER_ROLE_ID){
					buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
							+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
							+"u.currentState, u.currentCity, " 
							+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
							+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
							+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
							+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
							+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
							+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
							+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
							+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
							+" (select count(*) from (select count(*) from users u left join user_images uimg on u.id = uimg.user_id "+where_clause+" group by u.id) tmp) as total_records, "
							+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, u.createProfileFor, "
							+" (select ifnull((select short_listed from express_intrest where user_id = "+objUserBean.getId()+" and profile_id = u.id),0)) as short_listed "
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
							"status","showall","userId","rAgeFrom","rAgeTo","rHeight","rMaritalStatus","rReligion","requiredReligionName","rCaste","requiredCasteName","rMotherTongue","requiredMotherTongue","haveChildren","rCountry","requiredCountry","rState","rEducation","requiredEducationName",
							"rWorkingWith","rOccupation","requiredOccupationName","rAnnualIncome","rCreateProfileFor","rDiet","expressedInterest","mobileNumViewed","age","dobString","total_records","profileImage","createProfileFor","short_listed"};
				}else{
					where_clause.append(" and u.status in ('1')    ");
					buffer.append("select u.id,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.gender, "
							//+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  " 
							+" u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  "
							+"u.maritalStatus, u.caste,c.name as casteName, u.education, u.aboutMyself, " 
							+" u.height ,h.inches,h.cm, ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
							+" (select count(*) from users u "+where_clause+") as total_records, "
							+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, u.createProfileFor, "
							+" (select ifnull((select short_listed from express_intrest where user_id = "+objUserBean.getId()+" and profile_id = u.id),0)) as short_listed, "
							+" '0' as expressedInterest, '0' as mobileNumViewed, GROUP_CONCAT(uimg.image) as image "
							+" from users u left join "
							+" religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join  "
							+" cast c on c.id=u.caste left join height h on h.id=u.height left join "
							+"  occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
							+ " left join city cit on cit.id=u.currentCity  left join user_images uimg on uimg.user_id=u.id  ");
							//+" where u.status not in ('0')  ");
					handlerObj = new String[] {"id","currentCityName","occupation","occupationName","educationName","created_time","updated_time",
							"role_id","username","password","email","gender","dob","religion","religionName","motherTongue","motherTongueName",
							"maritalStatus",
							"caste","casteName","education","aboutMyself","height","inches","cm","age","dobString","total_records","profileImage","createProfileFor","short_listed","expressedInterest","mobileNumViewed","image"};
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
			
					/*String tempQryStr = " from userrequirement ureq where ureq.userId = "+objUserBean.getId()+" ";
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
					if(StringUtils.isNotBlank("listType") && "newmatches".equalsIgnoreCase(listType)){
						buffer.append(" order by u.updated_time desc limit "+page_size+" offset "+(page_no*page_size)+" ");
					}else{
						buffer.append(" order by u.package_id desc limit "+page_size+" offset "+(page_no*page_size)+" ");
					}
					
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
								System.out.println(sql);
								
								RowValueCallbackHandler handler = new RowValueCallbackHandler(handlerObj);
								jdbcTemplate.query(sql, handler);
								List<Map<String, String>> result = handler.getResult();
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
		
		public boolean mobileNumExistOrNot(UsersBean  objUsersBean) {
			 jdbcTemplate = custom.getJdbcTemplate();
				String sql = "SELECT count(*) FROM users where mobile = ? and status = '1' and id not in ("+objUsersBean.getId()+")";
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
		
		public List<Map<String,Object>>  getPaymentDetailsForPrint(String transactionId){
			jdbcTemplate = custom.getJdbcTemplate();
			try{
				String qryStr = "select u.firstName,u.lastName,u.email,ph.price,ph.paymentStatus,ph.remarks,DATE_FORMAT(ph.updated_time, '%d-%M-%Y') as paymentDate,ph.txid as transactionId from users u, paymenthistory ph where ph.memberId = u.id and ph.txid = '"+transactionId+"' ";
				List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
				return list;
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}
			//return null;
		}
		
		public Map<String,Object> getInterestCounts(UsersBean objUserBean){
			jdbcTemplate = custom.getJdbcTemplate();
			int userId = objUserBean.getId();
			/*String qryStr = "select (select count(*) from express_intrest where user_id = "+userId+" and interested = '1' and status in ('0','1')) as sentInterestCount, "
						+"(select count(*) from express_intrest where profile_id = "+userId+" and interested = '1' and status = '1') as receivedInterestCount, "
						+"(select count(*) from express_intrest where user_id = "+userId+" and status = '2') as acceptedInterestCount, "
						+"(select count(*) from express_intrest where profile_id = "+userId+" and profile_viewed_status = '1') as profileViewedCount";*/
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
								+" (select count(*) from  users u,express_intrest  ei where u.id = ei.user_id and ei.profile_id = "+userId+" and ei.interested = '1' and ei.status = '1' and "+subStr+" ) as pendingRequestsCount, "
								+" (select count(*) from  users u where u.id not in (select ei.profile_id from express_intrest ei where ei.user_id = "+userId+" and ei.profile_viewed_status = '1') "
								+" 	 and "+subStr+"  ) as yetToBeViewedCount, "
								+" (select count(*) from users u,express_intrest ei where u.id=ei.profile_id and ei.user_id = "+userId+" and ei.profile_viewed_status = '1' and ei.mobile_no_viewed_status = '0' and ei.interested='0' "
								+"   and "+subStr+" ) as viewedNotContactedCount, "
								+" (select count(*) from  users u,express_intrest  ei where u.id = ei.user_id and ei.profile_id = "+userId+" and ei.short_listed = '1' and "+subStr+" ) as shortListedCount ";
					
			try{
				List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
				if(list!=null)
					return list.get(0);
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}
			return null;
		}
		
		public List<Map<String,Object>> getAllActiveUsers(){
			jdbcTemplate = custom.getJdbcTemplate();
			String qryStr = "select * from users where status = '1' and role_id not in (1) ";
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
			buffer.append("select u.id,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.gender, "
					+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName,  " 
					+"u.maritalStatus, u.caste,c.name as casteName, u.education, " 
					+" u.height ,h.inches,h.cm,u.annualIncome,cntry.name as countryName, ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString, u.createProfileFor, u.unique_code   " 
					+" from users u left join "
					+" religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join  "
					+" cast c on c.id=u.caste left join height h on h.id=u.height left join "
					+"  occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
					+ " left join city cit on cit.id=u.currentCity left join countries cntry on cntry.id = u.currentCountry "
					+" where u.status  in ('1')  ");
					handlerObj = new String[] {"id","currentCityName","occupation","occupationName","educationName","created_time","updated_time",
							"role_id","username","password","email","gender","firstName","lastName","dob","religion","religionName","motherTongue","motherTongueName",
							"maritalStatus",
							"caste","casteName","education","height","inches","cm","annualIncome","countryName","age","dobString","createProfileFor","unique_code"};
			
					String tempQryStr = " from userrequirement ureq where ureq.userId = "+profile.get("id")+" ";
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
			
			//return new LinkedList<Map<String, String>>();
	 }
		
	public List<Map<String,Object>> getUserPhotos(int userId){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select * from user_images where user_id = "+userId+" and status = '1' order by id desc";
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
		String qryStr = "select id,image,approved_status from user_images where user_id = "+userId+" and status = '1' and approved_status = '1' order by id ";
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
	// called from admin login
	public List<Map<String,Object>> getInterestRequests(int page_no){
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
	}
	
	public List<Map<String,Object>> getReceivedInterestRequests(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as fromName,date_format(created_on,'%d-%M-%Y') as receivedOn, "
				+" (select count(*) from express_intrest ei where ei.profile_id = "+userId+" and ei.interested = '1' and status = '1') as total_records "
				+" from express_intrest where profile_id = "+userId+" and interested = '1' and status = '1' order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");*/
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
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
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
	}
	
	public List<Map<String,Object>> getPendingInterestRequests(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
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
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
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
	}
	
	public List<Map<String,Object>> getProfileViewedMembers(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*String where_clause = "ei.user_id = u.id and ei.profile_id = "+userId+" and ei.profile_viewed_status = '1'";
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " ei.user_id = u.id and ei.profile_id = "+userId+" and ei.profile_viewed_status = '1' and u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")  ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
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
	}
	
	public List<Map<String,Object>> getShortlistedMeMembers(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*String where_clause = "ei.user_id = u.id and ei.profile_id = "+userId+" and ei.profile_viewed_status = '1'";
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " ei.user_id = u.id and ei.profile_id = "+userId+" and ei.short_listed = '1' and u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
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
	}
	
	public List<Map<String,Object>> getShortlistedByMeMembers(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*String where_clause = "ei.user_id = u.id and ei.profile_id = "+userId+" and ei.profile_viewed_status = '1'";
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " ei.user_id = "+userId+" and ei.profile_id = u.id and ei.short_listed = '1' and u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")  ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from users u,express_intrest ei where "+inner_where_clause+") as total_records "
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
	}
	
	public List<Map<String,Object>> getMyMobileNoViewedByMembers(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*String where_clause = "ei.user_id = u.id and ei.profile_id = "+userId+" and ei.profile_viewed_status = '1'";
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " ei.user_id = u.id and ei.profile_id = "+userId+" and ei.mobile_no_viewed_status = '1' and u.role_id not in (1) and u.status in ('1')  and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")  ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
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
	}
	
	public List<Map<String,Object>> getMobileNumViewedByMeList(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*String where_clause = "ei.user_id = u.id and ei.profile_id = "+userId+" and ei.profile_viewed_status = '1'";
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " ei.profile_id = u.id and ei.user_id = "+userId+" and ei.mobile_no_viewed_status = '1' and u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
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
	}
	/****   I accepted      ****/
	public List<Map<String,Object>> getacceptedRequests(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as receivedOn, "
				+" (select count(*) from express_intrest ei where ei.user_id = "+userId+" and ei.interested = '1' and status = '2') as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status = '2' order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " ei.user_id = u.id and ei.profile_id = "+userId+" and ei.interested = '1' and ei.status = '2' and u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
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
	}
	
	/****   others accepted    ****/
	public List<Map<String,Object>> getRequestsAcceptedMe(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as receivedOn, "
				+" (select count(*) from express_intrest ei where ei.user_id = "+userId+" and ei.interested = '1' and status = '2') as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status = '2' order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");*/
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
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
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
	}
	
	public List<Map<String,Object>> getRequestsRejectedByMe(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as receivedOn, "
				+" (select count(*) from express_intrest ei where ei.user_id = "+userId+" and ei.interested = '1' and status = '2') as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status = '2' order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");*/
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
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
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
	}
	
	public List<Map<String,Object>> getRequestsRejectedMe(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as receivedOn, "
				+" (select count(*) from express_intrest ei where ei.user_id = "+userId+" and ei.interested = '1' and status = '2') as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status = '2' order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " ei.profile_id = u.id and ei.user_id = "+userId+" and ei.interested = '1' and ei.status = '3' and u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
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
	}
	
	public List<Map<String,Object>> getsentRequests(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as sentOn, "
				+" (select count(*) from express_intrest ei where ei.profile_id = "+userId+" and ei.interested = '1' and status in ('0','1')) as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status in ('0','1') order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " ei.profile_id = u.id and ei.user_id = "+userId+" and ei.interested = '1' and u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
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
	}
	
	public List<Map<String,Object>> getAwaitingRequests(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as sentOn, "
				+" (select count(*) from express_intrest ei where ei.profile_id = "+userId+" and ei.interested = '1' and status in ('0','1')) as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status in ('0','1') order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " ei.profile_id = u.id and ei.user_id = "+userId+" and ei.interested = '1' and ei.status in ('0','1')  and u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+")";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') ");
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
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
	}
	
	public List<Map<String,Object>> getyetToBeViewedList(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as sentOn, "
				+" (select count(*) from express_intrest ei where ei.profile_id = "+userId+" and ei.interested = '1' and status in ('0','1')) as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status in ('0','1') order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " u.id not in (select ei.profile_id from express_intrest ei where ei.user_id = "+userId+" and ei.profile_viewed_status = '1')  ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ");
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from users u where "+inner_where_clause+" "+where_clause+") as total_records, "
				+" (select ifnull((select short_listed from express_intrest where user_id = "+objUserBean.getId()+" and profile_id = u.id),0)) as short_listed "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity  "
				+"    where "+inner_where_clause+" ");
		
		buffer.append(where_clause);
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
	
	public List<Map<String,Object>> getViewedNotContactedList(String userId,int page_no){
		jdbcTemplate = custom.getJdbcTemplate();
		/*StringBuffer qryStrBuffer = new StringBuffer("select *,(select username from users where id=user_id) as username,date_format(created_on,'%d-%M-%Y') as sentOn, "
				+" (select count(*) from express_intrest ei where ei.profile_id = "+userId+" and ei.interested = '1' and status in ('0','1')) as total_records "
				+" from express_intrest where user_id = "+userId+" and interested = '1' and status in ('0','1') order by created_on desc  ");
		int page_size = MatrimonyConstants.PAGINATION_SIZE;
		qryStrBuffer.append(" limit "+page_size+" offset "+(page_no*page_size)+" ");
		StringBuffer qryStrBuffer = new StringBuffer("select u.*,ei.*,(select count(*) from users u,express_intrest ei where "+where_clause+") as total_records from users u, express_intrest ei where "+where_clause+" order by ei.created_on desc  ");*/
		UsersBean objUserBean = (UsersBean) session.getAttribute("cacheGuest");
		StringBuffer buffer = new StringBuffer();
		String inner_where_clause = " ei.profile_id = u.id and ei.user_id = "+userId+" and ei.user_id = "+userId+" and ei.profile_viewed_status = '1' and ei.mobile_no_viewed_status = '0' and ei.interested='0' ";
		StringBuffer where_clause = new StringBuffer(" and u.role_id not in (1) and u.status in ('1') and u.gender not in  ('"+objUserBean.getGender()+"') and u.id not in  ("+userId+") ");
		buffer.append("select u.id,sta.name as currentStateName,cit.name as currentCityName,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
				+"u.firstName, u.lastName, u.dob, u.religion,re.name as religionName, u.motherTongue,l.name as motherTongueName, u.currentCountry,co.name as currentCountryName, " 
				+"u.currentState, u.currentCity, " 
				+"u.maritalStatus, u.caste,c.name as casteName, u.gotram, u.star,s.name as starName, u.dosam, u.dosamName, u.education, u.workingWith, u.companyName, " 
				+"u.annualIncome, u.monthlyIncome, u.diet, u.smoking, u.drinking, u.height ,h.inches,h.cm, u.bodyType,b.name as bodyTypeName, u.complexion,com.name as complexionName, u.mobile, " 
				+"u.aboutMyself, u.disability, u.status, u.showall,ur.userId, rAgeFrom, rAgeTo, "
				+"rHeight, rMaritalStatus, rReligion,re1.name as requiredReligionName, rCaste,c1.name as requiredCasteName, rMotherTongue,l1.name as requiredMotherTongue,haveChildren,rCountry , con1.name as requiredCountry,rState,rEducation,e1.name as requiredEducationName, "
				+"rWorkingWith,rOccupation,oc1.name as requiredOccupationName,rAnnualIncome,rCreateProfileFor,rDiet,"
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and interested='1') as expressedInterest, "
				+" (select count(*) from express_intrest intr where intr.user_id="+objUserBean.getId()+" and intr.profile_id=u.id  and mobile_no_viewed_status='1') as mobileNumViewed, "
				+" ifnull(floor((datediff(current_date(),u.dob))/365),'') as age,DATE_FORMAT(u.dob, '%d-%M-%Y') as dobString,  "
				//+" (select count(*) from users u "+where_clause+") as total_records, "
				+" (select uimg.image from user_images uimg where uimg.user_id=u.id and uimg.is_profile_picture='1') as profileImage, "
				+" (select count(*) from users u,express_intrest ei where "+inner_where_clause+" "+where_clause+ ") as total_records, "
				+" (select ifnull((select short_listed from express_intrest where user_id = "+objUserBean.getId()+" and profile_id = u.id),0)) as short_listed "
				+" from users u left join userrequirement ur on u.id=ur.userId "
				+"left join religion re on re.id=u.religion left join language l on l.id=u.motherTongue left join countries co on co.id=u.currentCountry "
				+"left join cast c on c.id=u.caste left join star s on s.id =u.star left join height h on h.id=u.height left join body_type b on b.id=u.bodyType left join religion re1  on re1.id=rReligion "
				+"left join complexion com on com.id =u.complexion left join cast c1 on c1.id=rCaste left join language l1 on l1.id=rMotherTongue "
				+"left join countries con1 on con1.id=rCountry left join education e1 on e1.id=rEducation left join occupation oc1 on oc1.id=rOccupation  left join user_images uimg on uimg.user_id=u.id left join occupation oc on u.occupation=oc.id left join education ed on ed.id=u.education "
				+ " left join state sta on sta.id=u.currentState left join city cit on cit.id=u.currentCity,  "
				+"  express_intrest ei  where "+inner_where_clause+" ");
		
		buffer.append(where_clause);
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
						+" (select count(*) from (select * from user_images ui where  "+inner_where_clause+" group by ui.user_id) tt) as total_count  from user_images ui " 
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
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {

		}
		return false;
	}
public boolean deletePhoto(String photoId){
		
		jdbcTemplate = custom.getJdbcTemplate();
		String sSql  = null;
		
		try {
			sSql = "update user_images set status = '0' where id =  "+photoId;
			
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
			sSql = "select image from user_images where user_id =  "+userId+" and is_profile_picture = '1'";
			
			String image = jdbcTemplate.queryForObject(sSql, String.class);
			return image;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		} finally {

		}
	}
	
	public List<Map<String,Object>> getPackageExpiredProfiles(int package_id){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select u.*,p.*,date_format(package_joined_date,'%d-%M-%Y') as package_joined_date from users u, package p  where u.package_id = p.id and p.id = "+package_id+" and current_date() > (select DATE_ADD((DATE_ADD(u.package_joined_date, INTERVAL p.duration MONTH)), INTERVAL -1 day)) group by u.package_id order by u.package_id desc";
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
	
	public int getAllowedProfilesLimit(int userId){
		jdbcTemplate = custom.getJdbcTemplate();
		String qryStr = "select allowed_profiles_limit from package where id = (select u.package_id from users u where u.id="+userId+")";
		try{
			int allowed_profiles_limit = jdbcTemplate.queryForInt(qryStr);
			qryStr = "select count(*) from express_intrest where user_id = "+userId+" and (mobile_no_viewed_status = '1' or interested = '1')";
			int viewed_profiles = jdbcTemplate.queryForInt(qryStr);
			return (allowed_profiles_limit-viewed_profiles);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
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
						
						buffer.append( " and u.role_id ='4' " );
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
		String qryStr = "select *,(select (date_add(u.package_joined_date, interval pack.duration month))) as renewal_date, "
				+" (select date(updated_time) from paymenthistory where memberId = "+objUserBean.getId()+" and paymentStatus = 'success' order by updated_time desc limit 1)  as last_renewed_date, "
				+" (select datediff(date_add(u.package_joined_date, interval pack.duration month),current_date())) as validity from users u, package pack where u.package_id = pack.id and u.id = "+objUserBean.getId();
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
		String sql = "update users set membership_status = '0' where datediff(date_add(package_joined_date, interval (select pack.duration from package pack where pack.id=package_id) month),current_date())<=0";
		try {
			int updated_count = jdbcTemplate.update(sql);
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
						 buffer.append(" and status in('1')");		 
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
		buffer.append("SELECT COUNT(`users`.`package_id`), `package`.`name` FROM `users` RIGHT OUTER JOIN `package`  ON (`package`.`id`=`users`.`package_id`) GROUP BY `users`.`package_id` ");
							String sql =buffer.toString();
							System.out.println(sql);
							List<Map<String, Object>> result = jdbcTemplate.queryForList(sql);
							return result;
		
	
	}

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
}

