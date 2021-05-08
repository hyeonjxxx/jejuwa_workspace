package com.kh.myq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.myq.model.service.MYQService;
import com.kh.myq.model.vo.MYQ;

/**
 * Servlet implementation class MYQAdminAnsInsertServlet
 */
@WebServlet("/ans.amyq")
public class MYQAdminAnsInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MYQAdminAnsInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 관리자가 입력한 답글 받기
		String answer = request.getParameter("answer");
		int getMyq_no = Integer.parseInt(request.getParameter("getMyq_no"));
		
		int result = new MYQService().answer(answer, getMyq_no);
		
		if(result>0) { 
			// 답변 수정 성공
			response.getWriter().print(result);
			
		} else {
			// 답변 수정 실패
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
