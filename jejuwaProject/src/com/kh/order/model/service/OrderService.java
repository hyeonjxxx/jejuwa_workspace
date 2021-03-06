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
import com.kh.product.model.dao.ProductDao;

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
	
	// 주문 테이블 조회, 취소내역페이지 조회, 취소내역상세페이지 조회
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
	
	public int orderCount(String pCode, int memNo) {
		Connection conn = getConnection();
		int result = new OrderDao().orderCount(conn, pCode, memNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	// 예약상세내역
	
	public Order selectReservation(int orderNo) {
		Connection conn = getConnection();
		
		Order o = new OrderDao().selectReservation(conn, orderNo);
		close(conn);
		return o;
	}
	
	// 예약주문 상태 취소로 변경하는 update
	
	public int updateOrder(Order o) {
		Connection conn = getConnection();
		int result = new OrderDao().updateOrder(conn, o);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	// 마이페이지 예약조회에서 예약취소하는 delete
	
	public int deleteOrder(int orderNo) {
		Connection conn = getConnection();
		int result = new OrderDao().deleteOrder(conn, orderNo);
		
		if(result>0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	// 주문내역관리 페이지에서 변경 버튼 클릭시 update
	public int updateChangeOrder(Order o) {
		Connection conn = getConnection();
		int result = new OrderDao().updateChangeOrder(conn, o);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	// 주문내역관리페이지 게시판 내 검색기능
	
	public ArrayList<Order> searchOrder(String search, String keyword){
		Connection conn = getConnection();
		ArrayList<Order> list = new OrderDao().searchOrder(conn, search, keyword);
		close(conn);
		return list;
	}
	
}
