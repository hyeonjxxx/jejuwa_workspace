package com.kh.product.controller;

import java.io.IOException;

//import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.kh.common.model.vo.File;
import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ProductDetailViewServlet
 */
@WebServlet("/infoDetail.pdt")
public class ProductInfoDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInfoDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String pCode = request.getParameter("pcode");
		
		
		// 오류 구문 ArrayList<Attachment> list = new ProductService().selectAttachment(pCode);
		
		//System.out.println(p);
		//System.out.println(list);
		
		int memNo = 0;
		if(request.getSession().getAttribute("loginUser") != null) {
			memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();		
		}
		
		int count = new ProductService().likeCount(pCode, memNo);
		
		System.out.println(count);
		Product p = new ProductService().selectInfoProduct(pCode);
			
		request.setAttribute("p", p);
		request.setAttribute("count", count);
		// 오류 구문 request.setAttribute("list", list);
		request.getRequestDispatcher("views/product/productInfoDetail.jsp").forward(request, response);

													
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
