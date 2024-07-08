package MyPage;

import java.util.List;
import java.util.Vector;
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
			String query = "DELETE FROM USER_INFO WHERE id = '" + id + "'";
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

	public List<QuestionDTO> showAllQuestion() {
		List<QuestionDTO> qlist = new Vector<QuestionDTO>();
		try {
			String query = "SELECT * FROM Que_Board ORDER BY qdx DESC";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				dto.setQdx(rs.getInt(1));
				dto.setQue_category(rs.getString(2));
				dto.setQue_title(rs.getString(3));
				dto.setQue_contents(rs.getString(4));
				qlist.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				psmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return qlist;
	}

	public int lastQdx() {
		int result = 0;
		try {
			String query = "SELECT MAX(qdx) FROM Que_Board";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (

		Exception e) {
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
	
	public int countQuestion() {
		int result = 0;
		try {
			String query = "SELECT count(*) FROM Que_Board";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (

		Exception e) {
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

	public int uploadQuestion(QuestionDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO Que_Board Values(que_seq.NEXTVAL,?,?,?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getQue_category());
			psmt.setString(2, dto.getQue_title());
			psmt.setString(3, dto.getQue_contents());
			rs = psmt.executeQuery();
			System.out.println("질문 등록 DAO");
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
}