package com.kh.myq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.myq.model.service.MYQService;

/**
 * Servlet implementation class MYQUserDeleteServlet
 */
@WebServlet("/delete.umyq")
public class MYQUserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MYQUserDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ArrayList list = new ArrayList <> (Integer.parseInt(request.getParameter("myq_no")));
		
		String[] arrayParam = request.getParameterValues("myq_no[]");

		//String myq_no = String.join("', '", arrayParam);
		
		int result = new MYQService().deleteUserMYQ(arrayParam);
		
		//DELETE FROM table_name WHEERE myq_no IN ('23', '25', '32');
		
		//for(int i=0; i<list.size(); i++) {
		//	list.indexOf(i)
		//}
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "문의 삭제 성공");
			response.sendRedirect(request.getContextPath() + "/list.umyq?currentPage=1");
		} else {
			request.getSession().setAttribute("alertMsg", "문의 삭제 실패");
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
