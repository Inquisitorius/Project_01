package MyPage;

public class QuestionDTO {
	private int qdx;
	private String que_category;
	private String que_title;
	private String que_contents;
	private int count_questions;
	
	public int getQdx() {
		return qdx;
	}

	public void setQdx(int qdx) {
		this.qdx = qdx;
	}

	public String getQue_category() {
		return que_category;
	}

	public void setQue_category(String que_category) {
		this.que_category = que_category;
	}

	public String getQue_title() {
		return que_title;
	}

	public void setQue_title(String que_title) {
		this.que_title = que_title;
	}

	public String getQue_contents() {
		return que_contents;
	}

	public void setQue_contents(String que_contents) {
		this.que_contents = que_contents;
	}

	public int getCount_questions() {
		return count_questions;
	}

	public void setCount_questions(int count_questions) {
		this.count_questions = count_questions;
	}
}
