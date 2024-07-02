package Controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import Board.BoardDAO;
import DTO.InqueryDTO;
import DTO.ProductDTO;
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
		
		public ViewController() {
			super();
		}
		
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				String productIdStr = req.getParameter("product_id");
				/*
				 * String idxStr = req.getParameter("idx"); System.out.println("test get idx :"+
				 * req.getParameter("idx")); if (idxStr != null && !idxStr.isEmpty()) { try {
				 * int idx = Integer.parseInt(idxStr); HttpSession session = req.getSession();
				 * session.setAttribute("idx", idx); // 세션에 idx 값을 저장 } catch
				 * (NumberFormatException e) { System.out.println("Invalid idx format: " +
				 * idxStr); resp.getWriter().println("Invalid idx format."); return; } }
				 */
				int product_id = -1;
				
				
				if(productIdStr !=null & !productIdStr.isEmpty()) {
					try {
						product_id = Integer.parseInt(productIdStr);
						HttpSession session = req.getSession();
						session.setAttribute("currentProductId", product_id);
						
						Integer product_id2 = (Integer) session.getAttribute("currentProductId");
						if (product_id2 == null) {
						    System.out.println("currentProductId 세션에 저장된 값이 없습니다.");
						    // 필요한 처리를 추가할 수 있습니다. 예를 들어 다시 doGet() 메서드로 이동하거나 다른 처리를 수행할 수 있습니다.
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
			 	List<InqueryDTO> board = dao.Inquerylist(product_id);
				dao.close();
				req.setAttribute("product_id", product_id);
			 	req.setAttribute("product2", product2);
				req.setAttribute("board", board);
				req.getRequestDispatcher("/test/ProductInfo.jsp").forward(req, resp);
				
				}
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("UTF-8");
			String idx = req.getParameter("idx");
			String inquery_title = req.getParameter("inquery_title");
	        String inquery_content = req.getParameter("inquery_content");
	        
	        String productIdStr = req.getParameter("product_id");
	        System.out.println("test test : "+ req.getParameter("product_id"));
	        
					int product_id = Integer.parseInt(productIdStr);
					HttpSession session = req.getSession();

					Integer product_id2 = (Integer) session.getAttribute("currentProductId");
				//	Integer UserIDX = req.getParameter("idx");;
					System.out.println("test USER IDX: "+ req.getParameter("idx"));
					if (product_id2 == null) {
					    System.out.println("currentProductId 세션에 저장된 값이 없습니다.");
					}

					    else { System.out.println((Integer) session.getAttribute("currentProductId"));
					    }
					
					BoardDAO dao = new BoardDAO();
					int result = dao.ModalWrite(inquery_title, inquery_content, product_id2);

					if (result > 0) {
						 resp.sendRedirect("ProductInfo.do?product_id=" + product_id); 
					} else {
						resp.sendRedirect("/error.jsp");
		
		}
		        }
			
}
