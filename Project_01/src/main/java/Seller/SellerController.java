package Seller;

import java.io.BufferedReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import DTO.AjaxDataTrans;
import DTO.InqueryDTO;
import DTO.SellerMainDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SellerController/*")
public class SellerController extends HttpServlet  
{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uri = req.getRequestURI();
		
		int lastSlash = uri.lastIndexOf('/');		
		String command = uri.substring(lastSlash);
		
		if(command.equals("/main.func"))
		{
			SellerOrderList_simple(req,resp);	
		}
		else if(command.equals("/mainCnt.func"))
		{
			SellerMainCntFunction(req, resp);
		}
		else if(command.equals("/sellerRefundList.func"))
		{
			SellerOrderList(req, resp);
		}
		else if(command.equals("/orderListTableData.func"))
		{
			orderListTableData(req, resp);
		}
		else if(command.equals("/ListDetail_move.func"))
		{
			ListDetail_move(req, resp);
		}
		else if(command.equals("/RefundDetail.func"))
		{
			RefundDetail(req,resp);
		}
		else if(command.equals("/RefundUpdate.func"))
		{
			RefundUpdate(req,resp);
		}
		else if(command.equals("/InqueryList.func"))
		{
			Get_InqueryList(req,resp);
		}
		else if(command.equals("/Get_InqueryData"))
		{
			Get_InqueryData(req,resp);
		}
		else if(command.equals("/Set_SellerContent"))
		{
			Set_SellerContent(req,resp);
		}
		else if(command.equals("/Get_SellerChartData"))
		{
			this.Get_SellerChartData(req,resp);
		}
		else if(command.equals("/Get_OrderList.func"))
		{	
			this.Get_OrderList(req, resp);			
		}
		else if(command.equals("/Get_OrderDetail.func"))
		{
			this.Get_OrderDetail(req, resp);
		}
	}
	
	public void Get_OrderDetail(HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");	
		
		try 
		{
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			AjaxDataTrans data = gson_in.fromJson(reader, AjaxDataTrans.class);			
			int order_id = data.getIntData_00();
			
			//RefundDTO
			//여기에 dao 코드
			SellerDAO dao = new SellerDAO();
			
			RefundDTO dto = dao.get_RefundData(order_id);			
				
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(dto);
			resp.getWriter().write(jsonResponse);
			
			
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return;
	}
	public void Get_OrderList(HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");	
		
		try 
		{
			String user = req.getParameter("user_id");
			int user_id = Integer.parseInt(user);
			
			//여기에 dao 코드
			SellerDAO dao = new SellerDAO();
			
			List<SellerMainDTO> list = dao.Get_OrderList(user_id);
				
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(list);
			resp.getWriter().write(jsonResponse);
			
			
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void Get_SellerChartData(HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");	
		
		try 
		{
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			AjaxDataTrans data = gson_in.fromJson(reader, AjaxDataTrans.class);
						
			SellerDAO dao = new SellerDAO();
			List<AjaxDataTrans> list = dao.Get_Seller_SellCount_Detail(data.getSeller_id(),data.getIntData_00());
			
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(list);
			resp.getWriter().write(jsonResponse);
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void Set_SellerContent(HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");		
		
		try 
		{
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			InqueryDTO data = gson_in.fromJson(reader, InqueryDTO.class);
						
			SellerDAO dao = new SellerDAO();			
			
			AjaxDataTrans result = dao.Set_SellerContent(data.getInquery_id(),data.getSeller_content());
			
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(result);
			resp.getWriter().write(jsonResponse);
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void Get_InqueryData(HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");		

		try 
		{
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			InqueryDTO data = gson_in.fromJson(reader, InqueryDTO.class);
						
			SellerDAO dao = new SellerDAO();			
			
			InqueryDTO result = dao.Get_InqueryData(data.getInquery_id());
			
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(result);
			resp.getWriter().write(jsonResponse);
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void Get_InqueryList(HttpServletRequest req, HttpServletResponse resp)
	{
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");	
		
		try 
		{
			String seller = req.getParameter("seller");
			int seller_id = Integer.parseInt(seller);
			
			//여기에 dao 코드
			SellerDAO dao = new SellerDAO();
			List<InqueryDTO> list = dao.Get_InqueryList(seller_id);
				
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(list);
			resp.getWriter().write(jsonResponse);
			
			
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	public void RefundUpdate(HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");			
		
		try {
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();			
			
			RefundDTO data = gson_in.fromJson(reader, RefundDTO.class);
			
			data.getRefund_id();
			
			SellerDAO dao = new SellerDAO();
			AjaxDataTrans dto = dao.UpdateRefundState(data);			
			
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(dto);
			resp.getWriter().write(jsonResponse);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
					
		
	}
	
	public void RefundDetail(HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");	
		
		try 
		{
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			AjaxDataTrans data = gson_in.fromJson(reader, AjaxDataTrans.class);
						
			SellerDAO dao = new SellerDAO();			
			RefundDTO dto = dao.get_RefundData(data.getSeller_id());			
			
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(dto);
			resp.getWriter().write(jsonResponse);
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void orderListTableData(HttpServletRequest req, HttpServletResponse resp) throws IOException
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");	
		
		try 
		{
			BufferedReader reader = req.getReader();
			
			String seller = req.getParameter("seller");
			int seller_id = Integer.parseInt(seller);
			
			//여기에 dao 코드
			SellerDAO dao = new SellerDAO();
			List<SellerMainDTO> list = dao.Get_SellerOrderList(seller_id);
				
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(list);
			resp.getWriter().write(jsonResponse);
			
			
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void ListDetail_move(HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");	
		
		try 
		{
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			SellerMainDTO data = gson_in.fromJson(reader, SellerMainDTO.class);
				
			req.setAttribute("order_id", data.getOrder_id());
			req.setAttribute("name", data.getName());
			
			
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public void SellerMainCntFunction(HttpServletRequest req, HttpServletResponse resp)
	{
		// 몇월/몇칠 : 2,3 이런식으로 
		// date = ?월/?일, refund = ? , sell = ? 식의 데이터
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");	
		
		try 
		{
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			AjaxDataTrans data = gson_in.fromJson(reader, AjaxDataTrans.class);
						
			SellerDAO dao = new SellerDAO();
			List<AjaxDataTrans> list = dao.Get_Seller_SellCount(data.getSeller_id());
			
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(list);
			resp.getWriter().write(jsonResponse);
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void SellerOrderList_simple(HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");		
		
		try 
		{
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			AjaxDataTrans data = gson_in.fromJson(reader, AjaxDataTrans.class);
						
			SellerDAO dao = new SellerDAO();
			List<SellerMainDTO> list = dao.Get_SellerOrderList_simple(data.getSeller_id());
			
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(list);
			resp.getWriter().write(jsonResponse);
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	public void SellerOrderList(HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");		
		
		try 
		{
			BufferedReader reader = req.getReader();
			Gson gson_in = new Gson();
			AjaxDataTrans data = gson_in.fromJson(reader, AjaxDataTrans.class);
						
			SellerDAO dao = new SellerDAO();
			List<SellerMainDTO> list = dao.Get_SellerOrderList(data.getSeller_id());
			
			Gson gson = new Gson();
			String jsonResponse = gson.toJson(list);
			resp.getWriter().write(jsonResponse);
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
