package DTO;

import java.text.SimpleDateFormat;
import java.util.Date;

public class InqueryDTO 
{
	public int inquery_id;
	public int product_id;
	public int user_id;
	public String inquery_title;
	public String inquery_content;
	public String seller_content;
	public Date inquery_date;
	
	public String product_name;
	public String user_name;
	public String name;

	public int seller_id;
	
	public String inquery_date_format;
	public int product_cnt;
	
	
	public int getProduct_cnt() {
		return product_cnt;
	}


	public void setProduct_cnt(int product_cnt) {
		this.product_cnt = product_cnt;
	}


	public void Set_inquery_date_format(Date date)
	{
		SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		
		String formattedDate1 = formatter.format(date);
		
		this.inquery_date_format = formattedDate1;
	}
	
	
	public String getInquery_date_format() {
		return inquery_date_format;
	}

	public InqueryDTO() {
			
		}	 
	

	public InqueryDTO(int inquery_id, int product_id, int user_id, String inquery_title, String inquery_content,
			String seller_content, Date inquery_date, String product_name, String user_name, int seller_id) {
		super();
		this.inquery_id = inquery_id;
		this.product_id = product_id;
		this.user_id = user_id;
		this.inquery_title = inquery_title;
		this.inquery_content = inquery_content;
		this.seller_content = seller_content;
		this.inquery_date = inquery_date;
		this.product_name = product_name;
		this.user_name = user_name;
		this.seller_id = seller_id;
	}

	public int getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}	
	
	public int getInquery_id() {
		return inquery_id;
	}
	public void setInquery_id(int inquery_id) {
		this.inquery_id = inquery_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getInquery_title() {
		return inquery_title;
	}
	public void setInquery_title(String inquery_title) {
		this.inquery_title = inquery_title;
	}
	public String getInquery_content() {
		return inquery_content;
	}
	public void setInquery_content(String inquery_content) {
		this.inquery_content = inquery_content;
	}
	public String getSeller_content() {
		return seller_content;
	}
	public void setSeller_content(String seller_content) {
		this.seller_content = seller_content;
	}
	public Date getInquery_date() {
		return inquery_date;
	}
	public void setInquery_date(Date inquery_date) {
		this.inquery_date = inquery_date;
		Set_inquery_date_format(inquery_date);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
