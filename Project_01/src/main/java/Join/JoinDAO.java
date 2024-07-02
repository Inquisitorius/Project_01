package Join;

import Login.DBConnTest;
import Login.LoginDTO;

public class JoinDAO extends DBConnTest {
	public JoinDAO() {
		super();
	}

	public boolean checkRepetition(String id) {
		boolean check = false;
		try {
			psmt = con.prepareStatement("SELECT * FROM USER_INFO WHERE id = ?");
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next())
				check = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	public int createAccount(LoginDTO dto) {
		int result = 0;
		try {
			psmt = con.prepareStatement("INSERT INTO USER_INFO Values (USER_BNO.NEXTVAL,?,?,?,?,?,?,?,?,?,0)");
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getPhone());
			psmt.setString(6, dto.getAddress());
			psmt.setString(7, dto.getAddress_sub());
			psmt.setString(8, dto.getGender());
			psmt.setString(9, dto.getBirthdate());

			rs = psmt.executeQuery();
			result = 1;
			System.out.println("DB 데이터 입력 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				psmt.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
