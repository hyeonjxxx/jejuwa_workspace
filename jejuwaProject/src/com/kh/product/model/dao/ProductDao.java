package com.kh.product.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.product.model.vo.Product;

public class ProductDao {
	

	private Properties prop = new Properties();
	

	public ProductDao() {
		
		String fileName = ProductDao.class.getResource("/sql/product/product-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 총 게시글 갯수 
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) { //무조건 한행을 움직여줘야 게시글 갯수알수있음
				listCount = rset.getInt("LISTCOUNT"); //별칭으로 조회
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	
	
	// 페이징 처리+리스트 조회
	public ArrayList<Product> selectProductList(Connection conn, PageInfo pi) {
		//select문 => ResultSet 객체 (여러행)
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (pi.getCurrentPage() -1 ) * pi.getBoardLimit()+1);
			pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Product(rset.getString("p_code"),
						             rset.getString("P_name"),
						             rset.getInt("price"),
						             rset.getInt("p_stock"),
						             rset.getString("p_status")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}	
	
	
	// 상품추가
	public int insertProduct(Connection conn, Product p) {
		// insert문 => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(sql); //미완성
			pstmt.setString(1, p.getLocalCode());
			pstmt.setString(2, p.getThemeCode());
			pstmt.setString(3, p.getpName());
			pstmt.setString(4, p.getBasicPath());
			pstmt.setInt(5, p.getPrice());
			pstmt.setInt(6, p.getpStock());
			pstmt.setString(7, p.getDetailPath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	// File테이블에 세부이미지추가
	public int insertAttachment(Connection conn , Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOrgFileName());
			pstmt.setString(2, at.getMdfFileName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	// 상품수정
	// 상품테이블 수정페이지 불러오기
	public Product selectProduct(Connection conn, String pCode) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product(rset.getString("LOCAL_CODE"),
						        rset.getString("THEME_CODE"),
						        rset.getString("P_CODE"),
						        rset.getString("P_NAME"),
						        rset.getString("BASIC_PATH"),
						        rset.getInt("PRICE"),
						        rset.getInt("P_STOCK"),
						        rset.getString("DEATIL_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}
	// 세부이미지 수정페이지에 불러오기
	public ArrayList<Attachment> selectAttachment(Connection conn, String pCode) {
		// 세부이미지가 여러개니까 여러행 조회!!
		ArrayList<Attachment> list = new ArrayList<>();;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOrgFileName(rset.getString("ORG_FILENAME"));
				at.setMdfFileName(rset.getString("MDF_FILENAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setpCode(rset.getString("P_CODE"));
				
				list.add(at);
				
				//System.out.println(list);
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// delete 상품
	public int deleteProduct(Connection conn, String pCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// update 상품 
	public int updateProduct(Connection conn, Product p) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updataProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getLocalCode());
			pstmt.setString(2, p.getThemeCode());
			pstmt.setString(3, p.getpName());
			pstmt.setString(4, p.getBasicPath());
			pstmt.setInt(5, p.getPrice());
			pstmt.setInt(6, p.getpStock());
			pstmt.setString(7, p.getDetailPath());
			pstmt.setString(8, p.getpCode());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// update 세부이미지들
	public int updateAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOrgFileName());
			pstmt.setString(2, at.getMdfFileName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setString(4, at.getpCode());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// insert 수정페이지에서 세부이미지 추가
	public int insertNewAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);   
			pstmt.setString(1, at.getpCode());
			pstmt.setString(2, at.getOrgFileName());
			pstmt.setString(3, at.getMdfFileName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
		
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}	
	
	//쎔네일리스트로 상품보기
		public ArrayList<Product> selectThList(Connection conn){
			
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectThList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();

				while(rset.next()) {
					
					Product p = new Product();
					p.setpCode(rset.getString("p_code"));
					p.setpName(rset.getString("p_name"));
					p.setPrice(rset.getInt("price"));
					p.setBasicPath(rset.getString("basic_path"));
				
					list.add(p);	
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				close(rset);
				close(pstmt);
			}		
			
			return list;
		}
		

		// 상세페이지에서 불려올 상품 리스트
		public Product selectInfoProduct(Connection conn, String pCode) {
			
			Product p = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectInfoProduct");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pCode);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					p = new Product(rset.getString("p_name"),
									rset.getString("p_code"),
							        rset.getInt("price"),
							        rset.getString("basic_path"),
							        rset.getString("deatil_path"),
							        rset.getString("local_name"),
							        rset.getString("theme_name"));
					
					//System.out.println(p);
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return p;
			
				
		}
		
		// 투어 카테고리 선택 
		public ArrayList<Product> selectThList_TR(Connection conn, PageInfo pi) {
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectThList_TR");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				pstmt.setInt(1, (pi.getCurrentPage() -1 ) * pi.getBoardLimit()+1);
				pstmt.setInt(2, pi.getCurrentPage() * pi.getBoardLimit());

				while(rset.next()) {
					
					Product p = new Product();
					p.setpCode(rset.getString("p_code"));
					p.setpName(rset.getString("p_name"));
					p.setPrice(rset.getInt("price"));
					p.setBasicPath(rset.getString("basic_path"));
				
					list.add(p);				
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				close(rset);
				close(pstmt);
			}		
			
			return list;
		}
		
		public int selectListCount_TR(Connection conn) {
			
			int listCount = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectListCount_TR");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				if(rset.next()) { //무조건 한행을 움직여줘야 게시글 갯수알수있음
					listCount = rset.getInt("LISTCOUNT"); //별칭으로 조회
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return listCount;
		}


		public ArrayList<Product> selectThList_TT(Connection conn) {
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectThList_TT");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();

				while(rset.next()) {
					
					Product p = new Product();
					p.setpCode(rset.getString("p_code"));
					p.setpName(rset.getString("p_name"));
					p.setPrice(rset.getInt("price"));
					p.setBasicPath(rset.getString("basic_path"));
				
					list.add(p);				
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				close(rset);
				close(pstmt);
			}		
			
			return list;
		}

		public ArrayList<Product> selectThList_AY(Connection conn) {
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectThList_AY");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();

				while(rset.next()) {
					
					Product p = new Product();
					p.setpCode(rset.getString("p_code"));
					p.setpName(rset.getString("p_name"));
					p.setPrice(rset.getInt("price"));
					p.setBasicPath(rset.getString("basic_path"));
				
					list.add(p);				
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				close(rset);
				close(pstmt);
			}		
			
			return list;
		}

		public ArrayList<Product> selectThList_FD(Connection conn) {
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectThList_FD");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();

				while(rset.next()) {
					
					Product p = new Product();
					p.setpCode(rset.getString("p_code"));
					p.setpName(rset.getString("p_name"));
					p.setPrice(rset.getInt("price"));
					p.setBasicPath(rset.getString("basic_path"));
				
					list.add(p);				
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				close(rset);
				close(pstmt);
			}		
			
			return list;
		}
		
		//지역으로 검색
		public ArrayList<Product> selectThList_SS(Connection conn) {
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectThList_SS");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();

				while(rset.next()) {
					
					Product p = new Product();
					p.setpCode(rset.getString("p_code"));
					p.setpName(rset.getString("p_name"));
					p.setPrice(rset.getInt("price"));
					p.setBasicPath(rset.getString("basic_path"));
				
					list.add(p);				
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				close(rset);
				close(pstmt);
			}		
			
			return list;
		}
		
		
		// 관리자페이지 - 검색기능
		public ArrayList<Product> searchOptions(Connection conn, String searchOp, String keyword) {
			ArrayList<Product>list = new ArrayList<>();
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			String sql = "";
			
			// searchOp이 상품명/지역/테마인 경우 + 검색어
			
			if(searchOp.equals("pname")) {	
				
				sql=prop.getProperty("adminSearchpName");
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + keyword + "%");
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						list.add(new Product(rset.getString("p_code"),
					             rset.getString("P_name"),
					             rset.getInt("price"),
					             rset.getInt("p_stock"),
					             rset.getString("p_status")));
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					close(rset);
					close(pstmt);
				}
				
			}else if(searchOp.equals("local")){	
			
				sql=prop.getProperty("adminSearchLocal"); 
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + keyword + "%");
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						list.add(new Product(rset.getString("p_code"),
					             rset.getString("P_name"),
					             rset.getInt("price"),
					             rset.getInt("p_stock"),
					             rset.getString("p_status")));
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					close(rset);
					close(pstmt);
				}
								
			}else{
				sql=prop.getProperty("adminSearchTheme"); 
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + keyword + "%");
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						list.add(new Product(rset.getString("p_code"),
					             rset.getString("P_name"),
					             rset.getInt("price"),
					             rset.getInt("p_stock"),
					             rset.getString("p_status")));
						
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					close(rset);
					close(pstmt);
				}
			}
			
			//System.out.println(list);
			return list;
		}		
		
		// 사용자 검색기능
		public ArrayList<Product> searchKeyword(Connection conn, String keyword) {
			ArrayList<Product>list = new ArrayList<>();
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			String sql = "";

				sql=prop.getProperty("userSearchpName");
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + keyword + "%");
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						list.add(new Product(rset.getString("p_code"),
					             rset.getString("P_name"),
					             rset.getInt("price"),
					             rset.getString("basic_path")));
						
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					close(rset);
					close(pstmt);
				}
				
				System.out.println(list);
				return list;
		}	
		
		
		
		// 좋아요 카운트
		
		
		public int likeCount(Connection conn, String pCode, int memNo) {
			// select문
			
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("likeCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pCode);
				pstmt.setInt(2, memNo);
				
				rset = pstmt.executeQuery();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
	
		// 결제 페이지에 select문 조회
		public Product selectPayment(Connection conn, String pcode) {
			
			Product p = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectPayment");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pcode);
				
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					p = new Product(rset.getString("p_name"),
									rset.getString("p_code"),
							        rset.getInt("price"),
							        rset.getString("basic_path"),
							        rset.getString("deatil_path"));
					
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return p;
				
		}


}
