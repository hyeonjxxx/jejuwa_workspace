package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
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
		
		Member m = new MemberDao().adminLogin(conn, memId, memPwd);
		
		close(conn);
		return m;
	}
	
	/**
	 * 멤버 수 조회(활동회원, 관리자)
	 * @return
	 */
	public int selectMemberCount() {
		Connection conn = getConnection();
		int memberCount = new MemberDao().selectMemberCount(conn);
		close(conn);
		return memberCount;
	}
	
	/**
	 * 현재 요청한 페이지(currentPage)에 보여질 멤버 리스트 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	

}
