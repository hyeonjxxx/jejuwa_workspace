package com.kh.member.model.dao;

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
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties(); // properties 생성해주기
	
	// 기본생성자 만들기 (경로 지정)
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * [민국] 로그인 
	 * @param conn
	 * @param memId
	 * @param memPwd
	 * @return
	 */
	public Member loginMember(Connection conn, String memId, String memPwd) {
		// select 
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			pstmt.setString(2, memPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("mem_no"),
						   rset.getString("mem_id"),
						   rset.getString("mem_pwd"),
						   rset.getString("mem_name"),
						   rset.getString("phone"),
						   rset.getString("email"),
						   rset.getString("mem_birth"),
						   rset.getDate("enroll_date"),
						   rset.getDate("modify_date"),
						   rset.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
		
	}
	
	/**
	 * [휘경] 페이지에서 관리자로 로그인
	 * @param conn
	 * @param memId
	 * @param memPwd
	 * @return
	 */
	public Member adminLogin(Connection conn, String memId, String memPwd) {
		// select문 => ResultSet(한 행)
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("AdminLogin");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql
			pstmt.setString(1, memId);
			pstmt.setString(2, memPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("MEM_NO"),
							   rset.getString("MEM_ID"),
							   rset.getString("MEM_PWD"),
							   rset.getString("MEM_NAME"),
							   rset.getString("PHONE"),
							   rset.getString("EMAIL"),
							   rset.getString("MEM_BIRTH"),
							   rset.getDate("ENROLL_DATE"),
							   rset.getDate("MODIFY_DATE"),
							   rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	/**

	 * 민국(회원가입)
	 * @param conn
	 * @param m
	 * @return
	 */
	public int insertMember(Connection conn, Member m) {
		// insert
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemPwd());
			pstmt.setString(3, m.getMemName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getMemBirth());
			System.out.println(m);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**
	 * [민국] 아이디 중복체크
	 * @param conn
	 * @param checkId
	 * @return
	 */
	public int idCheck(Connection conn, String checkId) {
		// select문
		int count = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("checkId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,  checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return count;
	}
	
	/**
	 * [민국] 아이디 찾기: 핸드폰번호 == 이름 체크여부
	 * @param memId
	 * @param phoneNumber
	 * @return
	 */
	public Member idFindCheck(Connection conn, String memName, String phoneNumber) {
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("idFindCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memName);
			pstmt.setString(2, phoneNumber);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getString("MEM_NAME"),
							   rset.getString("MEM_ID"),
						       rset.getString("PHONE"));
				System.out.println(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}
	
	
	
	public Member pwFindCheck(Connection conn, String memName, String phoneNumber) {
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("pwFindCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//pstmt.setString(1, memId);
			pstmt.setString(1, memName);
			pstmt.setString(2, phoneNumber);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getString("MEM_NAME"),
							   rset.getString("MEM_ID"),
							   rset.getString("MEM_PWD"),
						       rset.getString("PHONE"));
				System.out.println(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}

	
	/**
	 * [휘경] 멤버 수 조회(활동회원, 관리자)
	 * @param conn
	 * @return
	 */
	public int selectMemberCount(Connection conn) {
		// select문 => ResultSet(멤버 수)
		int memberCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMemberCount");
		
		try {
			pstmt = conn.prepareStatement(sql); // 완성된 sql
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberCount = rset.getInt("MEMBERCOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return memberCount;
	}
	
	/**
	 * [휘경] 현재 요청한 페이지(currentPage)에 보여질 회원 리스트 조회
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectList(Connection conn, PageInfo pi){
		// select문 => ResultSet(여러행)
		ArrayList<Member> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql
			/*
			 * startRow = (currentPage - 1) * boardLimit + 1
			 * endRow = currentPage * boardLimit
			 */
			pstmt.setInt(1, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("MEM_NO"),
									rset.getString("MEM_ID"),
									rset.getString("MEM_NAME"),
									rset.getString("PHONE"),
									rset.getString("EMAIL"),
									rset.getDate("ENROLL_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * [휘경] 회원 상세조회
	 * @param conn
	 * @param memNo
	 * @return
	 */
	public Member selectMember(Connection conn, int memNo) {
		// select문 => ResultSet(한 행)
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성sql
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("MEM_NO"),
						       rset.getString("MEM_ID"),
						       rset.getString("MEM_PWD"),
						       rset.getString("MEM_NAME"),
						       rset.getString("PHONE"),
						       rset.getString("EMAIL"),
						       rset.getString("MEM_BIRTH"),
						       rset.getDate("ENROLL_DATE"),
						       rset.getDate("MODIFY_DATE"),
						       rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	/**
	 * [휘경] 관리자 권한으로 비밀번호 초기화(비밀번호를 회원아이디와 일치화)
	 * @param conn
	 * @param memNo
	 * @return
	 */
	public int resetPwd(Connection conn, int memNo) {
		// update문 => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("resetPwd");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql
			pstmt.setInt(1, memNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * [휘경] 관리자 회원정보수정 (처리된 행 수 반환)
	 * @param conn
	 * @param m
	 * @return
	 */
	public int updateMember(Connection conn, Member m) {
		// update문 => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql
			pstmt.setString(1, m.getMemName());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getMemBirth());
			pstmt.setInt(5, m.getMemNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * [휘경] 관리자 회원탈퇴처리
	 * @param conn
	 * @param memNo
	 * @return
	 */
	public int adminDeleteMember(Connection conn, int memNo) {
		// update문 => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql
			pstmt.setInt(1, memNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * [휘경] 사용자 회원정보변경 (변경된 회원 객체 반환)
	 * @param conn
	 * @param m
	 * @return
	 */
	public int UserUpdateMember(Connection conn, Member m) {
		// update문 => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql
			pstmt.setString(1, m.getMemName());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getMemBirth());
			pstmt.setInt(5, m.getMemNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	/**
	 * [휘경] 사용자 비밀번호 변경 (변경된 회원 객체 반환)
	 * @param conn
	 * @param memId
	 * @param updatePwd
	 * @return
	 */
	public int updatePwd(Connection conn, int memNo, String memPwd, String updatePwd) {
		// update문 => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql
			pstmt.setString(1, updatePwd);
			pstmt.setInt(2, memNo);
			pstmt.setString(3, memPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

	/**
	 * [휘경] 사용자 회원탈퇴(탈퇴후 로그인된 정보 비우기)
	 * @param conn
	 * @param memId
	 * @return
	 */
	public int userDeleteMember(Connection conn, int memNo) {
		// update문 => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql
			pstmt.setInt(1, memNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * [휘경] 멤버 키워드 검색
	 * @param conn
	 * @param searchCtg 검색카테고리(아이디, 이름, 전화번호)
	 * @param keyword
	 * @return
	 */
	public ArrayList<Member> searchMember(Connection conn, String searchCtg, String keyword){
		// select문 => ResultSet(여러 행)
		ArrayList<Member> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		// 카테고리 : 아이디 로 검색한 경우
		if(searchCtg.equals("memId")) {
			sql=prop.getProperty("searchMemberId");
			
			try {
				pstmt = conn.prepareStatement(sql); // 미완성 sql
				pstmt.setString(1, "%" + keyword + "%");
				rset = pstmt.executeQuery();
				while(rset.next()) {
					list.add(new Member(rset.getInt("MEM_NO"),
										rset.getString("MEM_ID"),
										rset.getString("MEM_NAME"),
										rset.getString("PHONE"),
										rset.getString("EMAIL"),
										rset.getDate("ENROLL_DATE")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
		}
		
		// 카테고리 : 이름 으로 검색한 경우
		if(searchCtg.equals("memName")) {
			sql=prop.getProperty("searchMemberName");
			
			try {
				pstmt = conn.prepareStatement(sql); // 미완성 sql
				pstmt.setString(1, "%" + keyword + "%");
				rset = pstmt.executeQuery();
				while(rset.next()) {
					list.add(new Member(rset.getInt("MEM_NO"),
										rset.getString("MEM_ID"),
										rset.getString("MEM_NAME"),
										rset.getString("PHONE"),
										rset.getString("EMAIL"),
										rset.getDate("ENROLL_DATE")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
		}
		
		
		// 카테고리 : 전화번호 로 검색한 경우
		if(searchCtg.equals("phone")) {
			sql=prop.getProperty("searchMemberPhone");
			
			try {
				pstmt = conn.prepareStatement(sql); // 미완성 sql
				pstmt.setString(1, "%" + keyword + "%");
				rset = pstmt.executeQuery();
				while(rset.next()) {
					list.add(new Member(rset.getInt("MEM_NO"),
										rset.getString("MEM_ID"),
										rset.getString("MEM_NAME"),
										rset.getString("PHONE"),
										rset.getString("EMAIL"),
										rset.getDate("ENROLL_DATE")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
		}
		
		return list;
	}

	
	/**
	 * [휘경] 멤버 상태로 검색
	 * @param conn
	 * @param status
	 * @return
	 */
	public ArrayList<Member> searchMember2(Connection conn, String status){
		// select문 => ResultSet(여러 행)
		ArrayList<Member> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchMember2");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql문
			pstmt.setString(1, status);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("MEM_NO"),
									rset.getString("MEM_ID"),
									rset.getString("MEM_NAME"),
									rset.getString("PHONE"),
									rset.getString("EMAIL"),
									rset.getDate("ENROLL_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	/**
	 * [휘경] 멤버 수 조회2
	 * @param conn
	 * @return
	 */
	public int selectMemberCount2(Connection conn, String status) {
		// select문 => ResultSet(멤버 수)
		int memberCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMemberCount2");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql
			pstmt.setString(1, status);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberCount = rset.getInt("MEMBERCOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return memberCount;
	}
	
	
	/**
	 * [휘경] 현재 요청한 페이지(currentPage)에 보여질 회원 리스트 조회2
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectList2(Connection conn, PageInfo pi, String status){
		// select문 => ResultSet(여러행)
		ArrayList<Member> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectList2");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성 sql
			/*
			 * startRow = (currentPage - 1) * boardLimit + 1
			 * endRow = currentPage * boardLimit
			 */
			pstmt.setString(1, status);
			pstmt.setInt(2, (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1);
			pstmt.setInt(3, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("MEM_NO"),
									rset.getString("MEM_ID"),
									rset.getString("MEM_NAME"),
									rset.getString("PHONE"),
									rset.getString("EMAIL"),
									rset.getDate("ENROLL_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
}
