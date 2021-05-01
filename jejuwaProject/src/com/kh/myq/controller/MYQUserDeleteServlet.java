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
		
		String[] arrayParam2 = request.getParameterValues("myq_no[]");
		
		String myq_no = "'" + String.join("', '", arrayParam2) + "'";
		
		System.out.println("DELETE FROM table_name WHEERE myq_no IN (" + myq_no + ");");
		
		//DELETE FROM table_name WHEERE myq_no IN ('23', '25', '32');
		
		//for(int i=0; i<list.size(); i++) {
		//	list.indexOf(i)
		//}
		
		//int result = new MYQService().deleteUserMYQ(list);
		
		//System.out.println(list);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
