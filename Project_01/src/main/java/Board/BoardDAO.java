package Board;

import java.sql.DriverManager;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import Info.TestDTO;
import Main.TestDBPool;
import jakarta.servlet.ServletContext;

public class BoardDAO extends TestDBPool {
	public BoardDAO() {
		super();
	}
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM pboard";
		con = null;
		psmt = null;
		rs = null;
		
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			Class.forName("oracle.jdbc.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "c##green";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			if(rs.next()); {
			totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	 public List<BoardDTO> selectListPage() {
		 List<BoardDTO> board = new Vector<BoardDTO>();
		 String query = /*
					 * " " + " SELECT * FROM ( " + "	SELECT Tb.*, ROWNUM rNum FROM ( " +
					 */ " SELECT * FROM pboard ORDER BY IDX";
			  	try {
			  		psmt = con.prepareStatement(query);
			  		rs=psmt.executeQuery();
			  		
			  		while(rs.next()) {
			  			BoardDTO dto = new BoardDTO();
			  			
			  			dto.setIdx(rs.getString("idx"));
			  			dto.setName(rs.getString("name"));
			  			dto.setTitle(rs.getString("title"));
			  			dto.setContent(rs.getString("content"));
			  			dto.setPostdate(rs.getDate("postdate"));
			  			dto.setOfile(rs.getString("ofile"));
			  			dto.setSfile(rs.getString("sfile"));
			  			dto.setPass(rs.getString("pass"));
			 
			  			board.add(dto);
			  		}
		  	}
			  	catch(Exception e) {
			  		System.out.println("예외 발생");
			  		e.printStackTrace();
			  	}
			  	return board;
			  	
}
	public List<BoardDTO> View() {
		List<BoardDTO> pro = new Vector<BoardDTO>();
		String query = "SELECT * FROM product WHERE P_NUM =2";
			
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setP_num(rs.getInt("p_num"));
				dto.setPkind(rs.getString("pkind"));
				dto.setPname(rs.getString("pname"));
				dto.setPprice(rs.getInt("pprice"));
				dto.setDelivertype(rs.getString("delivertype"));
				dto.setPackagingtype(rs.getString("packagingtype"));
				dto.setNotice(rs.getString("notice"));
				dto.setOrigin(rs.getString("origin"));
				dto.setUnit(rs.getString("origin"));
				dto.setWeight(rs.getInt("weight"));
				dto.setScript(rs.getString("script"));
				
				pro.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("예외 발생");
			e.printStackTrace();
		}
		return pro;
	}
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO pboard ( "
						 + " idx, name, title, content )"
						 + " values( "
						 + " seq_board_num.NEXTVAL,?,?,?)";
						 
			psmt = con.prepareStatement(query);			 
			psmt.setString(1, dto.getName());			  
			psmt.setString(2, dto.getTitle());			 
			psmt.setString(3, dto.getContent());			 
		//	psmt.setString(4, dto.getOfile());		  
		//	psmt.setString(5, dto.getSfile());		 
		//	psmt.setString(6, dto.getPass());		 
			result = psmt.executeUpdate();
			}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			  e.printStackTrace();
	}
		  return result;
}
	public int ModalWrite(BoardDTO dto) {
		int result = 0;
		System.out.println("-------test-------");
		
		try {
			String query = "INSERT INTO pboard ( "
						 + " idx, name, title, content )"
						 + " values( "
						 + " seq_board_num.NEXTVAL,?,?,?)";
						 
			psmt = con.prepareStatement(query);			 
			psmt.setString(1, dto.getName());			  
			psmt.setString(2, dto.getTitle());			 
			psmt.setString(3, dto.getContent());			 	 
			result = psmt.executeUpdate();
			}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			  e.printStackTrace();
	}
		  return result;
}
}

