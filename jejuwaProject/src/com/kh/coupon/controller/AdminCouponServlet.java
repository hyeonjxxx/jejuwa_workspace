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
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;


/**
 * Servlet implementation class AdminCouponServlet
 */
@WebServlet("/listadmin.cpn")
public class AdminCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCouponServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		// --------------- 페이징 처리 -----------------
		// 페이징 처리시 필요한 변수
		int listCount;		// 현재 총 게시글 갯수
		int currentPage;	// 현재 페이지(즉, 요청한 페이지)
		int pageLimit;		// 한 페이지 하단에 보여질 페이징바의 페이지 최대 갯수(몇 개 단위)
		int boardLimit;		// 한 페이지 내에 보여질 게시글 최대 갯수 (몇 개 단위)
		
		// 위의 네개의 변수를 가지고 페이징 바의 시작 수, 끝 수를 공식처럼 계산해야한다.
		// 마지막 페이지 수도 계산을 해야한다.
		int maxPage;		// 전체 페이지들 중에 가장 마지막 페이지 (listCount, boardLimit을 가지고 구할 예정)
		int startPage;		// 현재 페이지 하단에 보여질 페이징 바의 시작수(currentPage, pageLimit을 가지고 구할 예정) (ex.15페이지 클릭시 11페이지가 시작페이지)
		int endPage;		// 현재 페이지 하단에 보여질 페이징 바의 끝 수(startPage, pageLimit, maxPage를 가지고 구할 예정)
		
		
		
		// * listCount : 총 게시글 갯수 조회해서 담기
		listCount = new ReviewService().selectListCount();
	
		
		// * currentPage : 현재 요청한 페이지
		currentPage = Integer.parseInt(request.getParameter("currentPage"));currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 한 페이지 하단에 보여질 페이지 최대 갯수 (페이지 목록들을 몇 개 단위씩 보여줄건지)
		pageLimit = 2;
		
		// * boardLimit : 한 페이지 내에 보여질 게시글 최대 갯수
		boardLimit = 10;
				
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		/*
		 * * startPage : 현재 페이지에 보여질 페이징 바의 시작수
		 * 
		 * pageLimit이 5라는 가정 하에
		 * startPage : 1, 6, 11, 16, ...
		 * 							=> n * 5 + 1
		 * 						          (5 => pageLimit수)
		 * currentPage	startPage
		 * 		1			1		=> 0 * 5 + 1 => n=0
		 * 		2			1		=>
		 * 		5			1		=>
		 * 
		 * 		6			6		=> 1 * 5 + 1 => n=1
		 * 		8			6		=>
		 * 		10			6		=>
		 * 
		 * currentPage =  1~5 => n=0
		 * currentPage = 6~10 => n=1
		 * 
		 * 						 n == (currentPage - 1) / pageLimit
		 */
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 한공간에 담기
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Coupon> adlist = new CouponService().adminCouponList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("adlist", adlist);
		
		request.getRequestDispatcher("views/coupon/adminCouponServlet.jsp").forward(request, response);
		

	}

	
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
