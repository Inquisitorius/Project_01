package DTO;

public class AjaxDataTrans {
	public String stringData_00;
	public String stringData_01;
	
	public int intData_00;
	public int intData_01;
	public int event_id;
	public int product_id;
	
	public int getProduct_id() {
		return product_id;
	}
	
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public AjaxDataTrans() {}	

	public AjaxDataTrans(String stringData_00, String stringData_01, int intData_00, int intData_01, int event_id,
			int product_id) {
		super();
		this.stringData_00 = stringData_00;
		this.stringData_01 = stringData_01;
		this.intData_00 = intData_00;
		this.intData_01 = intData_01;
		this.event_id = event_id;
		this.product_id = product_id;
	}

	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public String getStringData_00() {
		return stringData_00;
	}
	public void setStringData_00(String stringData_00) {
		this.stringData_00 = stringData_00;
	}
	public String getStringData_01() {
		return stringData_01;
	}
	public void setStringData_01(String stringData_01) {
		this.stringData_01 = stringData_01;
	}
	public int getIntData_00() {
		return intData_00;
	}
	public void setIntData_00(int intData_00) {
		this.intData_00 = intData_00;
	}
	public int getIntData_01() {
		return intData_01;
	}
	public void setIntData_01(int intData_01) {
		this.intData_01 = intData_01;
	}
	
	
	
}
