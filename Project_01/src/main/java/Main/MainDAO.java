package Main;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import Category.CategoryDTO;
import DTO.ProductDTO;
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
	
	public List<ProductDTO> GetSaleProductList(int event_id)
	{
		String sql = "SELECT * FROM product WHERE product.EVENT_ID = " + event_id;
		System.out.println("GetSaleProductList = " + event_id); 
		
		List<ProductDTO> bbs = new Vector<ProductDTO>();
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				
				dto.setProduct_id(rs.getInt("PRODUCT_ID"));
				dto.setCategory_id(rs.getInt("CATEGORY_ID"));
				dto.setName(rs.getString("NAME"));
				dto.setSub_text(rs.getString("SUB_TEXT"));
				
				dto.setOrigin(rs.getString("ORIGIN"));
				dto.setWeight(rs.getString("WEIGHT"));
				dto.setDateInfo(rs.getString("DATEINFO"));
				dto.setNotifi(rs.getString("NOTIFI"));
				
				dto.setPrice_ori(rs.getInt("PRICE_ORI"));
				dto.setPrice_percent(rs.getInt("PRICE_PERCENT"));
				dto.setPrice_discount(rs.getInt("PRICE_DISCOUNT"));
				dto.setUnit(rs.getString("UNIT"));
				
				dto.setPackaging_type(rs.getString("PACKAGING_TYPE"));
				dto.setDelivery_type(rs.getString("DELIVERY_TYPE"));
				dto.setProduct_img(rs.getString("PRODUCT_IMG"));
				dto.setProduct_noti_img(rs.getString("PRODUCT_NOTI_IMG"));
				dto.setProduct_noti_img2(rs.getString("PRODUCT_NOTI_IMG2"));
				
				dto.setEvent_id(rs.getInt("EVENT_ID"));
				dto.setSeller(rs.getInt("SELLER"));
				
				bbs.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return bbs;
	}

}
