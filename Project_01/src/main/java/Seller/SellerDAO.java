package Seller;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import DTO.AjaxDataTrans;
import DTO.InqueryDTO;
import DTO.SellerMainDTO;
import Main.JDBConnect;
import jakarta.servlet.ServletContext;

public class SellerDAO extends JDBConnect
{
	public SellerDAO() {
		super();
	};

	public SellerDAO(ServletContext application) {
		super(application);
	}
	
	public List<AjaxDataTrans> Get_Seller_SellCount(int seller_id)
	{
		String sql = "WITH date_range AS ( "
				+ "    SELECT TRUNC(SYSDATE) - LEVEL + 1 AS ORDER_DATE "
				+ "    FROM DUAL "
				+ "    CONNECT BY LEVEL <= 7 "
				+ ") "
				+ "SELECT  "
				+ "    dr.ORDER_DATE AS DATEINFO, "
				+ "    COALESCE(SUM(CASE WHEN oi.ORDER_STATE = '구매완료' THEN 1 ELSE 0 END), 0) AS ORDERCOUNT, "
				+ "    COALESCE(SUM(CASE WHEN oi.ORDER_STATE IN ('환불신청', '환불완료') THEN 1 ELSE 0 END), 0) AS REFUNDCOUNT "
				+ "FROM  "
				+ "    date_range dr "
				+ "LEFT JOIN  "
				+ "    (SELECT * FROM ORDER_INFO oi JOIN PRODUCT p ON oi.PRODUCT_ID = p.PRODUCT_ID WHERE p.SELLER = " + seller_id +" ) oi "
				+ "ON  "
				+ "    dr.ORDER_DATE = TRUNC(oi.ORDER_DATE) "
				+ "GROUP BY  "
				+ "    dr.ORDER_DATE "
				+ "ORDER BY  "
				+ "    dr.ORDER_DATE";		
		
		List<AjaxDataTrans> list = new Vector<AjaxDataTrans>();
		
		try 
		{
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while (rs.next()) 
			{
				AjaxDataTrans dto = new AjaxDataTrans();
				
				String dateStr = DateConvert(rs.getString("DATEINFO"));
				
				dto.setDateInfo(dateStr);
				dto.setSellCnt(rs.getInt("ORDERCOUNT"));
				dto.setRefundCnt(rs.getInt("REFUNDCOUNT"));				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public String DateConvert(String dateStr)
	{
		String result = "";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try 
		{
			Date date = formatter.parse(dateStr);			
			SimpleDateFormat format = new SimpleDateFormat("MM / dd");
			result = format.format(date);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<SellerMainDTO> Get_SellerOrderList_simple(int seller_id)
	{
		String sql = "SELECT ROWNUM, A.* from "
				+ "(SELECT oi.ORDER_ID, oi.PRODUCT_ID, oi.PRODUCT_CNT, oi.USER_ID, oi.ORDER_STATE, "
				+ "p.CATEGORY_ID, p.NAME, p.EVENT_ID, p.SELLER, oi.ORDER_DATE "
				+ "FROM "
				+ "ORDER_INFO oi "
				+ "JOIN PRODUCT p "
				+ "ON p.PRODUCT_ID = oi.PRODUCT_ID "
				+ "WHERE seller = "+ seller_id + " AND ORDER_STATE = '환불신청' ORDER BY ORDER_DATE ) A WHERE rownum < 8";
		List<SellerMainDTO> list = new Vector<SellerMainDTO>();
		try 
		{
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while (rs.next()) 
			{
				SellerMainDTO dto = new SellerMainDTO();
				dto.setOrder_id(rs.getInt("ORDER_ID"));
				dto.setProduct_id(rs.getInt("PRODUCT_ID"));
				dto.setProduct_cnt(rs.getInt("PRODUCT_CNT"));
				dto.setUser_id(rs.getInt("USER_ID"));
				dto.setOrder_state(rs.getString("ORDER_STATE"));
				dto.setOrder_date(rs.getString("ORDER_DATE"));
				dto.setCategory_id(rs.getInt("CATEGORY_ID"));
				dto.setName(rs.getString("NAME"));
				dto.setEvent_id(rs.getInt("EVENT_ID"));
				dto.setSeller(rs.getInt("SELLER"));
				
				list.add(dto);		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<InqueryDTO> Get_InqueryList(int seller_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT p.SELLER, p.NAME, a.* from ";
		sql += " (SELECT ui.NAME AS user_name  ,i.*  ";
		sql += " FROM INQUERY i JOIN USER_INFO ui ON UI.IDX = i.user_id) a ";
		sql += " JOIN PRODUCT p ON p.PRODUCT_ID = a.PRODUCT_ID ";
		sql += " WHERE seller = " + seller_id +" AND a.seller_content IS NULL";
		
		List<InqueryDTO> list = new ArrayList<InqueryDTO>();
		
		try 
		{
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next())
			{
				InqueryDTO dto = new InqueryDTO();
				
				dto.setInquery_id(rs.getInt("INQUERY_ID"));
				dto.setSeller_id(rs.getInt("SELLER"));
				dto.setProduct_id(rs.getInt("PRODUCT_ID"));
				dto.setProduct_name(rs.getString("NAME"));
				dto.setInquery_title(rs.getString("INQUERY_TITLE"));
				dto.setInquery_date(rs.getDate("INQUERY_DATE"));
				
				list.add(dto);
			}			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	

	public List<SellerMainDTO> Get_SellerOrderList(int seller_id) 
	{
		String sql = "SELECT ROWNUM, A.* from "
				+ "(SELECT oi.ORDER_ID, oi.PRODUCT_ID, oi.PRODUCT_CNT, oi.USER_ID, oi.ORDER_STATE, "
				+ "p.CATEGORY_ID, p.NAME, p.EVENT_ID, p.SELLER, oi.ORDER_DATE "
				+ "FROM "
				+ "ORDER_INFO oi "
				+ "JOIN PRODUCT p "
				+ "ON p.PRODUCT_ID = oi.PRODUCT_ID "
				+ "WHERE seller = "+ seller_id + " AND ORDER_STATE = '환불신청' ORDER BY ORDER_DATE ) A";
		
		List<SellerMainDTO> list = new Vector<SellerMainDTO>();
		try 
		{
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while (rs.next()) 
			{
				SellerMainDTO dto = new SellerMainDTO();
				dto.setOrder_id(rs.getInt("ORDER_ID"));
				dto.setName(rs.getString("NAME"));
				dto.setProduct_cnt(rs.getInt("PRODUCT_CNT"));
				dto.setOrder_date(rs.getString("ORDER_DATE"));
				
				dto.setProduct_id(rs.getInt("PRODUCT_ID"));
				dto.setProduct_cnt(rs.getInt("PRODUCT_CNT"));
				dto.setUser_id(rs.getInt("USER_ID"));
				dto.setOrder_state(rs.getString("ORDER_STATE"));
				dto.setCategory_id(rs.getInt("CATEGORY_ID"));
				dto.setName(rs.getString("NAME"));
				dto.setEvent_id(rs.getInt("EVENT_ID"));
				dto.setSeller(rs.getInt("SELLER"));
				
				list.add(dto);		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	public RefundDTO get_RefundData(int order_id) 
	{
		String sql = "SELECT * FROM REFUND r WHERE ORDER_ID  = " + order_id;
		RefundDTO dto = null;
		try 
		{
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();			
			rs.next();
			
			dto = new RefundDTO();
			dto.setRefund_id(rs.getInt("REFUND_ID"));
			dto.setOrder_id(rs.getInt("ORDER_ID"));
			dto.setRefund_reason(rs.getString("REFUND_REASON"));
			dto.setRefund_date(rs.getDate("REFUND_DATE"));
			dto.setRefund_state(rs.getString("REFUND_STATE"));			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	}

	public AjaxDataTrans UpdateRefundState(RefundDTO data) 
	{
		String sql = "UPDATE REFUND SET REFUND_STATE = '" + data.getRefund_state() +"' WHERE REFUND_ID  = " + data.getRefund_id();
		String sql2 = "UPDATE ORDER_INFO SET ORDER_STATE = '" + data.getRefund_state()+ "'  WHERE ORDER_ID = " + data.getOrder_id();
		int result = 0;
		try 
		{
			psmt = con.prepareStatement(sql);
			result = psmt.executeUpdate();
			
			if( result != 1)
			{
				System.out.println("Err UpdateRefundState");
			}
			
			result = psmt.executeUpdate(sql2);
			
			if( result != 1)
			{
				System.out.println("Err UpdateRefundState");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		AjaxDataTrans dto = new AjaxDataTrans();
		dto.setIntData_00(result);
		
		return dto;
	}

	public InqueryDTO Get_InqueryData(int inquery_id) 
	{
		String sql = "SELECT i.INQUERY_ID, i.PRODUCT_ID, i.INQUERY_TITLE , i.INQUERY_CONTENT, i.INQUERY_DATE, ";
		sql += "ui.name, ui.idx AS USER_ID FROM INQUERY i JOIN USER_INFO ui ON ui.IDX = i.USER_ID ";
		sql += "WHERE i.INQUERY_ID  = " + inquery_id;
		InqueryDTO dto = null;

		try 
		{
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();		
			
			rs.next();
			
			dto = new InqueryDTO();
			dto.setInquery_id(rs.getInt("INQUERY_ID"));
			dto.setInquery_title(rs.getString("INQUERY_TITLE"));
			dto.setInquery_content(rs.getString("INQUERY_CONTENT"));
			dto.setInquery_date(rs.getDate("INQUERY_DATE"));
			dto.setUser_id(rs.getInt("USER_ID"));
			dto.setUser_name(rs.getString("NAME"));			
			
			dto.setProduct_id(rs.getInt("PRODUCT_ID"));
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return dto;
	}

	public AjaxDataTrans Set_SellerContent(int inquery_id, String seller_content) 
	{
		String sql = "UPDATE INQUERY SET SELLER_CONTENT = '" + seller_content;
		sql += "' WHERE INQUERY_ID = " + inquery_id;
		
		int result = 0;
		
		try 
		{
			psmt = con.prepareStatement(sql);
			result  = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		AjaxDataTrans dto = new AjaxDataTrans();
		dto.setIntData_00(result);
		return dto;		
	}

	
}
