package com.kh.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.product.model.service.ProductService;

/**
 * Servlet implementation class ProductDeleteServlet
 */
@WebServlet("/delete.pdt")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pCode = request.getParameter("pcode");
		int result = new ProductService().deleteProduct(pCode);
		
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "상품이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath()+"/list.pdt?currentPage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "상품 삭제를 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/updateForm.pdt?pcode=" + pCode);
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
