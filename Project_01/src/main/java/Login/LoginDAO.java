package Login;

import java.sql.PreparedStatement;

public class LoginDAO extends DBConnTest {
	public LoginDAO() {
		super();
	}
	
	public LoginDTO Login(String id,String pwd) {
		LoginDTO logindto = null;
		PreparedStatement pstmt=null;
		rs = null;
		logindto = new LoginDTO();
		try {
			pstmt=con.prepareStatement("SELECT * FROM USER_INFO WHERE id=? AND pass=?");
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				logindto.setId(rs.getString("id"));
				logindto.setPass(rs.getString("pass"));
				logindto.setName(rs.getString("name"));
				logindto.setEmail(rs.getString("email"));
				logindto.setAddress(rs.getString("address"));
				logindto.setAddress_sub(rs.getString("address_sub"));
				logindto.setGender(rs.getString("gender"));
		}
	}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				 rs.close(); 
				 pstmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return logindto;
	}
	}