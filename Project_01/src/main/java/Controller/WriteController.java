package Controller;

import java.io.IOException;

import org.apache.tomcat.jakartaee.commons.io.FileUtils;

import Board.BoardDAO;
import Board.BoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/test/Write.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		String name = req.getParameter("id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String pass = req.getParameter("pass");
		
		System.out.println("name :" + name);
		System.out.println("title :" + title);
		System.out.println("content :" + content);
		System.out.println("pass :" + pass);
		
		req.getRequestDispatcher("/test/Write.jsp").forward(req, resp);
}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
	  throws ServletException, IOException {
		
		BoardDTO dto = new BoardDTO();
		dto.setName(req.getParameter("name"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		
		BoardDAO dao = new BoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		if (result ==1) {
			resp.sendRedirect("../test/list.do");
		}
		else {
			System.out.println("글쓰기에 실패.");
	}
}
}

