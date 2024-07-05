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

@WebServlet("/ProductList")
public class ProductsListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductsListController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int page = 1;
		int pageSize = 30;
		String category = request.getParameter("category");
		String filters = request.getParameter("filters");
		String delivery = request.getParameter("delivery");
		String price = request.getParameter("price");
		String[] Arrayfilters = filters != null ? filters.split(",") : new String[0];
		String[] Arraydeliverys = delivery != null ? delivery.split(",") : new String[0];
		String[] Arrayprice;
		String type = request.getParameter("type");
		
		if (price != null && price.contains("-")) {
		    Arrayprice = price.split("-");
		} else if (price != null) {
		    Arrayprice = new String[] { price }; 
		} else {
		    Arrayprice = new String[0]; 
		}
		

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
		
				
		
		if ("all".equals(category) || (category != null && category.isEmpty() && (delivery == null || delivery.isEmpty()) && (price == null || price.isEmpty() ))) {
		    deliverytList = dao.GetdeliveryType(category, Arrayfilters, filters);
		    list = dao.selectListPage(start, end, category, delivery, Arraydeliverys, price, Arrayprice, type);
		    Childcate = dao.selectChildcate(category);
		    cnt = dao.ListCount(delivery, Arraydeliverys, price, Arrayprice);
		    if ((delivery != null && !delivery.isEmpty()) && (price != null && !price.isEmpty())) {
		        list = dao.selectListPage(start, end, category, delivery, Arraydeliverys, price, Arrayprice, type);
		        cnt = dao.ListCount(delivery, Arraydeliverys, price, Arrayprice);
		    } else if (delivery == null || delivery.isEmpty() && price != null && !price.isEmpty()) {
		        list = dao.selectListPage(start, end, category, delivery, Arraydeliverys, price, Arrayprice, type);
		        cnt = dao.ListCount(delivery, Arraydeliverys, price, Arrayprice);
		    }
		}
		else {
		    deliverytList = dao.GetdeliveryType(category, Arrayfilters, filters);
		    if ((filters == null || filters.isEmpty()) && (delivery == null || delivery.isEmpty()) && (price == null || price.isEmpty())) {
		        // 카테고리 필터와 배송 필터 가격 필터모두 비어 있는 경우
		        list = dao.ViewCategoryProducts(start, end, category, type);
		        cnt = dao.CategoryCount(category);
		    } else if (filters != null && (delivery == null || delivery.isEmpty()) && (price == null || price.isEmpty())) {
		        list = dao.ViewChildList(start, end, Arrayfilters, Arraydeliverys, filters, delivery, category, price, Arrayprice, type);
		        cnt = dao.ChildCount(category, Arrayfilters, filters, delivery, Arraydeliverys, price, Arrayprice);
		    } else if (filters != null && delivery != null && price == null) {  
		        list = dao.ViewChildList(start, end, Arrayfilters, Arraydeliverys, filters, delivery, category, price, Arrayprice, type);
		        cnt = dao.ChildCount(category, Arrayfilters, filters, delivery, Arraydeliverys,price, Arrayprice);
		    } else if (filters != null && delivery != null &&  price != null) {
		    	list = dao.ViewChildList(start, end, Arrayfilters, Arraydeliverys, filters, delivery, category, price, Arrayprice, type);
		        cnt = dao.ChildCount(category, Arrayfilters, filters, delivery, Arraydeliverys, price, Arrayprice);
		    } else if (filters == null && delivery != null && price != null) {
		    	list = dao.ViewChildList(start, end, Arrayfilters, Arraydeliverys, filters, delivery, category, price, Arrayprice, type);
		        cnt = dao.ChildCount(category, Arrayfilters, filters, delivery, Arraydeliverys, price, Arrayprice);
		    } else if (filters == null && delivery == null && price != null) {
		    	list = dao.ViewChildList(start, end, Arrayfilters, Arraydeliverys, filters, delivery, category, price, Arrayprice, type);
		        cnt = dao.ChildCount(category, Arrayfilters, filters, delivery, Arraydeliverys, price, Arrayprice);
		    } else if (filters == null && delivery != null && price == null ) {
		    	list = dao.ViewChildList(start, end, Arrayfilters, Arraydeliverys, filters, delivery, category, price, Arrayprice, type);
		        cnt = dao.ChildCount(category, Arrayfilters, filters, delivery, Arraydeliverys, price, Arrayprice);
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
