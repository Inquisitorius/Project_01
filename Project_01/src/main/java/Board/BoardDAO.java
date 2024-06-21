package Board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import Info.TestDTO;
import Main.TestDBPool;

public class BoardDAO extends TestDBPool {
	
	public BoardDAO() {
		super();
	}
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM pboard";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}
	 public List<BoardDTO> selectListPage(Map<String, Object> map) {
		  List<BoardDTO> board = new Vector<BoardDTO>();
		  
			String query = /*
							 * " " + " SELECT * FROM ( " + "	SELECT Tb.*, ROWNUM rNum FROM ( " +
							 */ "		SELECT * FROM pboard ORDER BY IDX";	  
			  	try {
			  		psmt = con.prepareStatement(query);
			  		rs=psmt.executeQuery();
			  		
			  		while(rs.next()) {
			  			BoardDTO dto = new BoardDTO();
			  		
			  			dto.setIdx(rs.getString(1));
			  			dto.setName(rs.getString(2));
			  			dto.setTitle(rs.getString(3));
			  			dto.setContent(rs.getString(4));
			  			dto.setPostdate(rs.getDate(5));
			  			dto.setOfile(rs.getString(6));
			  			dto.setSfile(rs.getString(7));
			  			dto.setPass(rs.getString(8));
			 
			  			board.add(dto);
			  			System.out.println("----test----");	
			  			System.out.println(dto.getName());	
			  		}
		  	}
			  	catch(Exception e) {
			  		System.out.println("예외 발생");
			  		e.printStackTrace();
			  	}
			  	return board;
}
	public BoardDTO View(String idx) {
		BoardDTO dto = new BoardDTO();
		String query = "SELECT * FROM product2 WHERE NUM=?";
		System.out.println("----test----");
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				System.out.println("----test----");
			}
		}
		catch(Exception e) {
			System.out.println("예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO pboard ( "
						 + " idx, name, title, content,ofile,sfile,pass )"
						 + " values( "
						 + " seq,board_num.NEXTVAL,?,?,?,?,?,?)";
						 
			psmt = con.prepareStatement(query);			 
			psmt.setString(1, dto.getName());			  
			psmt.setString(2, dto.getTitle());			 
			psmt.setString(3, dto.getContent());			 
			psmt.setString(4, dto.getOfile());		  
			psmt.setString(5, dto.getSfile());		 
			psmt.setString(6, dto.getPass());		 
			result = psmt.executeUpdate();
			}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			  e.printStackTrace();
	}
		  return result;
}
}

