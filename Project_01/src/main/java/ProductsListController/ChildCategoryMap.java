package ProductsListController;

import java.util.HashMap;
import java.util.Map;

public class ChildCategoryMap {
	private static final Map<String, String> ChildMap = new HashMap<>();
	
	static {
		ChildMap.put("와인", "wine");
		ChildMap.put("위스키", "whisky");
		ChildMap.put("맥주", "beer");
		ChildMap.put("증류주", "distilledalcohol");
		ChildMap.put("침실가구", "");
		ChildMap.put("주방가구", "kitchen_furniture");
		ChildMap.put("서재가구", "study_furniture");
		ChildMap.put("거실가구", "livingroom_furniture");
		ChildMap.put("과일", "friut");
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
		ChildMap.put("매트리스·토퍼", "mattress_topper");

		
	}
	
	public static Map<String, String> getChildMap(){
		return ChildMap;
	}
}
