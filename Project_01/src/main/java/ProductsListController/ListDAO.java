package ProductsListController;

import java.sql.DriverManager;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import Category.CategoryDTO;
import DTO.ProductDTO;
import Main.TestDBPool;

public class ListDAO extends TestDBPool {
	public ListDAO() {
		super();
	}

	public int ListCount() {
		int totalcnt = 0;
		String sql = "SELECT COUNT(*) FROM PRODUCT";

		try {
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

	public int ChildCount(String[] Arrayfilters) {
		int totalcnt = 0;
		Map<String, String> map = ChildCategoryMap.getKoreanChildMap();
		StringBuilder splitfilter = new StringBuilder();
		
		for (String filter : Arrayfilters) {
			splitfilter.append("'").append(map.getOrDefault(filter, filter)).append("',");
		}

		if (splitfilter.length() > 0) {
			splitfilter.setLength(splitfilter.length() - 1);
		}

		
		String sql = "SELECT COUNT(*) " + "FROM PRODUCT P " + "JOIN CATEGORY C ON P.CATEGORY_ID = C.IDX "
				+ "WHERE C.CATEGORY_NAME IN("+ splitfilter.toString()+")";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				totalcnt = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("자식카테 수량 조회 예외발생");
			e.printStackTrace();
		}
		return totalcnt;
	}

	public int CategoryCount(String category) {
		int totalcnt = 0;
		Map<String, String> map = ChildCategoryMap.getKoreanChildMap();
		map.put("alcohol", "1");
		map.put("furniture", "11");
		map.put("food", "21");
		map.put("electronics", "25");
		map.put("bakery", "41");
		map.put("living", "46");
		String NumMap = map.getOrDefault(category, category);
		String sql = "SELECT COUNT(*) " + "FROM PRODUCT P " + "JOIN CATEGORY C ON P.CATEGORY_ID = C.IDX "
				+ "WHERE C.CATEGORY_PARENT = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, NumMap);
			rs = psmt.executeQuery();
			if (rs.next()) {
				totalcnt = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("카테고리 수량 조회 예외발생");
			e.printStackTrace();
		}
		return totalcnt;
	}

	public List<ProductDTO> selectListPage(int start, int end) {
		List<ProductDTO> list = new Vector<>();
		String sql = "SELECT * FROM ( SELECT Tb.*, ROWNUM rNum FROM (SELECT NAME, SUB_TEXT, PRICE_ORI, PRICE_PERCENT, PRICE_DISCOUNT, DELIVERY_TYPE, PRODUCT_IMG FROM PRODUCT ORDER BY PRODUCT_ID DESC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, end);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ProductDTO dto = new ProductDTO();

				dto.setName(rs.getString(1));
				dto.setSub_text(rs.getString(2));
				dto.setPrice_ori(rs.getInt(3));
				dto.setPrice_percent(rs.getInt(4));
				dto.setPrice_discount(rs.getInt(5));
				dto.setDelivery_type(rs.getString(6));
				dto.setProduct_img(rs.getString(7));

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

	public List<CategoryDTO> selectcate() {
		List<CategoryDTO> cate = new Vector<CategoryDTO>();
		String sql = "SELECT CATEGORY_NAME FROM (SELECT CATEGORY_NAME, ROWNUM AS RN FROM CATEGORY WHERE CATEGORY_LAYER=0) WHERE RN > 1";

		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setCategory_Name(rs.getString(1));
				cate.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("카테고리 조회중 예외 발생");
		}

		return cate;
	}

	public List<CategoryDTO> selectChildcate(String cate) {
		List<CategoryDTO> Childcate = new Vector<CategoryDTO>();
		Map<String, String> map = new HashMap<String, String>();

		map.put("alcohol", "주류");
		map.put("furniture", "가구");
		map.put("food", "식품");
		map.put("electronics", "가전제품");
		map.put("bakery", "베이커리");
		map.put("living", "리빙가구");

		String koreanMap = map.getOrDefault(cate, cate);
		String sql = " SELECT CATEGORY_NAME " + "FROM CATEGORY "
				+ "WHERE category_parent = (SELECT IDX FROM CATEGORY WHERE category_name =?)"
				+ "  AND category_layer = 1";
		try {
			Class.forName("oracle.jdbc.OracleDriver");

			String url = "jdbc:oracle:thin:@14.42.124.35:1521:xe";
			String id = "C##PROJECT_01DB";
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
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("자식카테 조회중 예외발생");
		}
		return Childcate;
	}

	public List<ProductDTO> ViewChildList(int start, int end, String[] Arrayfilters, String[] Arraydeliverys) {
		List<ProductDTO> list = new Vector<ProductDTO>();
		Map<String, String> map = ChildCategoryMap.getKoreanChildMap();
		Map<String, String> deliveryMap = CategoryMap.getKoreandeliveryMap();
		StringBuilder splitfilter = new StringBuilder();
		StringBuilder splitDelivery = new StringBuilder();
		for (String filter : Arrayfilters) {
			splitfilter.append("'").append(map.getOrDefault(filter, filter)).append("',");
		}

		for (String delivery : Arraydeliverys) {
			splitDelivery.append("'").append(deliveryMap.getOrDefault(delivery, delivery)).append("',");
		}

		if (splitfilter.length() > 0) {
			splitfilter.setLength(splitfilter.length() - 1);
		}

		if (splitDelivery.length() > 0) {
			splitDelivery.setLength(splitDelivery.length() - 1);
		}
		
		String sql = "SELECT * FROM ( " + "    SELECT Tb.*, ROWNUM rNum " + "    FROM ( "
				+ "        SELECT P.NAME, P.SUB_TEXT, P.PRICE_ORI, P.PRICE_PERCENT, P.PRICE_DISCOUNT, P.DELIVERY_TYPE, P.PRODUCT_IMG "
				+ "        FROM PRODUCT P " + "        JOIN CATEGORY C ON P.CATEGORY_ID = C.IDX "
				+ "        WHERE C.CATEGORY_NAME IN (" + splitfilter.toString() + ") "
				+ "        ORDER BY P.PRODUCT_ID DESC " + "    ) Tb " + "    WHERE ROWNUM <= ? " + ") "
				+ "WHERE rNum >= ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, end);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();

				dto.setName(rs.getString(1));
				dto.setSub_text(rs.getString(2));
				dto.setPrice_ori(rs.getInt(3));
				dto.setPrice_percent(rs.getInt(4));
				dto.setPrice_discount(rs.getInt(5));
				dto.setDelivery_type(rs.getString(6));
				dto.setProduct_img(rs.getString(7));

				list.add(dto);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("카테고리 예외");
		}

		return list;
	}

	public List<ProductDTO> ViewCategoryProducts(int start, int end, String category) {
		List<ProductDTO> list = new Vector<ProductDTO>();
		Map<String, String> map = ChildCategoryMap.getselectCate();
		String NumMap = map.getOrDefault(category, category);
		String sql = "SELECT * FROM ( " + "    SELECT Tb.*, ROWNUM rNum " + "    FROM ( "
				+ "        SELECT P.NAME, P.SUB_TEXT, P.PRICE_ORI, P.PRICE_PERCENT, P.PRICE_DISCOUNT, P.DELIVERY_TYPE, P.PRODUCT_IMG "
				+ "        FROM PRODUCT P " + "        JOIN CATEGORY C ON P.CATEGORY_ID = C.IDX "
				+ "        WHERE C.CATEGORY_PARENT = ?" + "        ORDER BY P.PRODUCT_ID DESC " + "    ) Tb "
				+ "    WHERE ROWNUM <= ? " + ") " + "WHERE rNum >= ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, NumMap);
			psmt.setInt(2, end);
			psmt.setInt(3, start);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();

				dto.setName(rs.getString(1));
				dto.setSub_text(rs.getString(2));
				dto.setPrice_ori(rs.getInt(3));
				dto.setPrice_percent(rs.getInt(4));
				dto.setPrice_discount(rs.getInt(5));
				dto.setDelivery_type(rs.getString(6));
				dto.setProduct_img(rs.getString(7));

				list.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("카테고리 예외");
		}
		return list;
	}

	public List<ProductDTO> GetdeliveryType(String category, String[] Arrayfilters, String filters) {
	    List<ProductDTO> list = new Vector<ProductDTO>();
	    Map<String, String> map = ChildCategoryMap.getselectCate();
	    String NumMap = map.getOrDefault(category, category);
	    Map<String, String> Koreanmap = ChildCategoryMap.getKoreanChildMap();
	    
	    StringBuilder splitfilter = new StringBuilder();
	    

	    if (Arrayfilters != null && Arrayfilters.length > 0) {
	        for (String filter : Arrayfilters) {
	            if (splitfilter.length() > 0) {
	                splitfilter.append(",");
	            }
	            splitfilter.append("'").append(Koreanmap.getOrDefault(filter, filter)).append("'");
	        }
	    } else {
	       
	        splitfilter.append("''");
	    }

	    
	    
	    String sql = null;

	    if (category.equals("all")) {
	        sql = "SELECT DISTINCT DELIVERY_TYPE FROM PRODUCT P";
	    } 
	    
	    else if (!category.equals("all") && (filters == null || filters.isEmpty())) {
	        sql = "SELECT DISTINCT DELIVERY_TYPE FROM PRODUCT P "
	        	+	" JOIN CATEGORY C ON P.CATEGORY_ID = C.IDX "
	        	+	" WHERE C.CATEGORY_PARENT  = ?";
	    } else  if(Arrayfilters != null && Arrayfilters.length > 0){
	        sql = "SELECT DISTINCT DELIVERY_TYPE FROM PRODUCT P JOIN CATEGORY C ON P.CATEGORY_ID = C.IDX "
	            + "WHERE C.CATEGORY_NAME IN (" + splitfilter.toString() + ")";
	    }

	    try {
	        psmt = con.prepareStatement(sql);

	        if (!"all".equals(category) && (filters == null || filters.isEmpty())) {
	            psmt.setString(1, NumMap);
	        }

	        rs = psmt.executeQuery();

	        while (rs.next()) {
	            ProductDTO dto = new ProductDTO();
	            dto.setDelivery_type(rs.getString(1));
	            list.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("배송타입 조회 중 예외발생");
	    }

	    return list;
	}

}
