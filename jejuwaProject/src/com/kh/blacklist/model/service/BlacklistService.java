package com.kh.blacklist.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.blacklist.model.dao.BlacklistDao;
import com.kh.blacklist.model.vo.Blacklist;
import com.kh.common.model.vo.PageInfo;
import com.kh.report.model.vo.Report;

public class BlacklistService {

	/**
	 * [휘경] 블랙리스트 회원 수 조회
	 * @return
	 */
	public int selectBlacklistCount() {
		Connection conn = getConnection();
		int memberCount = new BlacklistDao().selectBlacklistCount(conn);
		close(conn);
		return memberCount;
	}
	
	/**
	 * [휘경] 블랙리스트 리스트 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Blacklist> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Blacklist> list = new BlacklistDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * [휘경] 블랙리스트 상세 조회 1
	 * @param memId
	 * @return
	 */
	public Blacklist selectBlacklist(String memId) {
		Connection conn = getConnection();
		Blacklist b = new BlacklistDao().selectBlacklist(conn, memId);
		close(conn);
		return b;
	}
	
	/**
	 * [휘경] 블랙리스트 상세 조회2
	 * @param memId
	 * @return
	 */
	public ArrayList<Report> selectBlacklist2(String memId) {
		Connection conn = getConnection();
		ArrayList<Report> list = new BlacklistDao().selectBlacklist2(conn,memId);
		close(conn);
		return list;
	}
	
	
	/**
	 * [휘경] 블랙리스트 해제
	 * @param memNo
	 * @return
	 */
	public int removeBlacklist(int memNo) {
		Connection conn = getConnection();
		int result = new BlacklistDao().removeBlacklist(conn, memNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	
	
	
	
}
