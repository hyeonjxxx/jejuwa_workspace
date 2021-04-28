package com.kh.myq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Attachment;
import com.kh.myq.model.service.MYQService;
import com.kh.myq.model.vo.MYQ;

/**
 * Servlet implementation class MYQAdminAnsSuccessServlet
 */
@WebServlet("/ansS.amyq")
public class MYQAdminAnsSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MYQAdminAnsSuccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 디테일리스트 뷰 요청시 클릭한 문의글 번호 뽑아서 담기
		int myqNo = Integer.parseInt(request.getParameter("mno"));
		
		// 1. 문의 상세조회
		MYQ q = new MYQService().selectDetailAdmin(myqNo);
		Attachment at = new MYQService().selectAttachmentAdmin(myqNo);
		
		System.out.println(q);
		System.out.println(at);
		
		// 받아온 q, at 값 Attribute영역에 세팅하기
		request.setAttribute("q", q); 
		request.setAttribute("at", at);
				
		// 화면뿌려주기
		request.getRequestDispatcher("views/myq/myqAdminDetailView.jsp").forward(request, response);
		response.setContentType("application/json; charset=UTF-8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
