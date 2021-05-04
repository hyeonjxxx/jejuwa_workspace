package com.kh.member.controller;

import java.io.IOException;

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
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/insert.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 전달값 중에 한글값이 있을 경우 대비해서 인코딩 
		request.setCharacterEncoding("utf-8");
		
		// 2. 전달값 뽑아서 객체에 기록
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		String memName = request.getParameter("memName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("emailId") + "@" + request.getParameter("email");
		String memBirth = request.getParameter("year") + request.getParameter("month") + request.getParameter("date");
		
		// 3. 매개변수 생성자 이용해서 담기
		Member m = new Member(memId, memPwd, memName, phone, email, memBirth);
		
		// 4. 요청처리를 위한 Service로 메소드 호출 및 결과받기
		int result = new MemberService().insertMember(m);
		
		if(result >0) { // 성공일 경우
			// alert로 띄워주고자 하는 메세지 담기 => session에 담기
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다. 로그인해주세요.");
			
			response.sendRedirect(request.getContextPath());
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/loginPage.jsp");
		} else { // 실패할 경우
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원가입에 실패했습니다. 다시 확인해주세요.");
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
