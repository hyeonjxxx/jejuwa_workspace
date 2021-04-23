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

import com.kh.common.model.vo.PageInfo;
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
	/**
	 * 
	 * @param conn
	 * @return
	 */
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Order> selectList(Connection conn, PageInfo pi){
		
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (pi.getCurrentPage()-1)* pi.getBoardLimit()+1);
			pstmt.setInt(2, pi.getCurrentPage()*pi.getBoardLimit());
			
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
								   rset.getInt("MEM_NO"),
								   rset.getString("P_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
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
								   rset.getInt("MEM_NO"),
								   rset.getString("P_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public int insertOrder(Connection conn, Order o) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, o.getOrderNo());
			pstmt.setInt(2, o.getAmount());
			pstmt.setDate(3, o.getTravelDate());
			pstmt.setString(4, o.getTravelUser());
			pstmt.setString(5, o.getTravelEmail());
			pstmt.setInt(6, o.getMemNo());
			pstmt.setString(7, o.getpCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
}
