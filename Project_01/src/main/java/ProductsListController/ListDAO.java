package ProductsListController;

import java.sql.Driver;
import java.sql.DriverManager;
import java.util.List;
import java.util.Vector;
import Main.TestDBPool;

public class ListDAO extends TestDBPool {
	public ListDAO() {
		super();
	}

	public int ListCount() {
		int totalcnt = 0;
		String sql = "SELECT COUNT(*) FROM PRODUCTS";
		con = null;
		psmt = null;
		rs = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "green";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				totalcnt = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("카운트 예외발생");
		}

		return totalcnt;
	}

	public List<ListDTO> selectListPage(int start, int end) {
		List<ListDTO> list = new Vector<>();
		String sql = "SELECT * FROM ( SELECT Tb.*, ROWNUM rNum FROM (SELECT TITLE, CONTENT, OPRICE, SALEPER, NPRICE, DELIVERY FROM PRODUCTS ORDER BY NUM DESC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, end);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ListDTO dto = new ListDTO();

				dto.setTitle(rs.getString(1));
				dto.setContent(rs.getString(2));
				dto.setOprice(rs.getInt(3));
				dto.setSaleper(rs.getInt(4));
				dto.setNprice(rs.getInt(5));
				dto.setDelivery(rs.getString(6));

				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 조회 중 예외발생");
		} finally {
			close();
		}
		return list;
	}
}
