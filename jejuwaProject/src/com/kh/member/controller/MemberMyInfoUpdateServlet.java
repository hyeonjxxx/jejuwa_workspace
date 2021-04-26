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
 * Servlet implementation class MemberMyInfoUpdateServlet
 */
@WebServlet("/myInfoUpdate.me")
public class MemberMyInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyInfoUpdateServlet() {
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
//				System.out.println(phone);
//				System.out.println(email);
//				System.out.println(memBirth);
		
		Member m = new Member(memNo, memId, memName, phone, email, memBirth);
		
		// 3. 요청처리를 위한 service 메소드 호출 및 결과 돌려받기
		Member updateMem = new MemberService().UserUpdateMember(m);
		
		// 4. 돌려받은 결과로 사용자가 보게될 페이지 지정
		if(updateMem == null) { // 회원정보수정 실패
			request.getSession().setAttribute("alertMsg", "회원정보 수정을 실패했습니다.");
		} else { // 회원정보수정 성공
			request.getSession().setAttribute("loginUser", updateMem);
			request.getSession().setAttribute("alertMsg", "회원정보가 수정되었습니다.");
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
