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
	
	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		  List<BoardDTO> board = new Vector<BoardDTO>();
		  
		  		String query = " " 
		  					 + " SELECT * FROM ( " 
		  					 + "	SELECT Tb.*, ROWNUM rNum FROM ( " 		
		  					 + "		SELECT * FROM board ";
		  		if (map.get("searchWord") != null ) 
		  		{ 
		  				query += " WHERE "+ map.get("searchField") 
		  				 	  + " LIKE '%" + map.get("searchWord") + "%' "; } 
		  			   	query += " 		ORDER BY idx DESC "
		  			 		  +  " ) Tb "
		  					  +  " ) "	
		  					  +  " WHERE rNum BETWEEN ? AND ?";
			  		  
			  	try {
			  		psmt = con.prepareStatement(query);
			  		psmt.setString(1, map.get("start").toString());
			  		psmt.setString(2, map.get("end").toString());
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
}

