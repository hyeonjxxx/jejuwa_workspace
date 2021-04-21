package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/detail.no")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 공지사항 작성하기 먼저 하고나서 할 것!!
		
		// 요청시 전달값 뽑아서 담기
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
		// 1. 조회수 증가
		int result = new NoticeService().increaseCount(noticeNo);
		
		// 2. 공지사항 상세조회
		if(result > 0) { // 유효한 공지사항 번호 => 상세 조회
			Notice n = new NoticeService().selectNotice(noticeNo);
			request.setAttribute("n", n);
			request.getRequestDispatcher("views/notice/noticeDetailView.jsp").forward(request, response);
			
		}else { // 유효하지 않은 공지사항 번호 => alertMsg "공지사항 조회에 실패하였습니다."
			// 에러페이지 따로 만들어야할지 그냥 alert로 띄울지
			request.getSession().setAttribute("alertMsg", "공지사항 조회에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/list.no?currentPage=1");
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
