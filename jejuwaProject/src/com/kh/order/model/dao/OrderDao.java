package com.kh.order.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.order.model.vo.Order;

public class OrderDao {

	private Properties prop = new Properties();
	
	public OrderDao() {
		String fileName = OrderDao.class.getResource("/sql/order/order-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Order> selectOrderList(Connection conn){
		
		ArrayList<Order> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Order(rset.getInt("ORDER_NO"),
								   rset.getDate("ORDER_DATE"),
								   rset.getInt("AMOUNT"),
								   rset.getDate("TRAVEL_DATE"),
								   rset.getString("MEM_NAME"),
								   rset.getString("TRAVEL_EMAIL"),
								   rset.getString("STATUS"),
								   rset.getString("C_REASON"),
								   rset.getInt("MEM_NO")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
}
