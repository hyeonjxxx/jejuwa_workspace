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
 * Servlet implementation class AdminpageLoginServlet
 */
@WebServlet("/login.ad")
public class AdminpageLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminpageLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		// 전달값 뽑기
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		
		Member m = new MemberService().adminLogin(memId, memPwd);
		
		if(m == null) { // 로그인 실패
			// errorMsg "관리자 로그인에 실패했습니다."
			request.getSession().setAttribute("alertMsg", "관리자 로그인에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/admin.go");
			
		}else {
			request.getSession().setAttribute("alertMsg", "관리자로 로그인 되었습니다.");
			//request.getSession().setAttribute("adminUser", m);
			//response.sendRedirect(request.getContextPath() + "/admin.go");
			//request.setAttribute("loginUser", loginMember);
			//request.getRequestDispatcher("/views/common/adminPageMenubar.jsp").forward(request, response);
			//System.out.println(m);
			
			request.getSession().setAttribute("loginUser", m);
			//request.getRequestDispatcher("views/common/adminPageMenubar.jsp").forward(request, response); // =>로그인 후 메인페이지가 login.me로 남아있음
			response.sendRedirect(request.getContextPath() + "/admin.go");
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
