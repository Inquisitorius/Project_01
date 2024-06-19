package Category;

public class CategoryDTO 
{
	public int idx;
	public String Category_Name;
	public int Category_Layer;
	public int Category_Prent;
	
	public CategoryDTO() {}
	public CategoryDTO(int idx, String category_Name, int category_Layer, int category_Prent) {
		super();
		this.idx = idx;
		Category_Name = category_Name;
		Category_Layer = category_Layer;
		Category_Prent = category_Prent;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCategory_Name() {
		return Category_Name;
	}
	public void setCategory_Name(String category_Name) {
		Category_Name = category_Name;
	}
	public int getCategory_Layer() {
		return Category_Layer;
	}
	public void setCategory_Layer(int category_Layer) {
		Category_Layer = category_Layer;
	}
	public int getCategory_Prent() {
		return Category_Prent;
	}
	public void setCategory_Prent(int category_Prent) {
		Category_Prent = category_Prent;
	}
}
