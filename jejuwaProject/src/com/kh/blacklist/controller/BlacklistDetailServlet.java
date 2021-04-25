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
import com.kh.report.model.vo.Report;

/**
 * Servlet implementation class BlacklistDetailServlet
 */
@WebServlet("/detail.bl")
public class BlacklistDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlacklistDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 블랙리스트 디테일 뷰 1
		String memId = request.getParameter("memId");
		// System.out.println(memId);
		Blacklist b = new BlacklistService().selectBlacklist(memId);
		ArrayList<Report> list = new BlacklistService().selectBlacklist2(memId);
		
		if(b != null && list != null) { // 블랙리스트 상세조회1 성공
			request.setAttribute("b", b);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/blacklist/blacklistDetailView.jsp").forward(request, response);
		} else { // 블랙리스트 상세조회1 실패
			request.getSession().setAttribute("alertMsg", "블랙리스트 상세조회를 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/list.bl?currentPage=1");
			
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
