package Controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import Board.BoardDAO;
import Board.BoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/test/View.do")
	public class ViewController extends HttpServlet {
		private static final long serialVersionUID = 1L;

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) 
		  throws ServletException, IOException {
			BoardDAO dao = new BoardDAO();
			String idx = req.getParameter("idx");
			BoardDTO dto = dao.View(idx);
			dao.close();
			
		System.out.println("------------");
		String ext = null, fileName = dto.getSfile();
		if(fileName!=null) {
			ext = fileName.substring(fileName.lastIndexOf(".")+1);
		}
		String[] mimeStr = {"png","jpg","gif"};
		List<String> mimeList = Arrays.asList(mimeStr);
		boolean isImage = false;
		if(mimeList.contains(ext)) {
			isImage = true;
		}
		req.setAttribute("dto", dto);
		req.setAttribute("isImage", isImage);
		req.getRequestDispatcher("/test/View.jsp").forward(req, resp);
		}
		
}