package com.kh.like.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.like.model.dao.LikeDao;
import com.kh.like.model.vo.Like;

public class LikeService {
	
	public ArrayList<Like> selectLikePro(String pCode){
		Connection conn = getConnection();
		ArrayList<Like> list = new LikeDao().selectLikePro(conn, pCode);
		close(conn);
		return list;
	}
	
	public int insertLikePro(Like l) {
		
		Connection conn = getConnection();
		int result = new LikeDao().insertLikePro(conn,l);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
		
	}
	
	public int deleteLike(String pCode) {
		
		Connection conn = getConnection();
		int result = new LikeDao().deleteLike(conn, pCode);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

}
