package Info;

import Main.JDBConnect;
import Main.TestDBPool;
import jakarta.servlet.ServletContext;

public class TestDAO extends JDBConnect {
	public TestDAO(ServletContext application) {
		super(application);
	}
	public TestDTO View(String num) {
		TestDTO dto = new TestDTO();
		String query = "SELECT * FROM product2 WHERE NUM=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, "1");
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setKind(rs.getString("kind"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setDelivertype(rs.getString("delivertype"));
				dto.setPackagingtype(rs.getString("packagingtype"));
				dto.setNotice(rs.getString("notice"));
				dto.setOrigin(rs.getString("origin"));
				dto.setUnit(rs.getString("unit"));
				dto.setWeight(rs.getInt("weight"));
				dto.setScript(rs.getString("script"));
				System.out.println("----test----");
			}
		}
		catch(Exception e) {
			System.out.println("예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	}
