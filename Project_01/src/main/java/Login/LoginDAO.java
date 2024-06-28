package Login;

public class LoginDAO extends DBConnTest {
	public LoginDAO() {
		super();
	}
	
	public LoginDTO Login(String id,String pwd) {
		LoginDTO logindto = null;
		logindto = new LoginDTO();
		try {
			psmt=con.prepareStatement("SELECT * FROM USER_INFO WHERE id=? AND pass=?");
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				logindto.setIdx(rs.getInt("idx"));
				logindto.setId(rs.getString("id"));
				logindto.setPass(rs.getString("pass"));
				logindto.setName(rs.getString("name"));
				logindto.setEmail(rs.getString("email"));
				logindto.setPhone(rs.getString("phone"));
				logindto.setAddress(rs.getString("address"));
				logindto.setAddress_sub(rs.getString("address_sub"));
				logindto.setGender(rs.getString("gender"));
				logindto.setBirthdate(rs.getDate("birthdate"));
				logindto.setAuth_type(rs.getInt("auth_type"));
				
		}
	}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				 rs.close(); 
				 psmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return logindto;
	}
	}