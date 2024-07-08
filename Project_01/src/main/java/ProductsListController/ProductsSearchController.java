package ProductsListController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


import DTO.ProductDTO;

@WebServlet("/search")
public class ProductsSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductsSearchController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int page = 1;
		int pageSize = 30;

		String delivery = request.getParameter("delivery");
		String price = request.getParameter("price");
		String[] Arraydeliverys = delivery != null ? delivery.split(",") : new String[0];
		String[] Arrayprice;
		String type = request.getParameter("type");
		String search = request.getParameter("search");
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
		System.out.println(price);
		System.out.println(delivery);
		
		    deliverytList = dao.GetSearchdeliveryType(search);
		    list = dao.ViewSearchList(start, end, search, delivery, Arraydeliverys, price, Arrayprice, type);
		    cnt = dao.ListSearchCount(search, delivery, Arraydeliverys, price, Arrayprice);
		  
		

		int totalPages = (int) Math.ceil(cnt / (double) pageSize);
		dao.close();
		request.setAttribute("delivery_type", deliverytList);
		request.setAttribute("cnt", cnt);
		request.setAttribute("list", list);
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);
		request.getRequestDispatcher("/ProductsList/ProductSearchView.jsp").forward(request, response);
	}
}
