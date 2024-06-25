package ProductsListController;

import java.util.HashMap;
import java.util.Map;

public class CategoryMap {
	private static final Map<String, String> CateMap = new HashMap<>();
	
	static {
		CateMap.put("주류", "alcohol");
		CateMap.put("가구", "furniture");
		CateMap.put("식품", "food");
		CateMap.put("가전제품", "electronics");
		CateMap.put("베이커리", "bakery");
		CateMap.put("리빙가구", "living");
		
	}
	
	public static Map<String, String> getCateMap(){
		return CateMap;
	}

}
