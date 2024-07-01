package Controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import Board.BoardDAO;
import DTO.InqueryDTO;
import DTO.ProductDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/test/ProductInfo.do")
	public class ViewController extends HttpServlet {
		private static final long serialVersionUID = 1L;

		public ViewController() {
			super();
		}
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
				ProductDTO dto = new ProductDTO();
				BoardDAO dao = new BoardDAO();
				String product_id = req.getParameter("product_id");
				List<ProductDTO> product2 = dao.View2(Integer.parseInt(product_id));
			 	List<InqueryDTO> board = dao.Inquerylist(Integer.parseInt(product_id));
				dao.close();
				req.setAttribute("product_id", product_id);
			 	req.setAttribute("product2", product2);
				req.setAttribute("board", board);
				req.getRequestDispatcher("/test/ProductInfo.jsp").forward(req, resp);
				
				}
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("UTF-8");
			
			InqueryDTO dto2 = new InqueryDTO();
			dto2.setInquery_title(req.getParameter("inquery_title"));
			dto2.setInquery_content(req.getParameter("inquery_content"));
			
			  BoardDAO dao = new BoardDAO();
			  
			  int result = dao.ModalWrite("inquery_title", "inquery_content");
			  
			  if (result == 1) { resp.sendRedirect("/test/ProductInfo.do"); } else {
			  System.out.println("글쓰기에 실패."); }
			 
			
				/*HttpSession session = req.getSession();
		        BoardDAO dao2 = new BoardDAO();
		        int result2 = dao2.ModalWrite("inquery_title", "inquery_content");

		        if (result2 > 0) {
		        
		            resp.getWriter().println("성공");
		        } else {
		            resp.getWriter().println("실패");*/
		
		}
}