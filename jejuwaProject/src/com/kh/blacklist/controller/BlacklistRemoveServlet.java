package com.kh.blacklist.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.blacklist.model.service.BlacklistService;

/**
 * Servlet implementation class BlacklistRemoveServlet
 */
@WebServlet("/remove.bl")
public class BlacklistRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlacklistRemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String memId = request.getParameter("memId");
		//System.out.println(memNo);
		
		int result = new BlacklistService().removeBlacklist(memNo);
		
		if(result > 0 ) {
			request.getSession().setAttribute("alertMsg", "블랙리스트가 해제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.bl?currentPage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "블랙리스트 해제를 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.bl?memId=" + memId);
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
