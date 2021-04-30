package com.kh.myq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.myq.model.service.MYQService;
import com.kh.myq.model.vo.MYQ;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MYQUserInserServlet
 */
@WebServlet("/insertp.umyq")
public class MYQUserProductInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MYQUserProductInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("여기는 상품문의");
		// 첨부파일 넣기 
		if(ServletFileUpload.isMultipartContent(request)) {
			// 1_1. 용량 제한
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2. 저장할 폴더의 물리적인 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/myq_upfiles/");
			
			// 2. request => multipartRequest
			// 이 코드 하나로 내가 지정한 폴더에 파일들이 업로드 될 것임!!! 
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3.DB에 기록할 요청시 전달된 값 뽑기
			// 3_1. MYQ테이블에 insert할 데이터 뽑기
			MYQ q = new MYQ();
			q.setMyq_category(multiRequest.getParameter("category"));
			q.setMyq_title(multiRequest.getParameter("title"));
			q.setMyq_content(multiRequest.getParameter("content"));
			q.setMem_no(Integer.parseInt(multiRequest.getParameter("memNo")));
			q.setP_code(multiRequest.getParameter("pCode"));
			
			System.out.println("담긴 객체" + q);
			
			// 3_2. Attachment테이블에 insert할 데이터뽑기 => Attachment객체
			// 단, 여러개의  첨부파일이 있을것이기 때문에 해당 Attachment객체들을 ArrayList에 담기
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=3; i++) {
				String key ="upfile" + i;
				if(multiRequest.getOriginalFileName(key) != null) {
					// Attachment 객체 생성 + 원본명, 수정명, 폴더경로, 파일레벨(0/1)
					Attachment at = new Attachment();
					at.setOrgFileName(multiRequest.getOriginalFileName(key));
					at.setMdfFileName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/myq_upfiles/");
					
					// 각 객체생성을 차곡차곡 list에 추가하기
					list.add(at);
				}
			}
			
			// 4. (리스트 다시 조회하기)
			int result = new MYQService().insertProductUser(q, list);
			
			System.out.println(q);
			System.out.println(list);

			if(result > 0 ) { // 성공 => /list.th url 재요청 => 사진게시판 리스트페이지
				
				request.getSession().setAttribute("alertMsg", "문의 등록 성공");
				response.sendRedirect(request.getContextPath() + "/list.umyq?currentPage=1");
				
			} else { // 실패 => 에러문구 담아서 에러페이지 포워딩
				
				request.getSession().setAttribute("alertMsg", "문의 등록 실패");
			}
			
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
