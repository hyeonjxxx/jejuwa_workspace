package com.kh.blacklist.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.blacklist.model.service.BlacklistService;

/**
 * Servlet implementation class BlacklistEnrollServlet
 */
@WebServlet("/enroll.bl")
public class BlacklistEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlacklistEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		String memNo2 = request.getParameter("memNo2");
		String memId = request.getParameter("memId");
		String reason = request.getParameter("reason");
		
		// 회원 아이디로 회원번호 알아오기
		int memNo = new BlacklistService().findMemNo(memId);
		
		if(memNo > 0) {
			// memNo를 전달하여 블랙리스트 등록하기
			int result = new BlacklistService().enrollBlacklist(memNo);
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "블랙리스트 등록이 완료되었습니다.");
				response.sendRedirect(request.getContextPath()+"/list.bl?currentPage=1");
			}else {
				request.getSession().setAttribute("alertMsg", "블랙리스트 등록을 실패했습니다.");
				response.sendRedirect(request.getContextPath()+"/list.bl?currentPage=1");
			}
		}else {
			request.getSession().setAttribute("alertMsg", memId +"는 잘못된 아이디입니다.");
			response.sendRedirect(request.getContextPath()+"/list.bl?currentPage=1");
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
