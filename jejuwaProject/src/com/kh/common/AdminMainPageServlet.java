package com.kh.common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AdminMainPageServlet
 */
@WebServlet("/admin.go")
public class AdminMainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사용자 페이지에서 관리자 메인페이지 포워딩
		// 사용자 페이지에서 로그인&&사용자가 관리자일 경우 보여지는 관리자 페이지 이동 a태그 누르면 실행되는 서블릿
		// session에 담겨있는 loginUser 객체를 관리자페이지에도 전달하고 싶다.
		// 사용자 페이지에서 관리자 로그인한 상태로 관리자 페이지에서도 로그인을 유지시키고 싶다.
		
		// Q. 세션에 담겨있는 값을 가져와서 멤버 객체 loginuser에 담기 (?)
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// Q. loginUser 객체를 담아서 전달,,?
		//request.setAttribute("loginUser", adminUser);
		//request.getRequestDispatcher("views/common/adminPageMenubar.jsp").forward(request, response);
		//System.out.println(adminUser);
		//session.setAttribute("adminUser", adminUser);
		//response.sendRedirect(request.getContextPath() + "/admin.go");
		session.setAttribute("loginUser", loginUser);
		request.getRequestDispatcher("views/common/adminPageMenubar.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
