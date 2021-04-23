package com.kh.coupon.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.coupon.model.service.CouponService;
import com.kh.coupon.model.vo.Coupon;

/**
 * Servlet implementation class MyCouponListServlet
 */
@WebServlet("/mycoupon.list")
public class MyCouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		
//		리스트 조회 
		ArrayList<Coupon> cplist = new CouponService().selectListCoupon();
		
//		포워딩
		request.setAttribute("cplist",cplist);
		request.getRequestDispatcher("views/coupon/myCouponList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}