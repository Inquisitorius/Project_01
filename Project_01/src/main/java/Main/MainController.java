package Main;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;

import Category.CategoryDTO;
import DTO.AjaxDataTrans;
import DTO.ProductDTO;
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
		else if(command.equals("/getSaleProductList"))
		{
			GetSaleProductList(req,resp);
		}		
		else if(command.equals("/getTimeLimitSale"))
		{
			GetTimeLimitSale(req,resp);
		}
	}
	
	private void GetTimeLimitSale(HttpServletRequest req, HttpServletResponse resp) 
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		try 
		{
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			AjaxDataTrans data = gson_in.fromJson(reader, AjaxDataTrans.class);
			
			MainDAO dao = new MainDAO();
			ProductDTO dto = dao.GetTimeLimitSale(data.getProduct_id());
			
			 Gson gson = new Gson();
			 String jsonResponse = gson.toJson(dto);
			 resp.getWriter().write(jsonResponse);
			 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
	}

	public void testDoFunction(HttpServletRequest req, HttpServletResponse resp)
	{	
		try 
		{
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			//TestDTO data = gson_in.fromJson(reader, TestDTO.class);			
			
			MainDAO dao = new MainDAO();
			
			List<CategoryDTO> list = dao.selectList();
			
		    Gson gson = new Gson();
		    String jsonResponse = gson.toJson(list);
		    System.out.print("jsonResponse : " + jsonResponse);
		    resp.getWriter().write(jsonResponse);
		    
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}        
	}
	
	public void GetSaleProductList(HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		try 
		{
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			AjaxDataTrans data = gson_in.fromJson(reader, AjaxDataTrans.class);
			
			MainDAO dao = new MainDAO();
			List<ProductDTO> list = dao.GetSaleProductList(data.getEvent_id());
			
			 Gson gson = new Gson();
			 String jsonResponse = gson.toJson(list);
			 resp.getWriter().write(jsonResponse);
			 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
}
