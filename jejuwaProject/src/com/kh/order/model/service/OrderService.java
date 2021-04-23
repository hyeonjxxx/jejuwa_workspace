package com.kh.order.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.order.model.dao.OrderDao;
import com.kh.order.model.vo.Order;

public class OrderService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new OrderDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	// 페이징 처리하는 ArrayList
	public ArrayList<Order> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Order> list = new OrderDao().selectList(conn, pi);
		
		close(conn);
		return list;
		
		
	}
	
	// 주문 테이블 조회
	public ArrayList<Order> selectOrderList(){
		Connection conn = getConnection();
		
		ArrayList<Order> list = new OrderDao().selectOrderList(conn);
		
		close(conn);
		
		return list;
	}
	
	public int insertOrder(Order o) {
		Connection conn = getConnection();
		
		int result = new OrderDao().insertOrder(conn, o);
		
		//int orderNo = 0;
		if(result>0) {
			
			//orderNo = new OrderDao().selectOrderNo(conn);
			
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public Order selectOrder(int orderNo) {
		Connection conn = getConnection();
		
		Order o = new OrderDao().selectOrder(conn, orderNo);
		close(conn);
		return o;
	}
}
