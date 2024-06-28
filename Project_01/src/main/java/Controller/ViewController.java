package Controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import Board.BoardDAO;
import Board.BoardDTO;
import DTO.InqueryDTO;
import DTO.ProductDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/test/ProductInfo.do")
	public class ViewController extends HttpServlet {
		private static final long serialVersionUID = 1L;

		public ViewController() {
			super();
		}
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws
		  ServletException, IOException {
				BoardDAO dao = new BoardDAO();
				String product_id = req.getParameter("product_id");
				
				List<BoardDTO> product = dao.View();
				List<ProductDTO> product2 = dao.View2(Integer.parseInt(product_id));
			 	List<BoardDTO> boardLists = dao.selectListPage();
			 	List<InqueryDTO> board = dao.Inquerylist(Integer.parseInt(product_id));
			 	
			 	dao.close();
			 	req.setAttribute("product", product);
			 	req.setAttribute("product2", product2);
				req.setAttribute("boardLists", boardLists);
				req.setAttribute("board", board);
				req.getRequestDispatcher("/test/ProductInfo.jsp").forward(req, resp);
		}
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("UTF-8");
			
			BoardDTO dto = new BoardDTO();
			dto.setTitle(req.getParameter("title"));
			dto.setContent(req.getParameter("content"));
			
			BoardDAO dao = new BoardDAO();
			int result = dao.ModalWrite(dto);
			dao.close();
			if (result == 1) {
				resp.sendRedirect("/test/ProductInfo.do");
			}
			else {
				System.out.println("글쓰기에 실패.");
		}
		}	
}