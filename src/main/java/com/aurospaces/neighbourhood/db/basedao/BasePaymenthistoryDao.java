
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

import com.aurospaces.neighbourhood.bean.Paymenthistory;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BasePaymenthistoryDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

 
	public final String INSERT_SQL = "INSERT INTO paymenthistory( created_time, updated_time, memberId, price, paymentType, paymentStatus, txid, remarks, bankRefNum) values (?, ?, ?, ?, ?, ?, ?, ?, ?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final Paymenthistory paymenthistory) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(paymenthistory.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(paymenthistory.getCreatedTime() == null)
					{
					paymenthistory.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(paymenthistory.getCreatedTime().getTime()); 
							
					if(paymenthistory.getUpdatedTime() == null)
					{
					paymenthistory.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(paymenthistory.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, paymenthistory.getMemberId());
ps.setDouble(4, paymenthistory.getPrice());
ps.setString(5, paymenthistory.getPaymentType());
ps.setString(6, paymenthistory.getPaymentStatus());
ps.setString(7, paymenthistory.getTxid());
ps.setString(8, paymenthistory.getRemarks());
ps.setString(9, paymenthistory.getBankRefNum());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				paymenthistory.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE paymenthistory  set memberId = ? ,price = ? ,paymentType = ? ,paymentStatus = ? ,txid = ? ,remarks = ? ,bankRefNum = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{paymenthistory.getMemberId(),paymenthistory.getPrice(),paymenthistory.getPaymentType(),paymenthistory.getPaymentStatus(),paymenthistory.getTxid(),paymenthistory.getRemarks(),paymenthistory.getBankRefNum(),paymenthistory.getId()});
		}
	}
		
		@Transactional
		public void delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM paymenthistory WHERE id=?";
			jdbcTemplate.update(sql, new Object[]{id});
		}
		

	 public Paymenthistory getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from paymenthistory where id = ? ";
			List<Paymenthistory> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(Paymenthistory.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
