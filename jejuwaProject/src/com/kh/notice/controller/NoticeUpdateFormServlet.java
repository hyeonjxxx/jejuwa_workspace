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
 * Servlet implementation class NoticeUpdateFormServlet
 */
@WebServlet("/updateForm.no")
public class NoticeUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 해당 서블릿 역할 : 전달받은 공지사항 번호로 공지사항 정보 담아와서 공지사항 수정 폼 jsp 포워딩
		// 전달받은 공지사항 번호 뽑아서 변수에 저장하기
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		// 전달받은 공지사항 번호로 공지사항 조회해와서 Notice객체에 담기
		Notice n = new NoticeService().selectNotice(noticeNo);
		
		// Notice객체를 전달하며 공지사항 수정 폼 포워딩
		request.setAttribute("n", n);
		request.getRequestDispatcher("views/notice/noticeUpdateForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
