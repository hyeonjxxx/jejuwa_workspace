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
 * Servlet implementation class MemberDetailViewServlet
 */
@WebServlet("/detail.me")
public class MemberDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 요청시 전달값 뽑아서 담기
		int memNo = Integer.parseInt(request.getParameter("mno"));
		
		Member m = new MemberService().selectMember(memNo);
		
		if(m != null) {
			request.setAttribute("m", m);
			request.getRequestDispatcher("views/member/memberDetailView.jsp").forward(request, response);
			
		}else {
			// 에러페이지 따로 만들어야할지 그냥 alert로 띄울지
			request.getSession().setAttribute("alertMsg", "회원 조회에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/list.me?currentPage=1");
					
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
