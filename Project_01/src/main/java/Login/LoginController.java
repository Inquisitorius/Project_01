package Login;

import java.io.BufferedReader;
import java.io.IOException;
import com.google.gson.Gson;
import DTO.AjaxDataTrans;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login/*")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf('/');		
		String command = uri.substring(lastSlash);	
		String uri2 = req.getHeader("Referer");
		
		if (uri2 != null && !uri2.contains("/login")) 
		{
		    req.getSession().setAttribute("prevPage", uri2);
		}
		if(command.equals("/loginTry"))
		{
			LoginTry(req, resp);
		}
		if(command.equals("/logoutTry")) {
			LogoutTry(req,resp);
		}
		if(command.equals("/isLogined")) {
			IsLogined(req,resp);
		}
	}
	
	private boolean IsLogined(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean Islogined = false;
		try {
			
		}catch(Exception e) {
			HttpSession session = req.getSession();
			if(session != null && session.getAttribute("id") != null) {
				Islogined = true;
			}
		}
		return Islogined;
	}
	
	
	private void LogoutTry(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session= req.getSession();
		session.invalidate();
		resp.sendRedirect("/MainPage/MainPage.jsp");
	}

	public void LoginTry(HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		try 
		{
			//받은 데이터 클래스로 변환 과정
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			LoginDTO data = gson_in.fromJson(reader, LoginDTO.class);
			
			LoginDAO logindao = new LoginDAO();
			LoginDTO User = logindao.Login(data.getId(),data.getPass());
			
			AjaxDataTrans trans = new AjaxDataTrans();
			
			if(User.getId() == null)
			{//실패
				//실패를 돌려보내준다.
				trans.stringData_00 = "false";
			}
			else
			{//성공
				//처리를 한다. (session data set)
				SetSessionUserInfo(req,User);
				//성공을 돌려보내 준다.
				trans.stringData_00 = "true";			
			}
			
			
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(trans);
			resp.getWriter().write(jsonResponse);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void SetSessionUserInfo(HttpServletRequest req, LoginDTO logindto)
	{
		HttpSession session = req.getSession();
		
		
		session.setAttribute("idx", logindto.getIdx());
		session.setAttribute("id", logindto.getId());
		session.setAttribute("pass", logindto.getPass());
		session.setAttribute("name", logindto.getName());
		session.setAttribute("email", logindto.getEmail());
		session.setAttribute("phone", logindto.getPhone());
		session.setAttribute("address", logindto.getAddress());
		session.setAttribute("address_sub", logindto.getAddress_sub());
		session.setAttribute("gender", logindto.getGender());
		session.setAttribute("birthdate", logindto.getBirthdate());
		session.setAttribute("auth_type", logindto.getAuth_type());
	}
	
}