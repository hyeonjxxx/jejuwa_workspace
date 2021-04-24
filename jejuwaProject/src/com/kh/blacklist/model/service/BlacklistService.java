package com.kh.blacklist.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.blacklist.model.dao.BlacklistDao;
import com.kh.blacklist.model.vo.Blacklist;
import com.kh.common.model.vo.PageInfo;

public class BlacklistService {

	/**
	 * 블랙리스트 회원 수 조회
	 * @return
	 */
	public int selectBlacklistCount() {
		Connection conn = getConnection();
		int memberCount = new BlacklistDao().selectBlacklistCount(conn);
		close(conn);
		return memberCount;
	}
	
	/**
	 * 블랙리스트 리스트 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Blacklist> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Blacklist> list = new BlacklistDao().selectList(conn, pi);
		close(conn);
		return list;
	}
}
