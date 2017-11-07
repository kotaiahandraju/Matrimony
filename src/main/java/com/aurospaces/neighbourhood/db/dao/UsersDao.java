
package com.aurospaces.neighbourhood.db.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.AutoCompleteBean;
import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.HeightBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseusersDao;
import com.aurospaces.neighbourhood.db.callback.RowValueCallbackHandler;





@Repository(value = "usersDao")
public class UsersDao extends BaseusersDao
{
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	@Autowired HttpSession session;
	 public UsersBean loginChecking(LoginBean objUsersBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * FROM users where  AES_DECRYPT(PASSWORD,'mykey')= ? and  email =? ";
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objUsersBean.getPassword(),objUsersBean.getUserName()},
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
			buffer.append("select u.id,u.occupation,oc.name as occupationName,ed.name as educationName,ur.userrequirementId,GROUP_CONCAT(uimg.image) as image,u.created_time, u.updated_time, u.role_id, u.username, u.password, u.email, u.createProfileFor,u.gender, "
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
								buffer.append(" group by u.id ");
								String sql =buffer.toString();
								System.out.println(sql);
								
								RowValueCallbackHandler handler = new RowValueCallbackHandler(new String[] {"id","occupation","occupationName","educationName","userrequirementId","image","created_time","updated_time",
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

}

