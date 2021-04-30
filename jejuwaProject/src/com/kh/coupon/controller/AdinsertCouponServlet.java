package com.kh.coupon.controller;

import java.io.IOException;

import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.coupon.model.service.CouponService;
import com.kh.coupon.model.vo.Coupon;

/**
 * Servlet implementation class AdinsertCouponServlet
 */
@WebServlet("/enroll.coupon")
public class AdinsertCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdinsertCouponServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @param session 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response, ServletRequest session) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String cpn_Name = request.getParameter("name_cpn");
		int cpn_Dc = Integer.parseInt(request.getParameter("dc"));
		String cpn_Str_Date = request.getParameter("start_cpn");
		String cpn_End_Date = request.getParameter("end_cpn");
		int cpn_Min = Integer.parseInt(request.getParameter("use"));
		
		Coupon ic = new Coupon();
		ic.setCpn_Name(cpn_Name);
		ic.setCpn_Dc(cpn_Dc);
		ic.setCpn_Str_Date(cpn_Str_Date);
		ic.setCpn_End_Date(cpn_End_Date);
		ic.setCpn_Min(cpn_Min);
		
		int result = new CouponService().insertCoupon(ic);
		
		if(result > 0 ) {
			session.setAttribute("alertMsg", "성공적으로 쿠폰이 추가됐습니다");
			response.sendRedirect(request.getContextPath() + "/listadmin.cpn?currentPage=1");
			
		}else {
			session.setAttribute("alertMsg", "쿠폰추가 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/listadmin.cpn?currentPage=1");
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
