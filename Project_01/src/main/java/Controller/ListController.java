package Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Board.BoardDAO;
import Board.BoardDTO;
import Board.BoardPage;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/test/List.do")
public class ListController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public ListController() {
		super();
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws
	  ServletException, IOException {
			BoardDAO dao = new BoardDAO();
		 	//Map<String, Object> map = new HashMap<String, Object>();
		// 	int totalCount = dao.selectCount(map);
			String num = req.getParameter("num");
		 	List<BoardDTO> boardLists = dao.selectListPage();
		 	dao.close();
			req.setAttribute("boardLists", boardLists);
			req.getRequestDispatcher("/test/List.jsp").forward(req, resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		BoardDTO dto = new BoardDTO();
		dto.setName(req.getParameter("name"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		
		BoardDAO dao = new BoardDAO();
		int result = dao.ModalWrite(dto);
		dao.close();
		if (result == 1) {
			resp.sendRedirect("/test/List.do");
		}
		else {
			System.out.println("글쓰기에 실패.");
	}
	}	
	
}
/*
 * protected void service(HttpServletRequest req, HttpServletResponse resp)
 * throws ServletException, IOException {
 * 
 * BoardDAO dao = new BoardDAO();
 * 
 * Map<String, Object> map = new HashMap<String, Object>(); int totalCount =
 * dao.selectCount(map);
 * 
 * ServletContext application = getServletContext();
 * 
 * int pageSize
 * =Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE")); int
 * blockPage = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
 * 
 * 
 * // int pageSize =Integer.parseInt(req.getParameter("POSTS_PER_PAGE")); // int
 * blockPage = Integer.parseInt(req.getParameter("POSTS_PER_PAGE"));
 * 
 * int pageNum = 1; String pageTemp = req.getParameter("pageNum");
 * 
 * System.out.println("::: PageTemp :::: " + pageTemp); if (pageTemp != null &&
 * !pageTemp.equals("")) pageNum = Integer.parseInt(pageTemp);
 * 
 * int start = (pageNum - 1) * pageSize + 1; int end = pageNum * pageSize;
 * map.put("start", start); map.put("end", end);
 * 
 * List<BoardDTO> boardLists = dao.selectListPage();
 * 
 * dao.close();
 * 
 * String pagingImg = BoardPage.pagingStr(totalCount,pageSize, blockPage,
 * pageNum, "../test/list.do"); map.put("totalCount", totalCount);
 * map.put("pagingImg", pagingImg); map.put("pageSize",pageSize);
 * map.put("pageNum", pageNum);
 * 
 * req.setAttribute("boardLists", boardLists); req.setAttribute("map", map);
 * req.getRequestDispatcher("/test/List.jsp").forward(req, resp); } }
 */