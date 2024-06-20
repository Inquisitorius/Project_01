package DTO;

public class ProductDTO 
{
	/*
	PRODUCT_ID NUMBER PRIMARY KEY NOT NULL,
 	CATEGORY_ID NUMBER NOT NULL,
 	NAME VARCHAR(128) NOT NULL,
 	SUB_TEXT VARCHAR(256) NOT NULL,
 	
 	ORIGIN VARCHAR(128) NOT NULL,//원산지	
 	WEIGHT VARCHAR(128),
 	DATEINFO VARCHAR(128),
 	NOTIFI VARCHAR(256),//안내사항	 		
 	PRICE_ORI NUMBER NOT NULL, 	
 	PRICE_PERCENT NUMBER DEFAULT 0,
 	PRICE_DISCOUNT NUMBER, 	
 	UNIT VARCHAR(128) NOT NULL, 
 		
 	PACKAGING_TYPE VARCHAR(128) NOT NULL,
 	DELIVERY_TYPE VARCHAR(128) NOT NULL, 	
 	PRODUCT_IMG VARCHAR(256) NOT NULL,
 	PRODUCT_NOTI_IMG VARCHAR(256),
 	PRODUCT_NOTI_IMG2 VARCHAR(256), 	
 	
 	EVENT_ID NUMBER DEFAULT 0 NOT NULL,
 	SELLER NUMBER NOT NULL, 	 
	*/
	
	public int product_id; //product identify;
	public int category_id;
	public String name; //product name;
	
	public String sub_text; // product sub title text
	public String origin; //원산지
	public String weight; //
	
	public String dateInfo; //기간 정보
	public String notifi; //주의사항
	public int price_ori; //원 가격
	
	public int price_percent; //할인 율
	public int price_discount; //할인 가
	public String unit; // 유통 단위
	
	public String packaging_type; //포장 방식
	public String delivery_type; //배송 방식
	
	public String product_img; // 상품 사진
	public String product_noti_img; //상품 설명 사진 1
	public String product_noti_img2; //2
	
	public int event_id; //이벤트 식별자.
	public int seller; //판매자 식별자
	
	
	public ProductDTO() {}
	public ProductDTO(int product_id, int category_id, String name, String sub_text, String origin, String weight,
			String dateInfo, String notifi, int price_ori, int price_percent, int price_discount, String unit,
			String packaging_type, String delivery_type, String product_img, String product_noti_img,
			String product_noti_img2, int event_id, int seller) {
		super();
		this.product_id = product_id;
		this.category_id = category_id;
		this.name = name;
		this.sub_text = sub_text;
		this.origin = origin;
		this.weight = weight;
		this.dateInfo = dateInfo;
		this.notifi = notifi;
		this.price_ori = price_ori;
		this.price_percent = price_percent;
		this.price_discount = price_discount;
		this.unit = unit;
		this.packaging_type = packaging_type;
		this.delivery_type = delivery_type;
		this.product_img = product_img;
		this.product_noti_img = product_noti_img;
		this.product_noti_img2 = product_noti_img2;
		this.event_id = event_id;
		this.seller = seller;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSub_text() {
		return sub_text;
	}
	public void setSub_text(String sub_text) {
		this.sub_text = sub_text;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getDateInfo() {
		return dateInfo;
	}
	public void setDateInfo(String dateInfo) {
		this.dateInfo = dateInfo;
	}
	public String getNotifi() {
		return notifi;
	}
	public void setNotifi(String notifi) {
		this.notifi = notifi;
	}
	public int getPrice_ori() {
		return price_ori;
	}
	public void setPrice_ori(int price_ori) {
		this.price_ori = price_ori;
	}
	public int getPrice_percent() {
		return price_percent;
	}
	public void setPrice_percent(int price_percent) {
		this.price_percent = price_percent;
	}
	public int getPrice_discount() {
		return price_discount;
	}
	public void setPrice_discount(int price_discount) {
		this.price_discount = price_discount;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getPackaging_type() {
		return packaging_type;
	}
	public void setPackaging_type(String packaging_type) {
		this.packaging_type = packaging_type;
	}
	public String getDelivery_type() {
		return delivery_type;
	}
	public void setDelivery_type(String delivery_type) {
		this.delivery_type = delivery_type;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_noti_img() {
		return product_noti_img;
	}
	public void setProduct_noti_img(String product_noti_img) {
		this.product_noti_img = product_noti_img;
	}
	public String getProduct_noti_img2() {
		return product_noti_img2;
	}
	public void setProduct_noti_img2(String product_noti_img2) {
		this.product_noti_img2 = product_noti_img2;
	}
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public int getSeller() {
		return seller;
	}
	public void setSeller(int seller) {
		this.seller = seller;
	}
	
}
