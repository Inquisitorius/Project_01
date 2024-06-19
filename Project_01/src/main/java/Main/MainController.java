package Main;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MainController/*")
public class MainController extends HttpServlet  
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		// /MainController/test.do
		int lastSlash = uri.lastIndexOf('/');		
		String command = uri.substring(lastSlash);	
		
		//------------------------------------//
		
		if(command.equals("/test.do"))
		{
			testDoFunction(req,resp);	
		}
		else if(command.equals("/test.do2"))
		{
			testDoFunction2(req,resp);
		}		
	}
	
	public void testDoFunction(HttpServletRequest req, HttpServletResponse resp)
	{
		req.setAttribute("test", "testString");
		
		//dto = dao.select View();		
	}
	
	public void testDoFunction2(HttpServletRequest req, HttpServletResponse resp)
	{
		System.out.println("testDoFunction2");
	}
}
