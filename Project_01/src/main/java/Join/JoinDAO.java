package Join;

import Login.DBConnTest;

public class JoinDAO extends DBConnTest {
	public JoinDAO() {
		super();
	}
	
	public int createAccount(JoinDTO joindto) {
		try {
			psmt=con.prepareStatement("INSERT INTO USER_INFO
	
			rs=psmt.executeQuery();
			
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
}
