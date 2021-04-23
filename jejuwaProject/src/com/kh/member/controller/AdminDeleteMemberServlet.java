package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/delete.me")
public class AdminDeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 관리자 권한으로 회원 탈퇴처리
		// 관리자 비밀번호 인증 후 넘어오는 서블릿이기 때문에 탈퇴 처리하는 회원 번호만 받음
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int result = new MemberService().adminDeleteMember(memNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "회원탈퇴 처리를 완료했습니다.");
			response.sendRedirect(request.getContextPath() + "/list.me?currentPage=1");
		} else {
			request.getSession().setAttribute("alertMsg", "회원탈퇴 처리를 실패하였습니다.");
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
