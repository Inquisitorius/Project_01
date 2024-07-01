package Join;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import Login.LoginDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Join/*")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{	
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf('/');		
		String command = uri.substring(lastSlash);	
		  String uri2 = req.getHeader("Referer");
		  if (uri2 != null && !uri2.contains("/Join")) {
		        req.getSession().setAttribute("prevPage", uri2);
		    }
		if(command.equals("/JoinTry"))
		{
			JoinTry(req,resp);
		}
		if(command.equals("/JoinCheck"))
		{
			checkRepetition(req,resp);
		}
	}
	
	private void checkRepetition(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		try {
			String id = req.getParameter("id");
			JoinDAO dao = new JoinDAO();
	        boolean isDuplicate = dao.checkRepetition(id);
	        resp.setContentType("application/json");
	        PrintWriter out = resp.getWriter();
	        out.print("{\"isDuplicate\": " + isDuplicate + "}");
	        out.flush();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public void JoinTry(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		try {	
				JoinDAO dao = new JoinDAO();
				LoginDTO dto = new LoginDTO();
				String year = req.getParameter("year");
				String month = req.getParameter("month");
				String day = req.getParameter("day");
				String date = null;
				if (year != null && month != null && day != null) {
				    date = year + month + day;
				}
				Date memberBirthDate;
				if(date == null || date.equals("")) {
					memberBirthDate= null;
				}else {
				LocalDate localDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyyMMdd"));	
				memberBirthDate = Date.valueOf(localDate);	
				}
				System.out.println("id = " + req.getParameter("id"));
				dto.setId(req.getParameter("id"));
				dto.setPass(req.getParameter("pass"));
				dto.setName(req.getParameter("name"));
				dto.setEmail(req.getParameter("email"));
				dto.setPhone(req.getParameter("phone"));
				dto.setAddress(req.getParameter("address"));
				dto.setAddress_sub(req.getParameter("address_sub"));
				dto.setGender(req.getParameter("gender"));
				dto.setBirthdate(memberBirthDate);
				
				int result = dao.createAccount(dto);
				if(result == 1) 
				{
				out.write("{\"status\": \"success\"}");
				}
		}catch(Exception e) {
			e.printStackTrace();
			out.write("{\"status\": \"error\"}");
		}finally {
			out.close();
		}
	}
}
