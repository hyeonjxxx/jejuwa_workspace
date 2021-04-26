package com.kh.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.order.model.service.OrderService;
import com.kh.order.model.vo.Order;

/**
 * Servlet implementation class OrderUpdateServlet
 */
@WebServlet("/update.or")
public class OrderUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String pcode = request.getParameter("pcode");
		String cReason = request.getParameter("cReason");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo(); // 1
		
		/*
		System.out.println(pcode);
		System.out.println(cReason);
		System.out.println(memNo);
		*/
		
		Order o = new Order();
		o.setpCode(pcode);
		o.setcReason(cReason);
		o.setMemNo(memNo);
		
		int result = new OrderService().updateOrder(o);
		
		if(result>0) { // 수정 성공 /list.mpr
			request.getSession().setAttribute("alertMsg", "예약이 취소되었습니다");
			response.sendRedirect(request.getContextPath() + "/list.mpc");
		}else {//수정실패
			request.getSession().setAttribute("alertMsg", "예약취소가 되지 않았습니다.");
			response.sendRedirect(request.getContextPath() + "/list.mpc");
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
