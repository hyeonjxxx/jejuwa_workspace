package com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class MobileAuthServlet
 */
@WebServlet("/mobileAuth.me")
public class MobileAuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MobileAuthServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
		
			String phoneNumber = request.getParameter("phoneNumber");
			// ajax에서 사용자가 입력한 값을 변수 phoneNumber로 지정 =>  서블릿으로 넘어온 키값이 phoneNumber를 String phoneNumber라는 변수에 담아줌
			
			// 숫자 4글자 랜덤값 생성하기
	        Random rand  = new Random();
	        
	        String numStr = "";
	        for(int i=0; i<4; i++) {
	            String ran = Integer.toString(rand.nextInt(10));
	            numStr+=ran;
	        }

	        String result = new MemberService().certifiedPhoneNumber(phoneNumber,numStr);
	        
	        if(result.isEmpty()) {
	        	System.out.println("인증 실패!");
	        } else {
	        	System.out.println("인증 성공!");
	        }
	        
	        JSONObject jobj = new JSONObject();
	    	jobj.put("result", numStr);

	    	response.setContentType("application/json");
	    	PrintWriter out = response.getWriter();			
	    	out.print(jobj.toJSONString()); 
    	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
