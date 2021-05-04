package com.kh.member.controller;

import java.io.IOException;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class loginPageServlet
 */
@WebServlet("/login.me")
public class LoginPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 1. 요청시 전달값(request의 parameter영역) 꺼내서 변수 또는 객체에 기록하기
		String memId = request.getParameter("memId"); // "사용자가입력한아이디값"
		String memPwd = request.getParameter("memPwd"); // "사용자가입력한비밀번호값"
		
		// 2. 해당 요청을 처리하는 서비스 클래스의 메소드 호출 및 그 결과 받기
		Member m = new MemberService().loginMember(memId, memPwd);
		
		if( m == null) {
			// 로그인 실패
			request.setAttribute("loginError", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
			request.getRequestDispatcher("views/member/loginPage.jsp").forward(request, response);
			
			
		} else {
			// 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", m);
			
			response.sendRedirect("views/common/mainPage.jsp");
			
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
