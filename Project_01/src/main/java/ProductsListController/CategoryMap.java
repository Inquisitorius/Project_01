package ProductsListController;

import java.util.HashMap;
import java.util.Map;

public class CategoryMap {
	private static final Map<String, String> CateMap = new HashMap<>();
	private static final Map<String, String> DeliveryMap = new HashMap<>();
	private static final Map<String, String> koreanDeliveyMap = new HashMap<>();
	static {
		CateMap.put("주류", "alcohol");
		CateMap.put("가구", "furniture");
		CateMap.put("식품", "food");
		CateMap.put("가전제품", "electronics");
		CateMap.put("베이커리", "bakery");
		CateMap.put("리빙가구", "living");
		
		DeliveryMap.put("셀프픽업", "self");
		DeliveryMap.put("CU픽업", "CU");
		DeliveryMap.put("샛별배송", "morning");
		DeliveryMap.put("판매자배송", "nomal");
		
		koreanDeliveyMap.put("self", "셀프픽업");
		koreanDeliveyMap.put("CU", "CU픽업");
		koreanDeliveyMap.put("morning", "샛별배송");
		koreanDeliveyMap.put("nomal", "판매자배송");
	}
	
	public static Map<String, String> getCateMap(){
		return CateMap;
	}
	
	public static Map<String, String> GetdeliveryMap(){
		return DeliveryMap;
	}
	
	public static Map<String, String> getKoreandeliveryMap(){
		return koreanDeliveyMap;
	}
}
