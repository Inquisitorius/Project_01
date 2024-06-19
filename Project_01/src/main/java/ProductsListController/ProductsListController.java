package ProductsListController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ProductsList/ProductList.do")
public class ProductsListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public ProductsListController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
       
    
    	System.out.println("doget 호출");
    	ListDAO dao = new ListDAO();
        List<ListDTO> list = dao.selectListPage();
        int cnt = list.size();
        dao.close();
        request.setAttribute("cnt", cnt);
        request.setAttribute("list", list);
       
        request.getRequestDispatcher("/ProductsList/ProductList.jsp").forward(request, response);
    }
}
