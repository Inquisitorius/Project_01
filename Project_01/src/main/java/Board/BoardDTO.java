package Board;

public class BoardDTO {
	private String idx;
	private String name;
	private String title;
	private String content;
	private java.sql.Date postdate;
	private String ofile;
	private String sfile;
	private String pass;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	// 상품 테이블
	private int p_num;
	private String pkind;
	private String pname;
	private int pprice;
	private String delivertype;
	private String packagingtype;
	private String notice;
	private String origin;
	private String unit;
	private int weight;
	private String script;

	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getPkind() {
		return pkind;
	}
	public void setPkind(String p_kind) {
		this.pkind = p_kind;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String p_name) {
		this.pname = p_name;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int p_price) {
		this.pprice = p_price;
	}
	public String getDelivertype() {
		return delivertype;
	}
	public void setDelivertype(String delivertype) {
		this.delivertype = delivertype;
	}
	public String getPackagingtype() {
		return packagingtype;
	}
	public void setPackagingtype(String packagingtype) {
		this.packagingtype = packagingtype;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getScript() {
		return script;
	}
	public void setScript(String script) {
		this.script = script;
	}
}