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
	

}
