package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/insert.no")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 공지사항 insert
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		// enctype이 잘 전송되었을 경우
		if(ServletFileUpload.isMultipartContent(request)) {
			// 외부 라이브러리 cos.jar 연동
			// 1. 전송되는 파일을 처리할 작업 내용
			// 1_1. 전달되는 파일의 용량 제한
			int maxSize = 10*1024*1024;
			
			// 1_2. 전달될 파일을 저장할 서버의 폴더 경로 알아내기
			String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_upfiles/");
			
			// 2. 전달된 파일명 수정 후 서버에 업로드 작업
			// HttpServletRequest request => MultipartRequest mulitRequest
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. 요청시 전달된 값들 뽑아서 vo에 담기
			// Notice테이블에 insert할 값 담기(제목, 내용, 원본명, 경로(수정명+확장자???)
			String noticeTitle = multiRequest.getParameter("title");
			String noticeContent = multiRequest.getParameter("content");
			
			// Q. 하나의 첨부파일만 업로드 가능한 공지사항 테이블
			// 파일을 담는 과정 질문..
			// 첨부파일이 있다면 변수에 담기
			String orgFileName = ""; // null로 초기화 해야할까?
			String filePath = ""; // null ?
			if(multiRequest.getOriginalFileName("upfile") != null) {
				orgFileName = multiRequest.getOriginalFileName("upfile");
				filePath = "resources/notice_upfiles/" + multiRequest.getFilesystemName("upfile"); // 파일 경로/수정명 개념
			}
			
			Notice n = new Notice();
			n.setNoticeTitle(noticeTitle);
			n.setNoticeContent(noticeContent);
			
			if(!orgFileName.equals("")) {
				n.setOriginFileName(orgFileName);
				n.setFilePath(filePath);
			}
			
			// 4.공지사항 작성 요청 및 결과 받기
			int result = new NoticeService().insertNotice(n);
			
			if(result > 0) { // 게시글 등록 성공 => /list.no?currentPage=1 재요청
				request.getSession().setAttribute("alertMsg", "공지사항이 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.no?currentPage=1");
				
			}else { // 게시글 등록 실패 => alertMsg "공지사항 등록에 실패하였습니다."
				request.getSession().setAttribute("alertMsg", "공지사항 등록에 실패하였습니다.");
				response.sendRedirect(request.getContextPath() + "/list.no?currentPage=1");
				
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
