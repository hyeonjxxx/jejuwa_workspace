package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class ProductListViewServlet
 */
@WebServlet("/list.pdt")
public class ProductListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 페이징 처리
		int listCount;		
		int currentPage;	
		int pageLimit;		
		int boardLimit;		
		

		int maxPage;		
		int startPage;		
		int endPage;		
		
		// * listCount : 총 게시글 갯수 조회해서 담기
		listCount = new ProductService().selectListCount();
		
		// * currentPage : 현재 요청한 페이지
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 한 페이지 하단에 보여질 페이지 최대 갯수 (페이지 목록들을 몇 개 단위씩 보여줄건지)
		pageLimit = 5;
		
		// * boardLimit : 한 페이지 내에 보여질 게시글 최대 갯수
		boardLimit = 10;
				
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 객체에 담기
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// currentPage에 보여질  상품리스트 전체 조회 후 배열에 담기
		ArrayList<Product> list = new ProductService().selectProductList(pi);
				
		// 응답페이지 => pdtListView.jsp 포워딩
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);			
		request.getRequestDispatcher("views/product/productListView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
