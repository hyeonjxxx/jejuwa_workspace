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
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/update.me")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		// 요청시 전달값 뽑아서 변수에 저장
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String memId = request.getParameter("memId");
		String memName = request.getParameter("memName");
		String phone = request.getParameter("phone");
		
		// 입력시 선택사항 : 이메일, 생년월일 (요청시 값이 빈 문자열일 수 있다)
		String email = "";
		if(!request.getParameter("emailId").equals("") && !request.getParameter("domain").equals("")) {
			email = request.getParameter("emailId")+"@"+request.getParameter("domain");
		}
		String memBirth = "";
		if(!request.getParameter("byear").equals("----") && !request.getParameter("bmonth").equals("--") && !request.getParameter("bday").equals("--")) {
			memBirth = request.getParameter("byear")+request.getParameter("bmonth")+request.getParameter("bday");
		}
		
		//System.out.println(memNo);
		//System.out.println(memId);
		//System.out.println(memName);
//		System.out.println(phone);
//		System.out.println(email);
//		System.out.println(memBirth);
		
		Member m = new Member(memNo, memId, memName, phone, email, memBirth);
		int result = new MemberService().updateMember(m);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "회원정보 수정이 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.me?mno=" + m.getMemNo());
		}else {
			request.getSession().setAttribute("alertMsg", "회원정보 수정을 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.me?mno=" + m.getMemNo());
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
