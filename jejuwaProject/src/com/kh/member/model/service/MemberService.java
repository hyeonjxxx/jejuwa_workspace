package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String memId, String memPwd) {
		Connection conn = getConnection();
		
		Member loginMember = new MemberDao().loginMember(conn, memId, memPwd);
		
		close(conn);
		
		return loginMember;
	}
	
	
	/**
	 * 관리자 페이지에서 관리자로 로그인
	 * @param memId
	 * @param memPwd
	 * @return
	 */
	public Member adminLogin(String memId, String memPwd) {
		Connection conn = getConnection();
		
		Member loginMember = new MemberDao().adminLogin(conn, memId, memPwd);
		
		close(conn);
		return loginMember;
		
	}
	

}
