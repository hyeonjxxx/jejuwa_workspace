package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/list.me")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 페이징 처리
		int memberCount;
		int currentPage;
		int pageLimit;
		int memberLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		// * memberCount : 총 멤버 수 조회해서 담기
		memberCount = new MemberService().selectMemberCount();
		
		// * currentPage : 현재 요청한 페이지
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
		// * pageLimit
		pageLimit = 5;
		
		// * memberLimit
		memberLimit = 10;
		
		// * maxPage
		maxPage = (int)Math.ceil((double)memberCount / memberLimit);
		
		// * startPage
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 객체에 담기
		PageInfo pi = new PageInfo(memberCount, currentPage, pageLimit, memberLimit, maxPage, startPage, endPage);
		
		// 관리자 혹은 활동회원인 회원 리스트 요청 및 결과 받기
		ArrayList<Member> list = new MemberService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/member/memberListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
