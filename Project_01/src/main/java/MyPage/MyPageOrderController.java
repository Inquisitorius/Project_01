package MyPage;

import java.io.BufferedReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.google.gson.Gson;

import DTO.AjaxDataTrans;
import DTO.ProductDTO;
import Main.MainDAO;
import Seller.RefundDTO;
import Seller.SellerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MyPageOrderController/*")
public class MyPageOrderController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf('/');		
		String command = uri.substring(lastSlash);	
		
		System.out.println("MyPageOrderController in : " + command);
		
		if(command.equals("/UpdateRefund"))
		{
			OrderProgress(req,resp, false);	
		}
		else if(command.equals("/CreateRefund"))
		{
			OrderProgress_create(req,resp, false);
		}
	}
	
	private void OrderProgress_create(HttpServletRequest req, HttpServletResponse resp , Boolean type)
	{//result = dao.Create_Refund(data);
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		System.out.println("OrderProgress_create in");
		
		try 
		{
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			RefundDTO data = gson_in.fromJson(reader, RefundDTO.class);
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	        String str = formatter.format(new Date());
	        
			Date date_save = formatter.parse(str);
			data.setRefund_date(date_save);
			
			SellerDAO dao =  new SellerDAO();
			int result = 0;
			
			if(type == false)
			{//update for refund and order
				result = dao.Create_Refund(data);
			}			
			
			AjaxDataTrans transData = new AjaxDataTrans();
			transData.setIntData_00(result);
			
			 Gson gson = new Gson();
			 String jsonResponse = gson.toJson(transData);
			 resp.getWriter().write(jsonResponse);
			 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private void OrderProgress(HttpServletRequest req, HttpServletResponse resp , Boolean type)
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		System.out.println("OrderProgress in");
		
		try 
		{
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			RefundDTO data = gson_in.fromJson(reader, RefundDTO.class);
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			Date date_save = formatter.parse(data.refund_date_format);
			data.setRefund_date(date_save);
			
			
			SellerDAO dao =  new SellerDAO();
			int result = 0;
			
			if(type == false)
			{//update for refund and order
				result = dao.Update_Refund(data);
			}			
			
			AjaxDataTrans transData = new AjaxDataTrans();
			transData.setIntData_00(result);
			
			 Gson gson = new Gson();
			 String jsonResponse = gson.toJson(transData);
			 resp.getWriter().write(jsonResponse);
			 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
