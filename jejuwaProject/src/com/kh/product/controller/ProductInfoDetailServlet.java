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
		
		
		Product p = new ProductService().selectInfoProduct(pCode);
		// 오류 구문 ArrayList<File> list = new ProductService().selectFileList(pCode);
		
		//System.out.println(p);
		//System.out.println(list);
		
		request.setAttribute("p", p);
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
