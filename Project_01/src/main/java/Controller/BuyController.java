package Controller;

import java.io.IOException;

import Board.BoardDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/test/Buypage.do")

@MultipartConfig(
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 15
		)

public class BuyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public BuyController() {
		super();
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
			String quantitystr = req.getParameter("quantity");
			HttpSession session = req.getSession();
	        Integer product_id = (Integer) session.getAttribute("currentProductId");
	        Integer user_id = (Integer) session.getAttribute("idx");
	        
			int quantity = -1;
			
		        try {
	        quantity = Integer.parseInt(quantitystr);
	       	session.setAttribute("quantity", quantity);
	       	Integer quantity2 = (Integer) session.getAttribute("quantity");
	       	
	        System.out.println("get product_id :" +session.getAttribute("currentProductId"));
	        System.out.println("get user_id :" +session.getAttribute("idx"));
	        System.out.println("get quantity:" +session.getAttribute("quantity"));
	        

	       	}catch(NumberFormatException e) {
			System.out.println("Invalid product_id format: " + quantitystr);
            return;
		};
	       
	       
	        // 구매 로직 처리
	        // 예: 주문 데이터베이스에 저장, 재고 업데이트 등
	        
	        // 구매 완료 페이지로 이동
	        req.setAttribute("productId", product_id);
	        req.setAttribute("user_id", user_id);
	        req.setAttribute("quantity", quantity);
	        req.getRequestDispatcher("/test/Buypage.jsp").forward(req, resp);
	  
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession(false);
		
		if (session == null || session.getAttribute("idx") == null) {
	        resp.sendRedirect("/MainPage/LoginPage.jsp");
	        return;
	    } else {
	        System.out.println("로그인 정보가 있습니다.");
	    }
	
		Integer product_id = (Integer) session.getAttribute("currentProductId");
		Integer user_id = (Integer) session.getAttribute("idx");
		Integer product_cnt =(Integer) session.getAttribute("quantity");
		
		System.out.println("post product_id: "+session.getAttribute("currentProductId"));
		System.out.println("post user_id: "+session.getAttribute("idx"));
		System.out.println("post product_cnt: "+session.getAttribute("quantity"));
	
		BoardDAO dao = new BoardDAO(); 
		int buyresult = dao.buy(product_id, product_cnt, user_id);
		
		if (buyresult > 0) { 
			resp.sendRedirect("/MainPage/MainPage.jsp");
		} else { 
			resp.sendRedirect("/error.jsp");
		}
}
}