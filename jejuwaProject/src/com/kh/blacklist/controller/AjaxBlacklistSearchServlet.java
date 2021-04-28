package com.kh.blacklist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.blacklist.model.service.BlacklistService;
import com.kh.blacklist.model.vo.Blacklist;

/**
 * Servlet implementation class AjaxBlacklistSearchServlet
 */
@WebServlet("/searchAjax.bl")
public class AjaxBlacklistSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxBlacklistSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Ajax
		String searchCtg = request.getParameter("searchCtg");
		String keyword = request.getParameter("keyword");
		
		//System.out.println(searchCtg);
		//System.out.println(keyword);
		
		ArrayList<Blacklist> list = new BlacklistService().searchBlacklist(searchCtg, keyword);

//		for(Member m : list) {
//		System.out.println(m);
//		}
	
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
