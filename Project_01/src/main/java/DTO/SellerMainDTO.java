package DTO;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class SellerMainDTO 
{
	public int order_id;
	public int product_id;
	public int product_cnt;
	public int user_id;
	public String order_state;
	public String order_date;
	public int category_id;
	public String name;
	public int event_id;
	public int seller;	
	
	public long rating;
	
	public String order_date_format;
	public Date order_date_detail;
	
	public void setOrder_date(String order_date) {		
		this.order_date = order_date;
		ratingInsert();
	}
	
	public void Set_inquery_date_format(Date date)
	{
		SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		
		String formattedDate1 = formatter.format(date);
		
		this.order_date_format = formattedDate1;
	}
	
	public void Set_order_date_detail(Date order_date)
	{
		this.order_date_detail = order_date;
		Set_inquery_date_format(order_date);
	}
	
	public Date Get_order_date_detail()
	{
		return this.order_date_detail;
	}
	
	public String getInquery_date_format() {
		return order_date_format;
	}	
	 
	public SellerMainDTO() {}
	public SellerMainDTO(int order_id, int product_id, int product_cnt, int user_id, String order_state,
			String order_date, int category_id, String name, int event_id, int seller) {
		super();
		this.order_id = order_id;
		this.product_id = product_id;
		this.product_cnt = product_cnt;
		this.user_id = user_id;
		this.order_state = order_state;
		this.order_date = order_date;
		this.category_id = category_id;
		this.name = name;
		this.event_id = event_id;
		this.seller = seller;
	}
	
	public void ratingInsert()
	{
		Date currentDate = new Date();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date givenDate = null;
		try 
		{
			givenDate = dateFormat.parse(order_date);	
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		long diffInMillies = currentDate.getTime() - givenDate.getTime();
		rating = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
		
	}
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getProduct_cnt() {
		return product_cnt;
	}
	public void setProduct_cnt(int product_cnt) {
		this.product_cnt = product_cnt;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public String getOrder_date() {		
		return order_date;
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
