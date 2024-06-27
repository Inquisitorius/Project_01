package ProductsListController;

import java.util.HashMap;
import java.util.Map;

public class ChildCategoryMap {
	private static final Map<String, String> ChildMap = new HashMap<>();
	private static final Map<String, String> KoreanChildMap = new HashMap<>();
	private static final Map<String, String> selectCate = new HashMap<>();
	static {
		ChildMap.put("와인", "wine");
		ChildMap.put("위스키", "whisky");
		ChildMap.put("맥주", "beer");
		ChildMap.put("증류주", "distilledalcohol");
		ChildMap.put("침실가구", "");
		ChildMap.put("주방가구", "kitchen_furniture");
		ChildMap.put("서재가구", "study_furniture");
		ChildMap.put("거실가구", "livingroom_furniture");
		ChildMap.put("과일", "fruit");
		ChildMap.put("수산", "seafood");
		ChildMap.put("정육", "meet");
		ChildMap.put("PC", "PC");
		ChildMap.put("주방가전", "kitchen_appliances");
		ChildMap.put("생활가전", "living_appliances");
		ChildMap.put("식빵·모닝빵", "bread_morning");
		ChildMap.put("잼·스프레드", "jam_spread");
		ChildMap.put("디저트", "dessert");
		ChildMap.put("케이크", "cake");
		ChildMap.put("소파·체어", "sofa_chair");
		ChildMap.put("침실가구", "bedroom_furniture");
		ChildMap.put("메트리스·토퍼", "mattress_topper");
		ChildMap.put("조명·거울", "light_mirror");
		ChildMap.put("수납정리용품", "organizer");
		
		KoreanChildMap.put("wine", "와인");
		KoreanChildMap.put("whisky", "위스키");
		KoreanChildMap.put("beer", "맥주");
		KoreanChildMap.put("distilledalcohol", "증류주");
		KoreanChildMap.put("bedroom_furniture", "침실가구"); 
		KoreanChildMap.put("kitchen_furniture", "주방가구");
		KoreanChildMap.put("study_furniture", "서재가구");
		KoreanChildMap.put("livingroom_furniture", "거실가구");
		KoreanChildMap.put("fruit", "과일");
		KoreanChildMap.put("seafood", "수산");
		KoreanChildMap.put("meat", "정육");
		KoreanChildMap.put("PC", "PC");
		KoreanChildMap.put("kitchen_appliances", "주방가전");
		KoreanChildMap.put("living_appliances", "생활가전");
		KoreanChildMap.put("bread_morning", "식빵·모닝빵");
		KoreanChildMap.put("jam_spread", "잼·스프레드");
		KoreanChildMap.put("dessert", "디저트");
		KoreanChildMap.put("cake", "케이크");
		KoreanChildMap.put("sofa_chair", "소파·체어");
		KoreanChildMap.put("bedroom_furniture", "침실가구");
		KoreanChildMap.put("mattress_topper", "메트리스·토퍼");
		KoreanChildMap.put("light_mirror","조명·거울");
		KoreanChildMap.put("organizer", "수납정리용품");
		
		
		selectCate.put("alcohol", "1");
		selectCate.put("furniture", "11");
		selectCate.put("food", "21");
		selectCate.put("electronics", "25");
		selectCate.put("bakery", "41");
		selectCate.put("living", "46");
		
	}
	

	
	public static Map<String, String> getChildMap(){
		return ChildMap;
	}
	
	public static Map<String, String> getKoreanChildMap(){
		return KoreanChildMap;
	}
	
	public static Map<String, String> getselectCate() {
		return selectCate;
	}
}
