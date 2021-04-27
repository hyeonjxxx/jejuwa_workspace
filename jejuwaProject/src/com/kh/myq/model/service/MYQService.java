package com.kh.myq.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.myq.model.dao.MYQDao;
import com.kh.myq.model.vo.MYQ;

public class MYQService {

	
	/**
	 * 관리자 현재 총 게시글 조회
	 * @return
	 */
	public int selectListCountAdmin() {
		Connection conn = getConnection();
		
		int listCount = new MYQDao().selectListCountAdmin(conn);
		close(conn);
		return listCount;
	}
	
	
	public ArrayList<MYQ> selectListAdmin(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<MYQ> list = new MYQDao().selectListAdmin(conn, pi);
		
		close(conn);
		return list;
	}
	
}
