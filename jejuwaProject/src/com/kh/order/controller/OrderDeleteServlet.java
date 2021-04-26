package com.kh.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.order.model.service.OrderService;

/**
 * Servlet implementation class OrderDeleteServlet
 */
@WebServlet("/delete.or")
public class OrderDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderNo = Integer.parseInt(request.getParameter("ono"));
		
		int result = new OrderService().deleteOrder(orderNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "예약이 성공적으로 취소되었습니다");
			response.sendRedirect(request.getContextPath() + "/list.mpr");
		}else {
			request.getSession().setAttribute("alertMsg", "당일여행은 취소가 어렵습니다.");
			response.sendRedirect(request.getContextPath() + "/list.mpr");
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
