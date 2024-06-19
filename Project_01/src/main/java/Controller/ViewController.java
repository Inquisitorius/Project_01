package Controller;

import java.io.IOException;

import Info.TestDAO;
import Info.TestDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/test/ProductInfo.do")
	public class ViewController extends HttpServlet  {
		private static final long serialVersionUID = 1L;

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) 
		  throws ServletException, IOException {
			TestDAO dao = new TestDAO();
			String num = req.getParameter("1");
			TestDTO dto = dao.View("1");
			dao.close();
		System.out.println("------------");
		}
}