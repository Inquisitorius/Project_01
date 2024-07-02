package Board;

import java.sql.DriverManager;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import DTO.InqueryDTO;
import DTO.ProductDTO;
import Info.TestDTO;
import Main.TestDBPool;
import jakarta.servlet.ServletContext;

public class BoardDAO extends TestDBPool {
	public BoardDAO() {
		super();
	}
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM pboard";
		con = null;
		psmt = null;
		rs = null;
		
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			Class.forName("oracle.jdbc.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "c##green";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			if(rs.next()); {
			totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	 public List<InqueryDTO> Inquerylist(int product_id) {
		 String query = " SELECT * FROM inquery JOIN product ON inquery.product_id "
		 			  + "= product.product_id WHERE product.product_id =" + product_id;
		 System.out.println("GetSaleProductList = " + product_id);
		 
		 List<InqueryDTO> Inquery = new Vector<InqueryDTO>();
			  	try {
			  		Class.forName("oracle.jdbc.OracleDriver");

					String url = "jdbc:oracle:thin:@14.42.124.35:1521:xe";
					String id = "C##PROJECT_01DB";
					String pwd = "1234";
					con = DriverManager.getConnection(url, id, pwd);
			  		psmt = con.prepareStatement(query);
			  		rs=psmt.executeQuery();
			  		
			  		while(rs.next()) {
			  			InqueryDTO dto3 = new InqueryDTO();
			  			
			  			dto3.setInquery_id(rs.getInt("inquery_id"));
			  			dto3.setProduct_id(rs.getInt("product_id"));
			  			dto3.setUser_id(rs.getInt("user_id"));
			  			dto3.setInquery_title(rs.getString("inquery_title"));
			  			dto3.setInquery_content(rs.getString("inquery_content"));
			  			dto3.setSeller_content(rs.getString("seller_content"));
			  			dto3.setInquery_date(rs.getDate("inquery_date"));
					
						/*
						 * dto3.setProduct_name(rs.getString("product_name"));
						 * dto3.setUser_name(rs.getString("user_name"));
						 */
			  			Inquery.add(dto3);
			  			
			  		}
		  	}
			  	catch(Exception e) {
			  		System.out.println("예외 발생");
			  		e.printStackTrace();
			  	}
			  	return Inquery;
}
	public int ModalWrite(String inquery_title, String inquery_content,
			int product_id) {
			int result = 0;
			InqueryDTO dto4 = new InqueryDTO();
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");

			String url = "jdbc:oracle:thin:@14.42.124.35:1521:xe";
			String id = "C##PROJECT_01DB";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			
			String query = "INSERT INTO INQUERY VALUES ( "
						 + "INQUERY_BNO.nextval,(SELECT p.PRODUCT_ID FROM PRODUCT p WHERE p.PRODUCT_ID = ?"
						 + "),(SELECT UI.IDX  FROM USER_INFO ui WHERE UI.IDX = 61"
						 + "),?,?,'',SYSDATE )";
			 
			psmt = con.prepareStatement(query);
			
			psmt.setInt(1, product_id);        
		    psmt.setString(2, inquery_title);
		    psmt.setString(3, inquery_content);	 
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			  e.printStackTrace();
	}	
		  return result;
	}
	
	
	public List<ProductDTO> View2(int product_id) 
	{
		
		String query = "SELECT * FROM PRODUCT WHERE product_id=" + product_id;
		System.out.println("GetSaleProductList = " + product_id);
		
			List<ProductDTO> pro2 = new Vector<ProductDTO>();
			
			try {
				Class.forName("oracle.jdbc.OracleDriver");

				String url = "jdbc:oracle:thin:@14.42.124.35:1521:xe";
				String id = "C##PROJECT_01DB";
				String pwd = "1234";
				con = DriverManager.getConnection(url, id, pwd);
				
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO dto2 = new ProductDTO();
				
				dto2.setProduct_id(rs.getInt("product_id"));
				dto2.setCategory_id(rs.getInt("category_id"));
				dto2.setName(rs.getString("name"));
				dto2.setSub_text(rs.getString("sub_text"));
				
				dto2.setOrigin(rs.getString("origin"));
				dto2.setWeight(rs.getString("weight"));
				dto2.setDateInfo(rs.getString("dateInfo"));
				dto2.setNotifi(rs.getString("notifi"));
				
				dto2.setPrice_ori(rs.getInt("price_ori"));
				dto2.setPrice_percent(rs.getInt("price_percent"));
				dto2.setPrice_discount(rs.getInt("price_discount"));
				dto2.setUnit(rs.getString("unit"));
				
				dto2.setPackaging_type(rs.getString("packaging_type"));
				dto2.setDelivery_type(rs.getString("delivery_type"));
				dto2.setProduct_img(rs.getString("product_img"));
				dto2.setProduct_noti_img(rs.getString("product_noti_img"));
				dto2.setProduct_noti_img2(rs.getString("product_noti_img2"));
				
				dto2.setEvent_id(rs.getInt("event_id"));
				dto2.setSeller(rs.getInt("seller"));
				
				pro2.add(dto2);
			}
		}
		catch(Exception e) {
			System.out.println("예외 발생");
			e.printStackTrace();
		}
		return pro2;
	}
}

