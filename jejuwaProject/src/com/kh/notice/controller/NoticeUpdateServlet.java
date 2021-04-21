package com.kh.notice.controller;

import java.io.File;
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
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/update.no")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 공지사항 업데이트 서블릿
		// 인코딩
		request.setCharacterEncoding("utf-8");
		// enctype으로 전달 받음
		if(ServletFileUpload.isMultipartContent(request)) {
		
			// 1_1. 전송되는 파일 용량 제한
			int maxSize = 10*1024*1024;
			// 1_2. 전달되는 파일을 저장시킬 폴더의 물리적인 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_upfiles/");
			
			// 2. HttpServletRequest request => MultipartRequest multiRequest
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. sql문 실행하기 위해 요청시 전달된 값 뽑기
			// Notice 테이블에 Update할 값 뽑기
			int noticeNo = Integer.parseInt(multiRequest.getParameter("noticeNo"));
			String noticeTitle = multiRequest.getParameter("title");
			String noticeContent = multiRequest.getParameter("content");
			
			// Q
			//String originFileName = multiRequest.getParameter("originFileName");
			//String originFilePath = multiRequest.getParameter("originFilePath");
			//=> noticeUpdateForm.jsp에서 기존에 첨부파일이 있을 경우에만 전달받음
			//String originFileName = null;
			//String originFilePath = null;
			// Q
			
			Notice n = new Notice();
			n.setNoticeNo(noticeNo);
			n.setNoticeTitle(noticeTitle);
			n.setNoticeContent(noticeContent);
			
			// 새로 넘어온 첨부파일이 있을 경우
			if(multiRequest.getOriginalFileName("reUpfile") != null) {
				// 기존 첨부파일이 있는데 새로 넘어온 첨부파일이 있을 경우
				// => originFileName, filePath "기존값" -> "새로넘어온값"
				if(multiRequest.getParameter("originFilePath") != null) {
					// 기존에 저장된 파일 삭제
					new File(multiRequest.getParameter("originFilePath")).delete();
					n.setOriginFileName(multiRequest.getOriginalFileName("reUpfile"));
					n.setFilePath("/resources/notice_upfiles/" + multiRequest.getFilesystemName("reUpfile"));
				} else {
					// 기존 첨부파일이 없는데 새로 넘어온 첨부파일이 있을 경우
					// => originFileName, filePath null -> "새로넘어온값"
					n.setOriginFileName(multiRequest.getOriginalFileName("reUpfile"));
					n.setFilePath("/resources/notice_upfiles/" + multiRequest.getFilesystemName("reUpfile"));
				}
			}
			
			int result = new NoticeService().updateNotice(n);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "공지사항이 수정되었습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.no?nno=" + noticeNo);
			}else {
				// 수정 예정
				request.getSession().setAttribute("alert", "공지사항 수정을 실패했습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.no?nno=" + noticeNo);
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
