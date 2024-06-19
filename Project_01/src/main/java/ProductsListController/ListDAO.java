package ProductsListController;

import java.util.List;
import java.util.Vector;
import Main.TestDBPool;

public class ListDAO extends TestDBPool {
    public ListDAO() {
        super();
    }
    
 

    
    public List<ListDTO> selectListPage(){
        List<ListDTO> list = new Vector<>();
        String sql = "SELECT TITLE, CONTENT, OPRICE, SALEPER, NPRICE, DELIVERY FROM PRODUCTS ORDER BY NUM DESC";
        
        try {
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();
            
            while(rs.next()) {
                ListDTO dto = new ListDTO();
                
                dto.setTitle(rs.getString(1));
                dto.setContent(rs.getString(2));
                dto.setOprice(rs.getInt(3));
                dto.setSaleper(rs.getInt(4));
                dto.setNprice(rs.getInt(5));
                dto.setDelivery(rs.getString(6));
                
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("게시물 조회 중 예외발생");
        } finally {
            close();
        }
        return list;
    }
}
