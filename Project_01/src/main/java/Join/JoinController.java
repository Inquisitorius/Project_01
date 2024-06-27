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
import jakarta.servlet.http.HttpSession;

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

	public void JoinTry(HttpServletRequest req, HttpServletResponse resp) {
		
		try {
				JoinDAO dao = new JoinDAO();
				LoginDTO dto = new LoginDTO();
				String date = req.getParameter("memberBirthYear")
						+req.getParameter("memberBirthMonth")
						+req.getParameter("memberBirthDay");
				LocalDate localDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyyMMdd"));	
				Date memberBirthDate = Date.valueOf(localDate);
				dto.setId(req.getParameter("memberId"));
				dto.setPass(req.getParameter("memberPwd"));
				dto.setName(req.getParameter("memberName"));
				dto.setEmail(req.getParameter("memberEmail"));
				dto.setPhone(req.getParameter("memberPhone"));
				dto.setAddress(req.getParameter("memberAddr"));
				dto.setAddress_sub(req.getParameter("memberAddrsub"));
				dto.setGender(req.getParameter("memberGender"));
				dto.setBirthdate(memberBirthDate);
				
				dao.createAccount(dto);
				
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
