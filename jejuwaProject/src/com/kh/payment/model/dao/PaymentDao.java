package com.kh.payment.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.payment.model.vo.Payment;
import static com.kh.common.JDBCTemplate.*;

public class PaymentDao {

	private Properties prop = new Properties();
	
	public PaymentDao() {
		
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Payment> selectPayment(Connection conn){
		
		ArrayList<Payment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPayment");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Payment(rset.getInt("MEM_NO"),
									 rset.getInt("ORDER_NO"),
									 rset.getInt("AMOUNT"),
									 rset.getDate("ACCOUNT_DAY"),
									 rset.getString("P_METHOD"),
									 rset.getString("CASH_RECEIPT"),
									 rset.getString("CARD"),
									 rset.getString("SALES"),
									 rset.getInt("KEY_NO"),
									 rset.getString("P_NAME"),
									 rset.getDate("travel_date"),
									 rset.getString("mem_name"),
									 rset.getString("phone"),
									 rset.getString("email"),
									 rset.getString("cpn_Name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
