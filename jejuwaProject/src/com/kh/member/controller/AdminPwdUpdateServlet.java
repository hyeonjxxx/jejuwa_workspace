package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class AdminPwdUpdateServlet
 */
@WebServlet("/resetPwd.me")
public class AdminPwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPwdUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 관리자 권한으로 비밀번호 초기화(비밀번호를 회원의 아이디와 일치화)		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		//System.out.println(memNo);
		
		int result = new MemberService().resetPwd(memNo);
		
		if(result > 0) { // 비밀번호 초기화 성공 => 해당 회원 상세보기 페이지
			request.getSession().setAttribute("alertMsg", "비밀번호가 초기화 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.me?mno=" + memNo);
		}else { // 비밀번호 초기화 실패 => alert => 해당 회원 상세보기 페이지
			request.getSession().setAttribute("alertMsg", "비밀번호 초기화를 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.me?mno=" + memNo);
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
