package ProductInsertController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import Category.CategoryDTO;
import DTO.ProductDTO;
import ProductsListController.ListDAO;

@WebServlet("/SellerPage/ProductsInsert.do")
public class InsertListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public InsertListController() {
        super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String subText = request.getParameter("subtext");
        String origin = request.getParameter("origin");
        String weight = request.getParameter("weight");
        String dateInfo = request.getParameter("dateinfo");
        String notifi = request.getParameter("notifi");
        int price = 0;
        int saleper = 0;
        String unit = request.getParameter("unit");
        String packagingType = request.getParameter("packageType");
        String deliveryType = request.getParameter("deliveryType");
        String productImg = request.getParameter("imageUrlInput");
        String subcategory = request.getParameter("subcategory");
        String notiimg = request.getParameter("editorTxt");
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("idx");
        
        if(session == null || userId == null) {
        	response.sendRedirect("/MainPage/LoginPage.jsp");
        	return;
        }
        
        // price 파라미터 체크 후 값 설정
        String priceParam = request.getParameter("price");
        if (priceParam != null && !priceParam.isEmpty()) {
            try {
                price = Integer.parseInt(priceParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        String saleperParam = request.getParameter("saleper");
        if (saleperParam != null && !saleperParam.isEmpty()) {
            try {
                saleper = Integer.parseInt(saleperParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        session.setAttribute("userId", userId);
        // DTO 객체 생성 및 값 설정
        ProductDTO dto = new ProductDTO();
        dto.setSeller(userId);
        dto.setName(productName);
        dto.setSub_text(subText);
        dto.setOrigin(origin);
        dto.setWeight(weight);
        dto.setDateInfo(dateInfo);
        dto.setNotifi(notifi);
        dto.setPrice_ori(price);
        dto.setUnit(unit);
        dto.setPackaging_type(packagingType);
        dto.setDelivery_type(deliveryType);
        dto.setProduct_img(productImg);
        dto.setProduct_noti_img(notiimg);

        // 카테고리, 배송 정보 가져오기
        getCategory(request, response);
        getDelivery(request, response);
        System.out.println("아이디 : " + userId);
        // AJAX 요청에 대한 처리: 서브카테고리 업데이트
        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            getChildCate(request, response);
            return; // AJAX 요청이면 여기서 끝냄
        }
        
        // DAO 객체 생성
        ListDAO dao = new ListDAO();
        int result = 0;

        // 파라미터가 null이 아닌 경우에만 DAO에 접근하여 데이터 삽입 작업 수행
        if (productName != null && subText != null && origin != null && weight != null && dateInfo != null
                && notifi != null && unit != null && packagingType != null && deliveryType != null 
                && subcategory != null && notiimg != null) {
            try {
                result = dao.insertProduct(dto, price, saleper, subcategory);

                if (result > 0) {
                    response.sendRedirect("/ProductsList/ProductList.do");
                    return;
                } else {
                    System.out.println("삽입 실패");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("파라미터 중 하나 이상이 null입니다.");
        }

        request.getRequestDispatcher("/SellerPage/ProductsInsert.jsp").forward(request, response);
    }

    private void getCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ListDAO dao = new ListDAO();
        List<CategoryDTO> cate = dao.selectcate();
        dao.close();
        request.setAttribute("cate", cate);
    }

    private void getDelivery(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ListDAO dao = new ListDAO();
        List<ProductDTO> delivery = dao.GetdeliveryType("all", null, null);
        dao.close();
        request.setAttribute("delivery", delivery);
    }

    private void getChildCate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String category = request.getParameter("category");

        System.out.println("Selected category: " + category);

        // 카테고리가 비어있지 않고 AJAX 요청인 경우에만 처리
        if (category != null && !category.isEmpty() && "XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            ListDAO dao = new ListDAO();
            List<CategoryDTO> subcategories = dao.selectChildcate(category);
            dao.close();

            // HTML 문자열 생성
            StringBuilder htmlBuilder = new StringBuilder();
            if (subcategories != null && !subcategories.isEmpty()) {
                for (CategoryDTO dto : subcategories) {
                    String childCateName = dto.getCategory_Name();
                    // HTML 인코딩 적용하여 옵션 생성
                    htmlBuilder.append("<option value=\"").append(childCateName).append("\">").append(childCateName)
                            .append("</option>");
                }
            }

            // HTML 응답
            response.setContentType("text/html; charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.print(htmlBuilder.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
