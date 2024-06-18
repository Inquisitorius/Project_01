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
		System.out.println("----test----");
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt(1));
				dto.setKind(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				dto.setDelivertype(rs.getString(5));
				dto.setPackagingtype(rs.getString(6));
				dto.setNotice(rs.getString(7));
				dto.setOrigin(rs.getString(8));
				dto.setUnit(rs.getString(9));
				dto.setWeight(rs.getInt(10));
				dto.setScript(rs.getString(11));
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
