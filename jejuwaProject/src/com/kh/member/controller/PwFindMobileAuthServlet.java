package com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class PwFindMobileAuthServlet
 */
@WebServlet("/PwFindMobileAuth.me")
public class PwFindMobileAuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwFindMobileAuthServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("pwFind_id");
		String memName = request.getParameter("pwFind_name");
		String phoneNumber = request.getParameter("pwd_phone");
		System.out.println(memId + memName + phoneNumber);
		Member m = new MemberService().pwFindCheck(memId, memName, phoneNumber);
		if( m == null) {
			// 이름 전화번호 일치하지 않을 경우 
	        JSONObject jobj = new JSONObject();
	    	jobj.put("result", false);

	    	response.setContentType("application/json");
	    	PrintWriter out = response.getWriter();			
	    	out.print(jobj.toJSONString()); 
		} else {
			// 이름 전화번호 일치할 경우
	        JSONObject jobj = new JSONObject();
	    	jobj.put("result", true);
	    	jobj.put("memPwd", m.getMemPwd());

	    	response.setContentType("application/json");
	    	PrintWriter out = response.getWriter();			
	    	out.print(jobj.toJSONString()); 
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
