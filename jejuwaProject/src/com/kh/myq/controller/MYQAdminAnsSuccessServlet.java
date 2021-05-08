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
