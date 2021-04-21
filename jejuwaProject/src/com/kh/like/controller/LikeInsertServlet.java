package com.kh.like.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.like.model.service.LikeService;
import com.kh.like.model.vo.Like;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LikeInsertServlet
 */
@WebServlet("/linsert.li")
public class LikeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String likeProduct = request.getParameter("pno");
		
		// 세션에 담긴 로그인한 회원의 회원번호 넘기기
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		
		Like l = new Like();
		l.setpCode(likeProduct);
		l.setMemNo(memNo);
		
		//ajax는 포워딩 x
		int result = new LikeService().insertLikePro(l);
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
