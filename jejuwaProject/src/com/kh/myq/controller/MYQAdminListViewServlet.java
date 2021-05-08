package com.kh.myq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.myq.model.service.MYQService;
import com.kh.myq.model.vo.MYQ;

/**
 * Servlet implementation class MYQUserListViewServlet
 */
@WebServlet("/list.amyq")
public class MYQAdminListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MYQAdminListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;     // 현재 총 게시글 횟수
		int currentPage;   // 현재 페이지(즉, 요청한 페이지)
		int pageLimit;     // 한 페이지 하단에 보여질 페이징바의 페이지 최대갯수(몇개단위)
		int boardLimit;    // 한 페이지 내에 보여질 게시글 최대 갯수(몇개 단위)
		
		int maxPage;       // 전체 페이지들 중 가장 마지막 페이지(listCount, boardLimit를 가지고 구할것)
		int startPage;     // 현재 페이지에 하단에 보여질 페이징 바의 시작수(currentPage, pageLimit를 가지고 구할것)
		int endPage;       // 현재 페이지에 하단에 보여질 페이징 바의 끝 수 (statPage, pageLimit, maxPage를 가지고 구할 것)
		
		// * listCount : 총 게시글 갯수 조회해서 담기
		listCount = new MYQService().selectListCountAdmin();
		
		// * currentPage : 현재 요청한 페이지
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 한 페이지 하단에 보여질 페이지 최대 개수(페이지 목록들 몇 개 단위)
		pageLimit = 10;
		
		// * MYQLimit : 한 페이지 내에 보여질 게시글 최대 개수
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		// => ceil이 올림형태여도 정수형이 아니라 실수형이므로 정수형으로 형변환 필요함
		
		/* * endPage : 현재 페이지에 보여지는 페이징바의 끝 수
		 * startPage, pageLimit에 영향을 받음
		 */
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1 ;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		} 
		// 페이징정보들을 어딘가의 한 공간에 담자! 저거 일일이 다 쓰기 어려우니까 아예 PageInfo 객체를 만들어서 그 안에서 전달하자
		// 1. 페이징바 만들때 필요한 PageInfo객체 만들기
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage );
		
		// 2. 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 조회해오기
		ArrayList<MYQ> list = new MYQService().selectListAdmin(pi);
		
		// 조회된 pi, list 객체 가져오기
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/myq/myqAdminListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
