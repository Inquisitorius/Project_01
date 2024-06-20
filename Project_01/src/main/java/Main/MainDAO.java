package Main;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import Category.CategoryDTO;
import jakarta.servlet.ServletContext;

public class MainDAO extends JDBConnect {

	public MainDAO() {
		super();
	};

	public MainDAO(ServletContext application) {
		super(application);
	}

	public List<CategoryDTO> selectList() {
		String sql = "SELECT * FROM CATEGORY ORDER BY IDX";
		List<CategoryDTO> bbs = new Vector<CategoryDTO>();

		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				CategoryDTO dto = new CategoryDTO();

				dto.setIdx(rs.getInt("IDX"));
				dto.setCategory_Name(rs.getString("CATEGORY_NAME"));
				dto.setCategory_Layer(rs.getInt("CATEGORY_LAYER"));
				dto.setCategory_Prent(rs.getInt("CATEGORY_Parent"));

				bbs.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return bbs;
	}

}
