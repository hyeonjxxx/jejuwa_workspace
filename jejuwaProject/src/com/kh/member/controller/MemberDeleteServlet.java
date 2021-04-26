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
@WebServlet("/userDelete.me")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		// 탈퇴사유 관련 수정 필요
		String reason = "선택안함";
		if(request.getParameter("reason") != null) {
			reason = request.getParameter("reason");
		}
		
		System.out.println(reason);
		
		int result = new MemberService().userDeleteMember(memNo);
		
		if(result > 0) { // 탈퇴 성공
			
			// 세션에 남아있는 login 지우기
			request.getSession().removeAttribute("loginUser");
			request.getSession().setAttribute("alertMsg", "회원탈퇴가 완료되었습니다. \\n그동안 제주와를 이용해주셔서 감사합니다.");
			
			response.sendRedirect(request.getContextPath());
		} else {
			request.getSession().setAttribute("alertMsg", "회원탈퇴를 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/withdrawalForm.mp");
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
