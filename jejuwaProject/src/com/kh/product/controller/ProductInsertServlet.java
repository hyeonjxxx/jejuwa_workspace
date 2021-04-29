package com.kh.product.controller;

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
import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProductInsertServlet
 */
@WebServlet("/insert.pdt")
public class ProductInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// product ->  basicImg, detailImg에 업로드    필수
		// file -> Img_Upfile에 업로드   선택
		
		// 인코딩
		request.setCharacterEncoding("utf-8");
		// multipart로 upload됐는지 조건검사
		if(ServletFileUpload.isMultipartContent(request)) {
			// 1_1 용량제한값
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2 저장할 폴더의 물리적인 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/product_upfiles/");
			
			// 2. request => mutilRequest  -> 업로드한 파일이 내가 지정한 파일에 업로드됨
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			// 3. DB에 기록할 요청시 전달된 값 뽑기
			// 3_1. Product테이블에 insert할 데이터 뽑기
			Product p = new Product();
			p.setLocalCode(multiRequest.getParameter("loaclCode"));
			p.setThemeCode(multiRequest.getParameter("themeCode"));
			p.setpName(multiRequest.getParameter("pName"));
			p.setBasicPath("resources/product_upfiles/" + multiRequest.getFilesystemName("titleImg"));
			p.setPrice(Integer.parseInt(multiRequest.getParameter("price")));
			p.setpStock(Integer.parseInt(multiRequest.getParameter("pStock")));
			p.setDetailPath("resources/product_upfiles/" + multiRequest.getParameter("detailImg"));

			
			// 3_2. File테이블에 insert할 데이터 뽑기
			// 단 여러개의 첨부파일 업로드 예정 따라서 반복문 사용해서 ArrayList에 담기
			Attachment at = null;
			ArrayList<Attachment> list = new ArrayList<>();
			
			// 반복문 사용해서 담기 
			for(int i=1; i<=3; i++) {
				String key = "subImg" + i;
				//세부이미지 파일 유무 검사
				if(multiRequest.getOriginalFileName(key) != null) {
					// 있을경우  at에 객체 생성 + 원본명, 수정명, 경로, 상품코드?
				    at = new Attachment();
					at.setOrgFileName(multiRequest.getOriginalFileName(key));
					at.setMdfFileName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/product_upfiles/");
			
					list.add(at);
				}
	
			}		
			// 4. 상품등록용 서비스 호출 및 결과 받기
			int result = new ProductService().insertProduct(p, at);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "상품이 등록되었습니다. :)");
				response.sendRedirect(request.getContextPath()+"/list.pdt?currentPage=1");
			}else {
				request.getSession().setAttribute("alertMsg", "상품 등록에 실패하였습니다. :(");
				response.sendRedirect(request.getContextPath()+"/list.pdt?currentPage=1");
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
