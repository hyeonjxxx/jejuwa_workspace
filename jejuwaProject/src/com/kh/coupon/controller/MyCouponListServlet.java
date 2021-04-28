package com.kh.coupon.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.coupon.model.service.CouponService;
import com.kh.coupon.model.vo.Coupon;

/**
 * Servlet implementation class MyCouponListServlet
 */
@WebServlet("/list.mycpn")
public class MyCouponListServlet extends HttpServlet {
	private static final long serialVersionUID =1L;

    /**
     * Default constructor. 
     */
    public MyCouponListServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//쿠폰리스트 조회 후 
		
		
		ArrayList<Coupon> mylist = new CouponService().selectMyCouponList();
		
	
		request.setAttribute("mylist",mylist);
		request.getRequestDispatcher("views/coupon/myCouponList.jsp").forward(request,response);
		

}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
