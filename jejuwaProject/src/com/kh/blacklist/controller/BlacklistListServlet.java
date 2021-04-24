package com.kh.blacklist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.blacklist.model.service.BlacklistService;
import com.kh.blacklist.model.vo.Blacklist;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class BlacklistListServlet
 */
@WebServlet("/list.bl")
public class BlacklistListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlacklistListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 블랙리스트 리스트 페이지 요청
		
		// 페이징 처리
		int memberCount;
		int currentPage;
		int pageLimit;
		int memberLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		memberCount = new BlacklistService().selectBlacklistCount();
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 5;
		
		memberLimit = 10;
		
		maxPage = (int)Math.ceil((double)memberCount / memberLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 객체에 담기
		PageInfo pi = new PageInfo(memberCount, currentPage, pageLimit, memberLimit, maxPage, startPage, endPage);
		
		// 블랙리스트 리스트 요청 및 결과 받기 
		ArrayList<Blacklist> list = new BlacklistService().selectList(pi);
		
		//System.out.println(list);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/blacklist/blacklistListView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
