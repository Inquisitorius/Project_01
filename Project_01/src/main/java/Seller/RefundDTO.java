package Seller;

import java.text.SimpleDateFormat;
import java.util.Date;

public class RefundDTO {
//REFUND_ID, ORDER_ID, REFUND_RESON, REFUND_DATE, REFUND_STATE
	public int refund_id;
	public int order_id;
	public String refund_reason;
	public Date refund_date;
	public String refund_state;
	
	public String refund_date_format;
	
	
	
	public String getRefund_date_format() {
		return refund_date_format;
	}
	
	public void Set_refund_date_format(Date date)
	{
		SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		
		String formattedDate1 = formatter.format(date);		
		this.refund_date_format = formattedDate1;
	}
	
	
	public RefundDTO() {}
	public RefundDTO(int refund_id, int order_id, String refund_reson, Date refund_date, String refund_state) {
		super();
		this.refund_id = refund_id;
		this.order_id = order_id;
		this.refund_reason = refund_reson;
		this.refund_date = refund_date;
		this.refund_state = refund_state;
	}
	public int getRefund_id() {
		return refund_id;
	}
	public void setRefund_id(int refund_id) {
		this.refund_id = refund_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getRefund_reason() {
		return refund_reason;
	}
	public void setRefund_reason(String refund_reason) {
		this.refund_reason = refund_reason;
	}
	public Date getRefund_date() {
		return refund_date;
	}
	public void setRefund_date(Date refund_date) {
		this.refund_date = refund_date;
		Set_refund_date_format(this.refund_date);
	}
	public String getRefund_state() {
		return refund_state;
	}
	public void setRefund_state(String refund_state) {
		this.refund_state = refund_state;
	}
	
	
}
