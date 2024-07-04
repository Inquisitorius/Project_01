package Board;

import java.sql.DriverManager;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import DTO.InqueryDTO;
import DTO.ProductDTO;
import DTO.SellerMainDTO;
import Info.TestDTO;
import Login.LoginDTO;
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
		 String query = " SELECT * FROM INQUERY i JOIN USER_INFO ui ON ui.IDX = i.USER_ID WHERE PRODUCT_ID =" + product_id;
		 			  
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
			  			dto3.setName(rs.getString("name"));
			  			
			  			Inquery.add(dto3);
			  		}
		  	}
			  	catch(Exception e) {
			  		System.out.println("예외 발생");
			  		e.printStackTrace();
			  	}
			  	return Inquery;
}
	 public List<LoginDTO> UserInfoList() {
		 String query = " SELECT * FROM USER_INFO ";
		 
		 List<LoginDTO> User = new Vector<LoginDTO>();
		 try {
		  		Class.forName("oracle.jdbc.OracleDriver");

				String url = "jdbc:oracle:thin:@14.42.124.35:1521:xe";
				String id = "C##PROJECT_01DB";
				String pwd = "1234";
				con = DriverManager.getConnection(url, id, pwd);
		  		psmt = con.prepareStatement(query);
				rs=psmt.executeQuery();
			if(rs.next()) {
				LoginDTO dtol = new LoginDTO();
				
				dtol.setIdx(rs.getInt("idx"));
				dtol.setId(rs.getString("id"));
				dtol.setPass(rs.getString("pass"));
				dtol.setName(rs.getString("name"));
				dtol.setEmail(rs.getString("email"));
				dtol.setPhone(rs.getString("phone"));
				dtol.setAddress(rs.getString("address"));
				dtol.setAddress_sub(rs.getString("address_sub"));
				dtol.setGender(rs.getString("gender"));
				dtol.setBirthdate(rs.getString("birthdate"));
				dtol.setAuth_type(rs.getInt("auth_type"));
				
				System.out.println(rs.getInt("idx"));
				User.add(dtol);		
			}
	 }
		 catch( Exception e) { 
			 System.out.println("예외 발생");
		  		e.printStackTrace();
		 }
		 return User;
	 }
	 
	 
	public int ModalWrite(String inquery_title, String inquery_content,
			int product_id, int user_id) {
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
						 + "),(SELECT UI.IDX  FROM USER_INFO ui WHERE UI.IDX = ?"
						 + "),?,?,'',SYSDATE )";
			 
			psmt = con.prepareStatement(query);
			
			psmt.setInt(1, product_id); 
			psmt.setInt(2, user_id);
		    psmt.setString(3, inquery_title);
		    psmt.setString(4, inquery_content);	 
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			  e.printStackTrace();
	}	
		  return result;
	}
	
	public int buy(int product_id,int product_cnt, int user_id) {
		int result = 0 ;
		SellerMainDTO dto5 = new SellerMainDTO(); 
		try {
			Class.forName("oracle.jdbc.OracleDriver");

			String url = "jdbc:oracle:thin:@14.42.124.35:1521:xe";
			String id = "C##PROJECT_01DB";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			
			String query = "INSERT INTO order_info"
					+ "(ORDER_ID, PRODUCT_ID, PRODUCT_CNT,USER_ID,ORDER_STATE,ORDER_DATE) values"
					+ "(ORDER_NO.nextval,(SELECT p.PRODUCT_ID FROM PRODUCT p WHERE p.PRODUCT_ID =?"
					+ "),?,(SELECT UI.IDX  FROM USER_INFO ui WHERE UI.IDX =?"
					+ "),'구매완료',sysdate)";
			
			psmt = con.prepareStatement(query);
			
			psmt.setInt(1, product_id);
			psmt.setInt(2, product_cnt);
			psmt.setInt(3, user_id);
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			  e.printStackTrace();
	}	
		  return result;
		
	}
	
	public List<ProductDTO> View2(int product_id) 
	{
		
		String query = "SELECT p.*, ui.IDX AS user_id, ui.NAME AS seller_name FROM PRODUCT p JOIN USER_INFO ui ON p.SELLER = ui.IDX "
				+ " WHERE PRODUCT_ID = " + product_id;
		
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
				dto2.setSeller_name(rs.getString("seller_name"));
				System.out.println(rs.getInt("Seller"));
				System.out.println(rs.getString("seller_name"));
				
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

