package com.kh.myq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Attachment;
import com.kh.myq.model.service.MYQService;
import com.kh.myq.model.vo.MYQ;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class MYQAdminDetailViewServlet
 */
@WebServlet("/detail.umyq")
public class MYQUserDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MYQUserDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 디테일리스트 뷰 요청시 클릭한 문의글 번호 뽑아서 담기
		int myqNo = Integer.parseInt(request.getParameter("myqno"));
		
		// 1. 문의 상세조회
		MYQ q = new MYQService().selectDetailUser(myqNo);
		ArrayList<Attachment> list = new MYQService().selectAttachmentUser(myqNo);
		
		// 받아온 q, at 값 Attribute영역에 세팅하기
		request.setAttribute("q", q); 
		request.setAttribute("list", list);
				
		// 화면뿌려주기
		request.getRequestDispatcher("views/myq/myqUserDetailView.jsp").forward(request, response);

			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
