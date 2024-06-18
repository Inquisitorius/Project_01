package Controller;

import java.io.IOException;

import Info.TestDAO;
import Info.TestDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/test/ProductInfo.do")
	public class ViewController extends HttpServlet  {
		private static final long serialVersionUID = 1L;

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			/*
			 * TestDAO dao = new TestDAO(); String uri = req.getRequestURI(); TestDTO dto =
			 * dao.View(num);
			 */
		System.out.println("------------");
		}
}