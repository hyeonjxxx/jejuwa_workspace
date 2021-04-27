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
 * Servlet implementation class OrderChangeUpdateServlet
 */
@WebServlet("/update.cor")
public class OrderChangeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderChangeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int orderNo = Integer.parseInt(request.getParameter("ono"));
		String status = request.getParameter("status");
		
		//System.out.println(orderNo);
		//System.out.println(status);
		
		/*
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo(); // 1
		*/
		
		
		Order o = new Order();
		o.setOrderNo(orderNo);
		o.setStatus(status);
		
		
		int result = new OrderService().updateChangeOrder(o);
		
		if(result>0) { // 변경성공 /
			request.getSession().setAttribute("alertMsg", "예약상태가 변경되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.or?currentPage=1");
		}else {//변경실패
			request.getSession().setAttribute("alertMsg", "예약상태가 변경되지 않았습니다.");
			response.sendRedirect(request.getContextPath() + "/list.or?currentPage=1");
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
