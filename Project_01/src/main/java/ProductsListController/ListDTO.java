package ProductsListController;

import java.sql.Date;

public class ListDTO {
	private int num;
	private String title;
	private String content;
	private int oprice;
	private int saleper;
	private int nprice;
	private Date date;
	private String delivery;

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getOprice() {
		return oprice;
	}

	public void setOprice(int oprice) {
		this.oprice = oprice;
	}

	public int getSaleper() {
		return saleper;
	}

	public void setSaleper(int saleper) {
		this.saleper = saleper;
	}

	public int getNprice() {
		return nprice;
	}

	public void setNprice(int nprice) {
		this.nprice = nprice;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
