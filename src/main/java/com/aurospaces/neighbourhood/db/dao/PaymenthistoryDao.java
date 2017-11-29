
package com.aurospaces.neighbourhood.db.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.Paymenthistory;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BasePaymenthistoryDao;




@Repository(value = "paymenthistoryDao")
public class PaymenthistoryDao extends BasePaymenthistoryDao
{
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ;
	 public boolean pamentStatusUpdate(Paymenthistory objPaymenthistory) {
		 boolean isUpdate =false;
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "update paymenthistory set remarks =?,paymentStatus=? where txid=?  ";
			int  retlist = jdbcTemplate.update(sql,  new Object[] {objPaymenthistory.getRemarks(), objPaymenthistory.getPaymentStatus(),objPaymenthistory.getTxid() });
			if(retlist>0){
				isUpdate= true;
			}
			return isUpdate;
		}
	 public boolean pamentStatusUpdate1(Paymenthistory objPaymenthistory) {
		 boolean isUpdate =false;
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "update paymenthistory set remarks =?,paymentStatus=? where txid=?  ";
			int  retlist = jdbcTemplate.update(sql,  new Object[] {objPaymenthistory.getRemarks(), objPaymenthistory.getPaymentStatus(),objPaymenthistory.getTxid() });
			if(retlist>0){
				isUpdate= true;
			}
			return isUpdate;
		}

}

