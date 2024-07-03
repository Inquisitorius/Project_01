package ProductsListController;


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

	public int ListCount(String delivery, String[] Arraydeliverys, String price, String[] Arrayprice) {
		int totalcnt = 0;
		
		Map<String, String> deliveryMap = CategoryMap.getKoreandeliveryMap();
		StringBuilder splitDelivery = new StringBuilder();
		for (String deliverystr : Arraydeliverys) {
			splitDelivery.append("'").append(deliveryMap.getOrDefault(deliverystr, deliverystr)).append("',");
		}

		if (splitDelivery.length() > 0) {
			splitDelivery.setLength(splitDelivery.length() - 1);
		}
		StringBuilder splitPrice = new StringBuilder();
		for(String pricestr : Arrayprice) {
			splitPrice.append("'").append(pricestr).append("',");
		}
		if(splitPrice.length() > 0) {
			splitPrice.setLength(splitPrice.length() - 1);
		}
		
		String[] prices = splitPrice.toString().split(",");
		boolean hasCondition = false;
		String sql = "SELECT COUNT(*) FROM PRODUCT";
		if(delivery != null && !delivery.isEmpty()) {
			sql += " WHERE DELIVERY_TYPE IN ("+splitDelivery.toString()+")";
			hasCondition = true;
		}if (price != null && !price.isEmpty()) {
			if (prices.length == 1) {
		        if (hasCondition) {
		            sql += " AND";
		        } else {
		            sql += " WHERE";
		            hasCondition = true;
		        }
		        if ("35000".equals(price)) {
		            sql += " PRICE_DISCOUNT >= " + prices[0];
		        } else {
		            sql += " PRICE_DISCOUNT < " + prices[0];
		        }
		    } else if (prices.length == 2) {
		        if (hasCondition) {
		            sql += " AND";
		        } else {
		            sql += " WHERE";
		        }
		        sql += " PRICE_DISCOUNT >= " + prices[0] + " AND PRICE_DISCOUNT < " + prices[1];
		    }
		}

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

	public int ChildCount(String category, String[] Arrayfilters, String filters, String delivery, String[] Arraydeliverys, String price, String[] Arrayprice) {
		int totalcnt = 0;
		Map<String, String> map = ChildCategoryMap.getKoreanChildMap();
		StringBuilder splitfilter = new StringBuilder();
		Map<String, String> deliveryMap = CategoryMap.getKoreandeliveryMap();
		StringBuilder splitDelivery = new StringBuilder();
		for (String deliverystr : Arraydeliverys) {
			splitDelivery.append("'").append(deliveryMap.getOrDefault(deliverystr, deliverystr)).append("',");
		}

		if (splitDelivery.length() > 0) {
			splitDelivery.setLength(splitDelivery.length() - 1);
		}
		
		for (String filter : Arrayfilters) {
			splitfilter.append("'").append(map.getOrDefault(filter, filter)).append("',");
		}

		if (splitfilter.length() > 0) {
			splitfilter.setLength(splitfilter.length() - 1);
		}
		StringBuilder splitPrice = new StringBuilder();
		for(String pricestr : Arrayprice) {
			splitPrice.append("'").append(pricestr).append("',");
		}
		if(splitPrice.length() > 0) {
			splitPrice.setLength(splitPrice.length() - 1);
		}
		String[] prices = splitPrice.toString().split(",");
		Map<String, String> cate = ChildCategoryMap.getselectCate();
		String NumCate = cate.getOrDefault(category, category);
		String sql = "SELECT COUNT(*) " + "FROM PRODUCT P " + "JOIN CATEGORY C ON P.CATEGORY_ID = C.IDX ";
		boolean hasCondition = false;
				
				if (filters != null && !filters.isEmpty()) {
				    sql += " WHERE C.CATEGORY_NAME IN (" + splitfilter.toString() + ") ";
				    hasCondition = true; // 첫 번째 조건이 추가되었음을 표시
				}

				if (delivery != null && !delivery.isEmpty()) {
				    if (hasCondition) {
				        sql += " AND";
				    } else {
				        sql += " WHERE C.CATEGORY_PARENT = " + NumCate + " AND ";
				        hasCondition = true; // 첫 번째 조건이 추가되었음을 표시
				    }
				    sql += " P.DELIVERY_TYPE IN (" + splitDelivery.toString() + ")";
				}

				if (price != null && !price.isEmpty()) {
				    if (hasCondition) {
				        sql += " AND";
				    } else {
				        sql += " WHERE C.CATEGORY_PARENT = " + NumCate + " AND ";
				    }

				    if (prices.length == 1) {
				        if ("35000".equals(price)) {
				            sql += " PRICE_DISCOUNT >= " + prices[0];
				        } else {
				            sql += " PRICE_DISCOUNT < " + prices[0];
				        }
				    } else if (prices.length == 2) {
				        sql += " PRICE_DISCOUNT >= " + prices[0] + " AND PRICE_DISCOUNT < " + prices[1];
				    }
				}

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
		Map<String, String> map = ChildCategoryMap.getselectCate();
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

	public List<ProductDTO> selectListPage(int start, int end, String category, String delivery, String[] Arraydeliverys, String price, String[] Arrayprice, String type) {
		List<ProductDTO> list = new Vector<>();
		
		Map<String, String> deliveryMap = CategoryMap.getKoreandeliveryMap();
		StringBuilder splitDelivery = new StringBuilder();
		for (String deliverystr : Arraydeliverys) {
			splitDelivery.append("'").append(deliveryMap.getOrDefault(deliverystr, deliverystr)).append("',");
		}

		if (splitDelivery.length() > 0) {
			splitDelivery.setLength(splitDelivery.length() - 1);
		}
		StringBuilder splitPrice = new StringBuilder();
		for(String pricestr : Arrayprice) {
			splitPrice.append("'").append(pricestr).append("',");
		}
		if(splitPrice.length() > 0) {
			splitPrice.setLength(splitPrice.length() - 1);
		}
		
		String[] prices = splitPrice.toString().split(",");
		System.out.println(prices[0]);
		String sql = "SELECT * FROM ( SELECT Tb.*, ROWNUM rNum FROM (SELECT NAME, SUB_TEXT, PRICE_ORI, PRICE_PERCENT, PRICE_DISCOUNT, DELIVERY_TYPE, PRODUCT_IMG FROM PRODUCT ";
		boolean hasCondition = false;
		
		if (delivery != null && !delivery.isEmpty()) {
		    sql += " WHERE DELIVERY_TYPE IN (" + splitDelivery.toString() + ")";
		    hasCondition = true;
		}
		
		if (price != null && !price.isEmpty()) {
			if (prices.length == 1) {
		        if (hasCondition) {
		            sql += " AND";
		        } else {
		            sql += " WHERE";
		            hasCondition = true;
		        }
		        if ("35000".equals(price)) {
		            sql += " PRICE_DISCOUNT >= " + prices[0];
		        } else {
		            sql += " PRICE_DISCOUNT < " + prices[0];
		        }
		    } else if (prices.length == 2) {
		        if (hasCondition) {
		            sql += " AND";
		        } else {
		            sql += " WHERE";
		        }
		        sql += " PRICE_DISCOUNT >= " + prices[0] + " AND PRICE_DISCOUNT < " + prices[1];
		    }
		}
		if(type == null || type.equals("new")) {
		sql += " ORDER BY PRODUCT_ID DESC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";
		}else if(type.equals("lowprice")) {
			sql += " ORDER BY PRICE_DISCOUNT ASC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";
		}else if(type.equals("highprice")) {
			sql += " ORDER BY PRICE_DISCOUNT DESC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";
		}else {
			sql += " ORDER BY PRICE_PERCENT DESC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";
		}
		

		System.out.println("Generated SQL: " + sql); 
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
	
	public List<CategoryDTO> selectinsertChildcate(String cate) {
		List<CategoryDTO> Childcate = new Vector<CategoryDTO>();
		

		
		String sql = " SELECT CATEGORY_NAME " + "FROM CATEGORY "
				+ "WHERE category_parent = (SELECT IDX FROM CATEGORY WHERE category_name =?)"
				+ "  AND category_layer = 1";
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, cate);
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

	
	public List<ProductDTO> ViewChildList(int start, int end, String[] Arrayfilters, String[] Arraydeliverys, String filters, String delivery, String category, String price, String[] Arrayprice, String type) {
		List<ProductDTO> list = new Vector<ProductDTO>();
		Map<String, String> map = ChildCategoryMap.getKoreanChildMap();
		Map<String, String> deliveryMap = CategoryMap.getKoreandeliveryMap();
		Map<String, String> cateMap = ChildCategoryMap.getselectCate();
		String NumCate = cateMap.getOrDefault(category, category);
		System.out.println(NumCate);
		StringBuilder splitfilter = new StringBuilder();
		StringBuilder splitDelivery = new StringBuilder();
		
		for (String filter : Arrayfilters) {
			splitfilter.append("'").append(map.getOrDefault(filter, filter)).append("',");
		}

		splitDelivery = new StringBuilder();
		for (String deliverystr : Arraydeliverys) {
			splitDelivery.append("'").append(deliveryMap.getOrDefault(deliverystr, deliverystr)).append("',");
		}

		if (splitDelivery.length() > 0) {
			splitDelivery.setLength(splitDelivery.length() - 1);
		}

		if (splitfilter.length() > 0) {
			splitfilter.setLength(splitfilter.length() - 1);
		}

		StringBuilder splitPrice = new StringBuilder();
		for(String pricestr : Arrayprice) {
			splitPrice.append("'").append(pricestr).append("',");
		}
		if(splitPrice.length() > 0) {
			splitPrice.setLength(splitPrice.length() - 1);
		}
		
		String[] prices = splitPrice.toString().split(",");
		System.out.println(splitDelivery.toString());
		String sql = "SELECT * FROM ( " +
	             "    SELECT Tb.*, ROWNUM rNum " +
	             "    FROM ( " +
	             "        SELECT P.NAME, P.SUB_TEXT, P.PRICE_ORI, P.PRICE_PERCENT, P.PRICE_DISCOUNT, P.DELIVERY_TYPE, P.PRODUCT_IMG " +
	             "        FROM PRODUCT P " +
	             "        JOIN CATEGORY C ON P.CATEGORY_ID = C.IDX ";
		boolean hasCondition = false;

		if (filters != null && !filters.isEmpty()) {
		    sql += " WHERE C.CATEGORY_NAME IN (" + splitfilter.toString() + ") ";
		    hasCondition = true; // 첫 번째 조건이 추가되었음을 표시
		}

		if (delivery != null && !delivery.isEmpty()) {
		    if (hasCondition) {
		        sql += " AND";
		    } else {
		        sql += " WHERE C.CATEGORY_PARENT = " + NumCate + " AND ";
		        hasCondition = true; // 첫 번째 조건이 추가되었음을 표시
		    }
		    sql += " P.DELIVERY_TYPE IN (" + splitDelivery.toString() + ")";
		}

		if (price != null && !price.isEmpty()) {
		    if (hasCondition) {
		        sql += " AND";
		    } else {
		        sql += " WHERE C.CATEGORY_PARENT = " + NumCate + " AND ";
		    }

		    if (prices.length == 1) {
		        if ("35000".equals(price)) {
		            sql += " PRICE_DISCOUNT >= " + prices[0];
		        } else {
		            sql += " PRICE_DISCOUNT < " + prices[0];
		        }
		    } else if (prices.length == 2) {
		        sql += " PRICE_DISCOUNT >= " + prices[0] + " AND PRICE_DISCOUNT < " + prices[1];
		    }
		}
				
		
		
		if(type == null || type.equals("new")) {
			sql += " ORDER BY PRODUCT_ID DESC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";
			}else if(type.equals("lowprice")) {
				sql += " ORDER BY PRICE_DISCOUNT ASC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";
			}else if(type.equals("highprice")) {
				sql += " ORDER BY PRICE_DISCOUNT DESC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";
			}else {
				sql += " ORDER BY PRICE_PERCENT DESC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";
			}
	System.out.println(sql);
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

	public List<ProductDTO> ViewCategoryProducts(int start, int end, String category, String type) {
		List<ProductDTO> list = new Vector<ProductDTO>();
		Map<String, String> map = ChildCategoryMap.getselectCate();
		String NumMap = map.getOrDefault(category, category);
		String sql = "SELECT * FROM ( " + "    SELECT Tb.*, ROWNUM rNum " + "    FROM ( "
				+ "        SELECT P.NAME, P.SUB_TEXT, P.PRICE_ORI, P.PRICE_PERCENT, P.PRICE_DISCOUNT, P.DELIVERY_TYPE, P.PRODUCT_IMG "
				+ "        FROM PRODUCT P " + "        JOIN CATEGORY C ON P.CATEGORY_ID = C.IDX "
				+ "        WHERE C.CATEGORY_PARENT = ?" ;
		if(type == null || type.equals("new")) {
			sql += " ORDER BY PRODUCT_ID DESC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";
			}else if(type.equals("lowprice")) {
				sql += " ORDER BY PRICE_DISCOUNT ASC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";
			}else if(type.equals("highprice")) {
				sql += " ORDER BY PRICE_DISCOUNT DESC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";
			}else {
				sql += " ORDER BY PRICE_PERCENT DESC) Tb WHERE ROWNUM <= ?) WHERE rNum >= ?";
			}

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

	
	public int insertProduct(ProductDTO dto, int price, int saleper, String childcategory) {
		int result = 0;
		int price_discount = price - (price * saleper / 100);
		String sql = "INSERT INTO PRODUCT VALUES (PRODUCT_BNO.NEXTVAL, (SELECT IDX FROM CATEGORY WHERE CATEGORY_NAME = ?), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?, 0, 2)";

	
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
//			psmt.setString(1,childcategory);
//			psmt.setString(2, dto.getName());
//			psmt.setString(3, dto.getSub_text());
//			psmt.setString(4, dto.getOrigin());
//			psmt.setString(5, dto.getWeight());
//			psmt.setString(6, dto.getDateInfo());
//			psmt.setString(7, dto.getNotifi());
//			psmt.setInt(8, price);
//			psmt.setInt(9, saleper);
//			psmt.setInt(10, price_discount);
//			psmt.setString(11, dto.getUnit());
//			psmt.setString(12, dto.getPackaging_type());
//			psmt.setString(13, dto.getDelivery_type());
//			psmt.setString(14, "ddd");
//			psmt.setString(15, dto.getProduct_noti_img());
//			psmt.setString(16, "dd");
	        psmt.setString(1, childcategory);
	        System.out.println("Parameter 1 (childcategory): " + childcategory);
	        
	        psmt.setString(2, dto.getName());
	        System.out.println("Parameter 2 (Name): " + dto.getName());
	        
	        psmt.setString(3, dto.getSub_text());
	        System.out.println("Parameter 3 (Sub_text): " + dto.getSub_text());
	        
	        psmt.setString(4, dto.getOrigin());
	        System.out.println("Parameter 4 (Origin): " + dto.getOrigin());
	        
	        psmt.setString(5, dto.getWeight());
	        System.out.println("Parameter 5 (Weight): " + dto.getWeight());
	        
	        psmt.setString(6, dto.getDateInfo());
	        System.out.println("Parameter 6 (DateInfo): " + dto.getDateInfo());
	        
	        psmt.setString(7, dto.getNotifi());
	        System.out.println("Parameter 7 (Notifi): " + dto.getNotifi());
	        
	        psmt.setInt(8, price);
	        System.out.println("Parameter 8 (Price): " + price);
	        
	        psmt.setInt(9, saleper);
	        System.out.println("Parameter 9 (Saleper): " + saleper);
	        
	        psmt.setInt(10, price_discount);
	        System.out.println("Parameter 10 (Price Discount): " + price_discount);
	        
	        psmt.setString(11, dto.getUnit());
	        System.out.println("Parameter 11 (Unit): " + dto.getUnit());
	        
	        psmt.setString(12, dto.getPackaging_type());
	        System.out.println("Parameter 12 (Packaging_type): " + dto.getPackaging_type());
	        
	        psmt.setString(13, dto.getDelivery_type());
	        System.out.println("Parameter 13 (Sub_text again): " + dto.getDelivery_type());
	        
	        psmt.setString(14, dto.getProduct_noti_img());
	        System.out.println("Parameter 15 (Product_noti_img): " + dto.getProduct_noti_img());
	        
	        psmt.setString(15, "ddd");
	        System.out.println("Parameter 15 (Fixed value 'ddd'): ddd");
	        
	        psmt.setString(16, "dd");
	        System.out.println("Parameter 16 (Fixed value 'dd'): dd");

			
			
			result = psmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
}
