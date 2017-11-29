
package com.aurospaces.neighbourhood.db.dao;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aurospaces.neighbourhood.bean.AutoCompleteBean;
import com.aurospaces.neighbourhood.bean.CastBean;
import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.HeightBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.PaymentBean;
import com.aurospaces.neighbourhood.bean.ReligionBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseUsersDao;
import com.aurospaces.neighbourhood.db.callback.RowValueCallbackHandler;
import com.aurospaces.neighbourhood.util.MatrimonyConstants;





@Repository(value = "paymentDao")
public class PaymentDao
{
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	@Autowired HttpSession session;
	
	@Transactional
	public boolean save(PaymentBean paymentBean){
		jdbcTemplate = custom.getJdbcTemplate();
		try{
			String insert_qry = "insert into payments(packageId,executiveName,paidAmount,validFrom,note) "
						+" values('"+paymentBean.getPackageId()+"','"+paymentBean.getExecutiveName()+"','"+paymentBean.getPaidAmount()+"','"+paymentBean.getValidFrom()+"','"+paymentBean.getNote()+"')";
			System.out.println(insert_qry);
			int inserted_count = jdbcTemplate.update(insert_qry);
			int roleId = 0;
			if(Integer.parseInt(paymentBean.getPackageId())==MatrimonyConstants.PACKAGE_LIFETIME){
				roleId = 11;
			}else {
				roleId = 6;
			}
//			String update_qry = "update users set role_id = "+roleId+" where id = "+;
			if(inserted_count==1)
				return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return false;
	}
	 
}

