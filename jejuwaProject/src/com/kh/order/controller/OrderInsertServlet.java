package com.kh.order.controller;

import java.io.IOException;
import java.sql.Date;

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
 * Servlet implementation class OrderInsertServlet
 */
@WebServlet("/insert.or")
public class OrderInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int price = Integer.parseInt(request.getParameter("price"));
		String travleDate = request.getParameter("travleDate"); 
		System.out.println(travleDate);
		String eamil = request.getParameter("email");
		//String cReason = request.getParameter("creason");
		String pCode = request.getParameter("pcode");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		String memName = loginUser.getMemName();
		
		Order o = new Order();
		o.setAmount(price);
		o.setTravelDate(travleDate);
		o.setTravelUser(memName);
		o.setTravelEmail(eamil);
		//o.setcReason(cReason);
		o.setMemNo(memNo);
		o.setpCode(pCode);
		
		int result = new OrderService().insertOrder(o);
		
		if(result>0) {
			session.setAttribute("alertMsg", "주문이 성공적으로 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.mpr");
		}else {
			
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
