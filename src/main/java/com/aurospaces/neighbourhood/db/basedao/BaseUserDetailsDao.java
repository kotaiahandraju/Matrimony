
package com.aurospaces.neighbourhood.db.basedao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;

import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;

public class BaseUserDetailsDao {

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO userdetails ( created_time, updated_time, executiveName, SubCaste, raasi, star, padam, gotram, Religion, sLanguages, aboutYourself, educationDetails, educationInfo, Occupation, occupationDetails, sinceWorking, salaryperMonth, "
			+ "salaryperyear, foDetails, ffName, fnativeAddress, mnativeAddress, presentAddress, phone1, phone2, landLine, email2, moDetails, mfName, sibilings, property, aboutFamily, ncitizenOf, "
			+ "crCountry, visaType, stayingSince, visaValidity, ageGap, rHeightFrom, rHeightTo, rComplexion, rprofession, maritalStatus,userId,state,city,dosham,workingWith,companyName,diet,smoke,drink,bodyType,disability) "
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?,?,?,?,?,?,?,?,?,?,?)";

	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final UsersBean objUsersBean) {
		jdbcTemplate = custom.getJdbcTemplate();
		if (objUsersBean.getUpdatedTime() == null) {
			objUsersBean.setUpdatedTime(new Date());
		}
		final java.sql.Timestamp updatedTime = new java.sql.Timestamp(objUsersBean.getUpdatedTime().getTime());
		if (objUsersBean.getUserdetailsId() == 0) {

			KeyHolder keyHolder = new GeneratedKeyHolder();
			int update = jdbcTemplate.update(new PreparedStatementCreator() {
				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {

					if (objUsersBean.getCreatedTime() == null) {
						objUsersBean.setCreatedTime(new Date());
					}
					if (objUsersBean.getDob1() == null) {
						objUsersBean.setDob1(new Date());
					}
					if (objUsersBean.getLast_login1() == null) {
						objUsersBean.setLast_login1(new Date());
					}
					java.sql.Timestamp createdTime = new java.sql.Timestamp(objUsersBean.getCreatedTime().getTime());

					java.sql.Timestamp dob = new java.sql.Timestamp(objUsersBean.getDob1().getTime());

					java.sql.Timestamp last_login = new java.sql.Timestamp(objUsersBean.getLast_login1().getTime());

					PreparedStatement ps = connection.prepareStatement(INSERT_SQL, new String[] { "userdetailsId" });
					ps.setTimestamp(1, createdTime);
					ps.setTimestamp(2, updatedTime);
					ps.setString(3, objUsersBean.getExecutiveName());
					ps.setString(4, objUsersBean.getSubCaste());
					ps.setString(5, objUsersBean.getRaasi());
					ps.setString(6, objUsersBean.getStar());
					ps.setString(7, objUsersBean.getPadam());
					ps.setString(8, objUsersBean.getGotram());
					ps.setString(9, objUsersBean.getReligion());
					ps.setString(10, objUsersBean.getsLanguages());
					ps.setString(11, objUsersBean.getAboutYourself());
					ps.setString(12, objUsersBean.getEducationDetails());
					ps.setString(13, objUsersBean.getEducationInfo());
					ps.setString(14, objUsersBean.getOccupation());
					ps.setString(15, objUsersBean.getOccupationDetails());
					ps.setString(16, objUsersBean.getSinceWorking());
					ps.setString(17, objUsersBean.getSalaryperMonth());
					ps.setString(18, objUsersBean.getSalaryperyear());
					ps.setString(19, objUsersBean.getFoDetails());
					ps.setString(20, objUsersBean.getFfName());
					ps.setString(21, objUsersBean.getFnativeAddress());
					ps.setString(22, objUsersBean.getMnativeAddress());
					ps.setString(23, objUsersBean.getPresentAddress());
					ps.setString(24, objUsersBean.getPhone1());
					ps.setString(25, objUsersBean.getPhone2());
					ps.setString(26, objUsersBean.getLandLine());
					ps.setString(27, objUsersBean.getEmail2());
					ps.setString(28, objUsersBean.getMoDetails());
					ps.setString(29, objUsersBean.getMfName());
					ps.setString(30, objUsersBean.getSibilings());
					ps.setString(31, objUsersBean.getProperty());
					ps.setString(32, objUsersBean.getAboutFamily());
					ps.setString(33, objUsersBean.getNcitizenOf());
					ps.setString(34, objUsersBean.getCrCountry());
					ps.setString(35, objUsersBean.getVisaType());
					ps.setString(36, objUsersBean.getStayingSince());
					ps.setString(37, objUsersBean.getVisaValidity());
					ps.setString(38, objUsersBean.getAgeGap());
					ps.setString(39, objUsersBean.getrHeightFrom());
					ps.setString(40, objUsersBean.getrHeightTo());
					ps.setString(41, objUsersBean.getrComplexion());
					ps.setString(42, objUsersBean.getRprofession());
					ps.setString(43, objUsersBean.getMaritalStatus());
					ps.setInt(44, objUsersBean.getId());
					ps.setString(45, objUsersBean.getState());
					ps.setString(46, objUsersBean.getCity());
					ps.setString(47, objUsersBean.getDosham());
					ps.setString(48, objUsersBean.getWorkingWith());
					ps.setString(49, objUsersBean.getCompanyName());
					ps.setString(50, objUsersBean.getDiet());
					ps.setString(51, objUsersBean.getSmoke());
					ps.setString(52, objUsersBean.getDrink());
					ps.setString(53, objUsersBean.getBodyType());
					ps.setString(54, objUsersBean.getDisability());
					
//					state,city,dosham,workingWith,companyName,diet,smoke,drink,bodyType,disability
					return ps;
				}
			}, keyHolder);

			Number unId = keyHolder.getKey();
			objUsersBean.setUserdetailsId(unId.intValue());

		} else {

			String sql = "UPDATE userdetails SET userId =?, updated_time = ?, executiveName = ?, SubCaste = ?, raasi = ?, star = ?, padam = ?, gotram = ?, Religion = ?, sLanguages = ?, aboutYourself = ?, educationDetails = ?, educationInfo = ?, Occupation = ?, occupationDetails = ?, sinceWorking = ?, salaryperMonth = ?, salaryperyear = ?, foDetails = ?, ffName = ?, fnativeAddress = ?, mnativeAddress = ?, presentAddress = ?, phone1 = ?, phone2 = ?, landLine = ?, email2 = ?, moDetails = ?, mfName = ?, sibilings = ?, property = ?, aboutFamily = ?, ncitizenOf = ?, crCountry = ?, visaType = ?, stayingSince = ?, visaValidity = ?, ageGap = ?, rHeightFrom = ?, rHeightTo = ?, rComplexion = ?, rprofession = ?, maritalStatus = ?, "
					+ " state =?,city=?,dosham=?,workingWith=?,companyName=?,diet=?,smoke=?,drink=?,bodyType=?,disability=? WHERE userdetailsId=? ";

			jdbcTemplate
					.update(sql,
							new Object[] { objUsersBean.getId(), updatedTime, objUsersBean.getExecutiveName(),
									objUsersBean.getSubCaste(), objUsersBean.getRaasi(), objUsersBean.getStar(),
									objUsersBean.getPadam(), objUsersBean.getGotram(), objUsersBean.getReligion(),
									objUsersBean.getsLanguages(), objUsersBean.getAboutYourself(),
									objUsersBean.getEducationDetails(), objUsersBean.getEducationInfo(),
									objUsersBean.getOccupation(), objUsersBean.getOccupationDetails(),
									objUsersBean.getSinceWorking(), objUsersBean.getSalaryperMonth(),
									objUsersBean.getSalaryperyear(), objUsersBean.getFoDetails(),
									objUsersBean.getFfName(), objUsersBean.getFnativeAddress(),
									objUsersBean.getMnativeAddress(), objUsersBean.getPresentAddress(), objUsersBean.getPhone1(),
									objUsersBean.getPhone2(), objUsersBean.getLandLine(), objUsersBean.getEmail2(),
									objUsersBean.getMoDetails(), objUsersBean.getMfName(), objUsersBean.getSibilings(),
									objUsersBean.getProperty(), objUsersBean.getAboutFamily(),
									objUsersBean.getNcitizenOf(), objUsersBean.getCrCountry(),
									objUsersBean.getVisaType(), objUsersBean.getStayingSince(),
									objUsersBean.getVisaValidity(), objUsersBean.getAgeGap(),
									objUsersBean.getrHeightFrom(), objUsersBean.getrHeightTo(),
									objUsersBean.getrComplexion(), objUsersBean.getRprofession(),
									objUsersBean.getMaritalStatus(),
									objUsersBean.getState(),objUsersBean.getCity(),
									objUsersBean.getDosham(),objUsersBean.getWorkingWith(),
									objUsersBean.getCompanyName(),objUsersBean.getDiet(),
									objUsersBean.getSmoke(),objUsersBean.getDrink(),
									objUsersBean.getBodyType(),objUsersBean.getDisability(), objUsersBean.getUserdetailsId()});
		}
	}

	@Transactional
	public void delete(int id) {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "DELETE FROM userdetails WHERE id=?";
		jdbcTemplate.update(sql, new Object[] { id });
	}

	public UsersBean getById(int id) {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from userdetails where userId = ?";
		List<UsersBean> retlist = jdbcTemplate.query(sql, new Object[] { id },
				ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
		if (retlist.size() > 0)
			return retlist.get(0);
		return null;
	}

	public List<UsersBean> getAllProfiles() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from userdetails ";
		List<UsersBean> retlist = jdbcTemplate.query(sql, new Object[] {},
				ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}

}
