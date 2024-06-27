package ProductsListController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import Category.CategoryDTO;
import DTO.ProductDTO;

@WebServlet("/ProductsList/ProductList.do")
public class ProductsListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductsListController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int page = 1;
		int pageSize = 60;
		String category = request.getParameter("category");
		String filters = request.getParameter("filters");
		String delivery = request.getParameter("delivery");
		String price = request.getParameter("price");
		String[] Arrayfilters = filters != null ? filters.split(",") : new String[0];
		String[] Arraydeliverys = delivery != null ? delivery.split(",") : new String[0];

		if (request.getParameter("page") != null || request.getParameter("category") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int start = (page - 1) * (pageSize) + 1;
		int end = page * pageSize;
		
		
		System.out.println("doget 호출");
		ListDAO dao = new ListDAO();
		int cnt = 0;
		List<ProductDTO> list = null;
		List<ProductDTO> deliverytList = null;
		List<CategoryDTO> cate = dao.selectcate();
		List<CategoryDTO> Childcate = null;  // Childcate 초기화

		
		if (category == null) {
	        category = "all";
	    }
		
		
		
		if ("all".equals(category)) {
		    deliverytList = dao.GetdeliveryType(category, Arrayfilters, filters);
		    list = dao.selectListPage(start, end);
		    Childcate = dao.selectChildcate(category);
		    cnt = dao.ListCount();
		} else {
		    deliverytList = dao.GetdeliveryType(category, Arrayfilters, filters);
		    if (filters == null || filters.isEmpty()) {
		        list = dao.ViewCategoryProducts(start, end, category);
		        cnt = dao.CategoryCount(category);
		    } else {
		        list = dao.ViewChildList(start, end, Arrayfilters, Arraydeliverys);
		        cnt = dao.ChildCount(Arrayfilters);
		    }
		    Childcate = dao.selectChildcate(category);
		}

		
	
		
		int totalPages = (int) Math.ceil(cnt / (double) pageSize);
		dao.close();
		request.setAttribute("delivery_type", deliverytList);
		request.setAttribute("cate", cate);
		request.setAttribute("Childcate", Childcate);
		request.setAttribute("cnt", cnt);
		request.setAttribute("list", list);
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);
		request.getRequestDispatcher("/ProductsList/ProductList.jsp").forward(request, response);
	}
}
