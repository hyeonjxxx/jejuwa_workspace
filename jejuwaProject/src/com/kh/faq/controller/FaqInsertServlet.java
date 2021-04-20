package com.kh.faq.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.faq.model.service.FaqService;
import com.kh.faq.model.vo.Faq;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FaqInsertServlet
 */
@WebServlet("/insert.fa")
public class FaqInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String faqTitle = request.getParameter("title");
		String faqContent = request.getParameter("content");
		String qCategory = request.getParameter("category");
		
		HttpSession session = request.getSession();
		//Member loginUser = (Member)session.getAttribute("loginUser");
		//int memNo = loginUser.getMemNo(); // 로그인한 회원번호 필요함
	
		Faq f = new Faq();
		f.setFaqTitle(faqTitle);
		f.setFaqContent(faqContent);
		f.setqCategory(qCategory);
		
		int result = new FaqService().insertFaq(f);
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.fa?currentPage=1");
			
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
