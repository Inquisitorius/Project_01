package Controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import Board.BoardDAO;
import DTO.InqueryDTO;
import DTO.ProductDTO;
import Login.LoginDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/test/ProductInfo.do")

@MultipartConfig(
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 15
		)

	public class ViewController extends HttpServlet {
		private static final long serialVersionUID = 1L;
		 private static final int RECORDS_PER_PAGE = 10;
		
		public ViewController() {
			super();
		}
		
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				String productIdStr = req.getParameter("product_id");
				HttpSession session = req.getSession();
				
			    Integer userId = (Integer) session.getAttribute("idx");
				int product_id = -1;
		
				// list 변경
				String pageStr = req.getParameter("page");
				int page = (pageStr != null) ? Integer.parseInt(pageStr) :1;
				
				if(productIdStr !=null & !productIdStr.isEmpty()) {
					try {
						product_id = Integer.parseInt(productIdStr);
						session.setAttribute("currentProductId", product_id);
						session.setAttribute("userId", userId);
						
						Integer product_id2 = (Integer) session.getAttribute("currentProductId");
						if (product_id2 == null) {
						    System.out.println("currentProductId 세션에 저장된 값이 없습니다.");
						  
						} else {
							
						}
					}catch(NumberFormatException e) {
						System.out.println("Invalid product_id format: " + productIdStr);
		                resp.getWriter().println("Invalid product_id format.");
		                return;
					}
				};
				
				BoardDAO dao = new BoardDAO();
				List<ProductDTO> product2 = dao.View2(product_id);
			 	List<InqueryDTO> newlist = dao.newlist(product_id, page, RECORDS_PER_PAGE);
			 	
			 	 int totalRecords = dao.getTotalRecords(product_id);
			     int totalPages = (int) Math.ceil(totalRecords / (double) RECORDS_PER_PAGE);
			     
				dao.close();
				req.setAttribute("product_id", product_id);
			 	req.setAttribute("product2", product2);
				req.setAttribute("user_id", userId);
				req.setAttribute("newlist", newlist);
				req.setAttribute("totalPages", totalPages);
				req.setAttribute("currentPage", page);
				
				req.getRequestDispatcher("/test/ProductInfo.jsp").forward(req, resp);
				
				}
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				req.setCharacterEncoding("UTF-8");
				
				HttpSession session = req.getSession(false);
			    if (session == null || session.getAttribute("idx") == null) {
			        resp.sendRedirect("/MainPage/LoginPage.jsp");
			        return;
			    } else {
			        System.out.println("로그인 정보가 있습니다.");
			    }

			    	String inquery_title = req.getParameter("inquery_title");
	        		String inquery_content = req.getParameter("inquery_content");
	        		
	        		String productIdStr = req.getParameter("product_id");
	        		System.out.println("test test : "+ req.getParameter("product_id"));
	        
					int product_id = Integer.parseInt(productIdStr);
					
					Integer product_id2 = (Integer) session.getAttribute("currentProductId");
					Integer user_id = (Integer) session.getAttribute("idx");
					Integer quantity = (Integer) session.getAttribute("quantity");
					session.setAttribute("quantity", quantity);
					session.setAttribute("user_id", user_id);
					
					BoardDAO dao = new BoardDAO();
					int result = dao.ModalWrite(inquery_title, inquery_content, product_id2, user_id);

					if (result > 0) {
						 resp.sendRedirect("ProductInfo.do?product_id=" + product_id); 
					} else {
						resp.sendRedirect("/error.jsp");
		}
		        }
			
	}
