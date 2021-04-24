package com.kh.notice.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class NoticeService {

	/**
	 * 공지사항 총 게시글 갯수 조회
	 * @return 공지사항 게시글 총 갯수
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * 현재 요청한 페이지 (currentPage)에 보여질 공지사항 리스트 조회 
	 * @param pi
	 * @return
	 */
	public ArrayList<Notice> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	
	/**
	 * 공지사항 insert(테이블 내에 첨부파일 따로 관리)
	 * @param n 매개변수가 담긴 Notice객체
	 * @return
	 */
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDao().insertNotice(conn, n);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	/**
	 * 공지사항 조회수 증가
	 * @param noticeNo 조회수 증가시킬 공지사항 번호
	 * @return
	 */
	public int increaseCount(int noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 공지사항 상세조회
	 * @param noticeNo
	 * @return
	 */
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		close(conn);
		return n;				
	}
	
	
	/**
	 * 공지사항 업데이트
	 * @param n 업데이트할 내용들(제목, 내용, [첨부파일])이 담긴 공지사항 객체
	 * @return
	 */
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		//int result = new NoticeDao().updateNotice(conn, n);
		int result = 0;
		if(n.getOriginFileName() != null) {
			result = new NoticeDao().updateNotice1(conn, n);
		}else {
			result = new NoticeDao().updateNotice2(conn, n);
		}
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 공지사항 삭제
	 * @param noticeNo
	 * @return
	 */
	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().deleteNotice(conn, noticeNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	
}
