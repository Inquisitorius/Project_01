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
				logindto.setBirthdate(rs.getString("birthdate"));
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
	public String PwdSearch(String id,String second) {
		String pwd = null;
		String type = null;
		 if (second.contains("@")) {
			 type = "email";
		 }else {
			 type = "phone";
		 }
		try {
			psmt=con.prepareStatement("SELECT PASS FROM USER_INFO WHERE ID = '"+ id +"' AND "+ type +" = ?");
			psmt.setString(1, second);
			rs = psmt.executeQuery();	
			if(rs.next()) {
				pwd=rs.getString("pass");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pwd;
	}
	
	
	
	public String IdSearch(String first, String second) {
			String id =null;
			String type = null;
			 if (second.contains("@")) {
				 type = "email";
			 }else {
				 type = "phone";
			 }
			try {
				psmt=con.prepareStatement("SELECT id FROM USER_INFO WHERE NAME= ? AND "+ type +" = ?");
				psmt.setString(1, first);
				psmt.setString(2, second);
				rs=psmt.executeQuery();
				if(rs.next()) {
					id=rs.getString("id");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return id;
		}
	}