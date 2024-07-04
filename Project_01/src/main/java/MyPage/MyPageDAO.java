package MyPage;

import Login.DBConnTest;

public class MyPageDAO extends DBConnTest {
	public MyPageDAO() {
		super();
	}

	public int updateData(String column, String changeData, String id) {
		int result = 0;
		try {
			String query = "UPDATE USER_INFO SET " + column + " = '" + changeData + "' WHERE id = '" + id + "'";
			psmt = con.prepareStatement(query);
			System.out.println("Generated Query: " + query); // 쿼리 출력 (디버깅 용도)
			result = psmt.executeUpdate();
//			System.out.println("Update Result: " + result);
			System.out.println("DB 데이터 수정 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				psmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public int DeleteData(String id) {
		int result = 0;
		try {
			String query = "DELETE FROM USER_INFO WHERE id = '" + id +"'";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				psmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public void uploadQuestion(String category, String title, String contents) {
		try {
			String query = "INSERT INTO Que_Board Values(Que_bno.NEXTVAL,?,?,?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, category);
			psmt.setString(2, title);
			psmt.setString(3, contents);
			rs = psmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				psmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}