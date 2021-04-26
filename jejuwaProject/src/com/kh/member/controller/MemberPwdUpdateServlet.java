package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberPwdUpdateServlet
 */
@WebServlet("/updatePwd.me")
public class MemberPwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 사용자 비밀번호 변경 
		
		request.setCharacterEncoding("utf-8");
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String memPwd = request.getParameter("memPwd");
		String updatePwd = request.getParameter("updatePwd");
		
		Member updateMem = new MemberService().updatePwd(memNo, memPwd, updatePwd);
		
		
		if(updateMem == null) { // 비밀번호 변경 실패
			request.getSession().setAttribute("alertMsg", "비밀번호 변경을 실패했습니다.");
			
			
		} else { // 비밀번호 변경 성공
			request.getSession().setAttribute("loginUser", updateMem);
			request.getSession().setAttribute("alertMsg", "비밀번호가 변경되었습니다.");
		}
		
		response.sendRedirect(request.getContextPath()+ "/myInfo.mp");
		//System.out.println(updateMem);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
