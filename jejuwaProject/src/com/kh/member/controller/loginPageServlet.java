package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class loginPageServlet
 */
@WebServlet("/login.me")
public class loginPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/member/loginPage.jsp").forward(request, response);
		
		request.setCharacterEncoding("utf-8");
		
		// 2. 요청시 전달값(request의 parameter영역) 꺼내서 변수 또는 객체에 기록하기
		String memId = request.getParameter("memId"); // "사용자가입력한아이디값"
		String memPwd = request.getParameter("memPwd"); // "사용자가입력한비밀번호값"
		
		// 3. 해당 요청을 처리하는 서비스 클래스의 메소드 호출 및 그 결과 받기
		Member m = new MemberService().loginMember(memId, memPwd);
		
		if( m == null) {
			System.out.println("로그인 실패");
		} else {
			System.out.println("로그인 성공");
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
