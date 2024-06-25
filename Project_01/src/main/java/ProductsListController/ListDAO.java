package ProductsListController;


import java.sql.DriverManager;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import Category.CategoryDTO;
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
			if (rs.next()) {
				totalcnt = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("카운트 예외발생");
		}

		return totalcnt;
	}

	public int ListCount2() {
		int totalcnt = 0;
		String sql = "SELECT COUNT(*) FROM PRODUCTS2";
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
			if (rs.next()) {
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

	public List<ListDTO> selectListPage2(int start, int end) {
		List<ListDTO> list = new Vector<>();
		String sql = "SELECT * FROM ( SELECT Tb.*, ROWNUM rNum FROM (SELECT TITLE, CONTENT, OPRICE, SALEPER, NPRICE, DELIVERY FROM PRODUCTS2 ORDER BY NUM DESC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";

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

	public List<CategoryDTO> selectcate(){
		List<CategoryDTO> cate = new Vector<CategoryDTO>();
		String sql = "SELECT CATEGORY_NAME FROM (SELECT CATEGORY_NAME, ROWNUM AS RN FROM CATEGORY WHERE CATEGORY_LAYER=0) WHERE RN > 1";
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setCategory_Name(rs.getString(1));
				cate.add(dto);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("카테고리 조회중 예외 발생");
		}
		
		return cate;
	}
	
	public List<CategoryDTO> selectChildcate(String cate){
		List<CategoryDTO> Childcate = new Vector<CategoryDTO>();
		Map<String, String> map = new HashMap<String, String>();
		
	    map.put("alcohol", "주류");
	    map.put("furniture", "가구");
	    map.put("food", "식품");
	    map.put("electronics", "가전제품");
	    map.put("bakery", "베이커리");
	    map.put("living", "리빙가구");
		
		String koreanMap = map.getOrDefault(cate, cate);
		String sql = " SELECT CATEGORY_NAME "
				+ "FROM CATEGORY "
				+ "WHERE category_parent = (SELECT IDX FROM CATEGORY WHERE category_name =?)"
				+ "  AND category_layer = 1";
		try {
			Class.forName("oracle.jdbc.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "green";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			psmt = con.prepareStatement(sql);
			psmt.setString(1, koreanMap);
			rs = psmt.executeQuery();
			while (rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setCategory_Name(rs.getString(1));
				Childcate.add(dto);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("자식카테 조회중 예외발생");
		}
		return Childcate;
	}
	
	public List<ListDTO> ViewChildList(int start, int end, String filters){
		List<ListDTO> list = new Vector<ListDTO>();
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("wine", "와인");
		String koreanMap = map.getOrDefault(filters, filters);
		String sql = "SELECT * FROM ( "
		           + "    SELECT Tb.*, ROWNUM rNum "
		           + "    FROM ( "
		           + "        SELECT P.TITLE, P.CONTENT, P.OPRICE, P.SALEPER, P.NPRICE, P.DELIVERY "
		           + "        FROM PRODUCTS P "
		           + "        JOIN CATEGORY C ON P.CATEGORY_NAME = C.CATEGORY_NAME "
		           + "        WHERE C.CATEGORY_NAME = ?"
		           + "        ORDER BY P.NUM DESC "
		           + "    ) Tb "
		           + "    WHERE ROWNUM <= ? "
		           + ") "
		           + "WHERE rNum >= ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, koreanMap);
			psmt.setInt(2, end);
			psmt.setInt(3, start);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ListDTO dto = new ListDTO();
				
				dto.setTitle(rs.getString(1));
				dto.setContent(rs.getString(2));
				dto.setOprice(rs.getInt(3));
				dto.setSaleper(rs.getInt(4));
				dto.setNprice(rs.getInt(5));
				dto.setDelivery(rs.getString(6));
				
				list.add(dto);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("카테고리 예외");
		}
		return list;
	}

}
