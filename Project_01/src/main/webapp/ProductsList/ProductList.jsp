<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="Category.CategoryDTO"%>
<%@page import="ProductsListController.ListDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
    int currentPage = (Integer) request.getAttribute("currentPage");
    String category = request.getParameter("category");
    int totalPages = (Integer) request.getAttribute("totalPages");

    // 현재 페이지가 0 이하이면 1페이지로 설정
    if (currentPage <= 0) {
        currentPage = 1;
    }

    // 카테고리가 null일 경우 기본값 "all"로 설정
    if (category == null) {
        category = "all";
    }

    int startPage = Math.max(1, currentPage - 2);
    int endPage = Math.min(totalPages, startPage + 4);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 신상품 - 그린</title>

<!-- Bootstrap CSS 로드 -->
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">

<!-- 개발에 필요한 LinkFile 공용 목적(Font 등을 로드) -->
<jsp:include page="/Common/LinkFile.jsp" />

<!-- Head, Footer CSS 링크 필수 -->
<link rel="stylesheet" href="/resources/css/Common.css">
<link rel="stylesheet" href="/resources/css/ProductList.css?after">

<!-- jQuery 사용을 위한 JS 로드 -->
<script src="/resources/bootstrap/js/jquery-3.7.1.js"></script>
</head>
<body>
	<jsp:include page="/Common/Header.jsp" />
	<div class="listbody">
		<div class="container mt-5">
			<h3 class="text-center listheader">상품 목록</h3>
			
			<ul class="justify-content-center itemnav">
			<li class="item" id="item"><a class="link" href="<%=request.getContextPath()%>/ProductsList/ProductList.do?page=1&category=all" data-category="all">전체 상품</a></li>
			<% 
				Map<String, String> cateMap = new HashMap<>();
				cateMap.put("주류", "alcohol");
				cateMap.put("가구", "furniture");
				cateMap.put("식품", "food");
				cateMap.put("가전제품", "electronics");
				cateMap.put("베이커리", "bakery");
				cateMap.put("리빙가구", "living");
				
				List<CategoryDTO> cate = (List<CategoryDTO>) request.getAttribute("cate"); 
				if(cate != null){
					for(CategoryDTO dto : cate){
					String CateName = dto.getCategory_Name();
					String englishCateName = cateMap.get(CateName);
			%>
				<li class="item"><a class="link" href="<%=request.getContextPath()%>/ProductsList/ProductList.do?page=1&category=<%= englishCateName %>" data-category="<%= englishCateName %>"><%= dto.getCategory_Name() %></a></li>
				<%}
					} %>
			</ul>
		</div>
		<div class="listcontainer">
			<div class="maincontent">
				<div class="sticky-sidebar">
					<div class="sidebar-title">
						<span class="titlespan">필터</span>
					</div>
					<div class="sticky-menu">
						<form method="get" action="filterResults.jsp">
							<div class="filter-group">
								<div class="toggle-btn">
									<h5 class="title">카테고리</h5>
									<span class="arrow">▲</span>
								</div>
								<div class="filter-content" id="categoryFilters">
									<div>
										<input type="checkbox" id="category1" name="category"
											value="인기신상랭킹" > <label for="category1">인기신상랭킹</label>
									</div>
									<% List<CategoryDTO> Childcate = (List<CategoryDTO>) request.getAttribute("Childcate");
										if(Childcate != null){
											int i = 2;
											for(CategoryDTO cdto : Childcate){%>
									<div>
										<input type="checkbox" id="category<%=i%>" name="category"
											value="<%=cdto.getCategory_Name() %>" > <label for="category<%=i%>"><%=cdto.getCategory_Name() %></label>
									</div>
									<%
										i++;
										}
											}%>	
								</div>
							</div>
							<div class="filter-group">
								<div class="toggle-btn">
									<h5 class="title">가격</h5>
									<span class="arrow">▲</span>
								</div>
								<div class="filter-content">
									<div>
										<input type="radio" id="price1" name="price" value="8499">
										<label for="price1">8,500원 미만</label>
									</div>
									<div>
										<input type="radio" id="price2" name="price"
											value="8500-16900"> <label for="price2">8,500원
											~ 16,900원</label>
									</div>
									<div>
										<input type="radio" id="price3" name="price"
											value="16900-35000"> <label for="price3">16,900원
											~ 35,000원</label>
									</div>
									<div>
										<input type="radio" id="price4" name="price" value="35000">
										<label for="price4">35,000원 이상</label>
									</div>
								</div>
								<div class="filter-group">
									<div class="toggle-btn">
										<h5 class="title">배송</h5>
										<span class="arrow">▲</span>
									</div>
									<div class="filter-content">
										<div>
											<input type="checkbox" id="morning" name="category"
												value="샛별배송"> <label for="morning">샛별배송</label>
										</div>
										<div>
											<input type="checkbox" id="nomal" name="category"
												value="판매자배송"> <label for="nomal">판매자배송</label>
										</div>
									</div>
								</div>
							</div>
							<div class="filter-group">
								<button type="submit" class="btn btn-primary">적용</button>
							</div>
						</form>
					</div>
				</div>
				<div class="products">
					<div class="productsortcontainer">
						<div class="productscnt" id="productcnt">
							총
							<%=request.getAttribute("cnt")%>건
						</div>
						<ul class="productsort">
							<li class="sort-li"><a href="#" class="sort-a" id="">추천순</a></li>
							<li class="sort-li"><a href="#" class="sort-a">신상품순</a></li>
							<li class="sort-li"><a href="#" class="sort-a">판매량순</a></li>
							<li class="sort-li"><a href="#" class="sort-a">혜택순</a></li>
							<li class="sort-li"><a href="#" class="sort-a">낮은 가격순</a></li>
							<li class="sort-li"><a href="#" class="sort-a">높은 가격순</a></li>
						</ul>
					</div>
					<div class="container list" id="productList" style="text-decoration-line: none;">
						<%
						List<ListDTO> list = (List<ListDTO>) request.getAttribute("list");
						if (list != null) {
							for (ListDTO dto : list) {
						%>
						<div class="row">
							<a href="#" style="text-decoration-line: none;"> <img
								src="https://product-image.kurly.com/hdims/resize/%5E%3E360x%3E468/cropcenter/360x468/quality/85/src/product/image/b15f2d12-eca6-4491-b37e-83d156377cde.jpg?v=0531"
								style="padding: 0px; width: 249px; height: 320px; border-radius: 2%; overflow: hidden;">
								<button class="btn btn-navy rounded-1 fontCommon_Option"
									type="button"
									style="width: 249px; height: 36px; margin-top: 5px;">구매</button>
								<div class="delivery" style="text-align: left; margin-top: 5px;"><%=dto.getDelivery()%></div>
								<div class="list_Itemtitle"
									style="width: 249px; text-align: left;"><%=dto.getTitle()%></div>
								<div class="row" style="margin-top: 5px;">
									<div class="explation" style="text-align: left;"><%=dto.getContent()%></div>
									<div class="col-12">
										<span class="OripriceText" style="width: 249px;"><%=dto.getOprice()%>원</span>
									</div>
								</div>
								<div class="row" style="margin-top: 5px;">
									<div class="col-2" style="display: inline-flex;">
										<span class="SalePercentText" style="text-align: left"><%=dto.getSaleper()%>%</span>
									</div>
									<div class="col" style="display: inline-flex;">
										<span class="SalePriceText" style="text-align: left"><%=dto.getNprice()%>원</span>
									</div>
								</div>
							</a>
						</div>
						<%
						}
						}
						%>

					</div>



				</div>
			</div>
			<div class="pagebtn">
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
        	<li class="page-item">
        		
                <a class="page-link" href="<%= request.getContextPath() %>/ProductsList/ProductList.do?page=<%= 1 %>&category=<%=category %>" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="<%= request.getContextPath() %>/ProductsList/ProductList.do?page=<%= Math.max(1, currentPage - 1) %>&category=<%=category %>" aria-label="Previous">
                    <span aria-hidden="true"><</span>
                </a>
            </li>
            <%  

            if (startPage <= 1) {
                endPage = Math.min(totalPages, 5);
            }
            
            for (int i = startPage; i <= endPage; i++) {
                String activeClass = (currentPage == i) ? "active" : "";
            %>
            <li class="page-item <%= activeClass %>">
                <a class="page-link" href="<%= request.getContextPath() %>/ProductsList/ProductList.do?page=<%= i %>&category=<%=category %>"><%= i %></a>
            </li>
            <% } %>
            <li class="page-item">
                <a class="page-link" href="<%= request.getContextPath() %>/ProductsList/ProductList.do?page=<%= Math.min(totalPages, currentPage + 1) %>&category=<%=category %>" aria-label="Next">
                    <span aria-hidden="true">></span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="<%= request.getContextPath() %>/ProductsList/ProductList.do?page=<%= totalPages %>&category=<%=category %>" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
		</div>

	</div>
	<jsp:include page="/Common/Footer.jsp" />
	<script>
	$(document).ready(function() {
	    function initializeEventHandlers() {
	        console.log("Initializing event handlers");

	        $('.toggle-btn').off('click').on('click', function() {
	            var $arrow = $(this).find('.arrow');
	            var $filterContent = $(this).next('.filter-content');

	            $filterContent.stop().slideToggle(50, function() {
	                if ($filterContent.is(':visible')) {
	                    $arrow.text('▲');
	                } else {
	                    $arrow.text('▼');
	                }
	            });
	        });

	        // 라디오 버튼 클릭 이벤트 핸들러
	        var beforeChecked = -1;
	        $("input[type='radio'][name='price']").off('click').on("click", function() {
	            var index = $(this).index("input[type='radio'][name='price']");
	            if (beforeChecked == index) {
	                beforeChecked = -1;
	                $(this).prop("checked", false);
	            } else {
	                beforeChecked = index;
	            }
	        });
	    }
		
	    var currentPage = <%= currentPage %>;
	 	var category = '<%= category %>';
	    
	    // 네비게이션 링크 스타일링
		function updateNavigationStyle(currentCategory) {
			console.log("스타일 적용");
			$('.itemnav .link').each(function() {
		        var clickedCategory = $(this).data('category') || "all"; // 클릭된 카테고리 가져오기

		        if (clickedCategory == currentCategory) {
		            $(this).css({
		                'color': 'green',
		                'font-weight': 'bold'
		            });
		        } else {
		            $(this).css({
		                'color': '',
		                'font-weight': ''
		            });
		        }
		    });
		}

	    // 현재 URL 가져와서 스타일 적용
	    updateNavigationStyle(category);
	    // 초기 URL 설정
	    var initialUrl = window.location.origin + '/ProductsList/ProductList.do?page=' + currentPage + '&category=' + category;
	    history.replaceState({ page: currentPage, category: category }, null, initialUrl);
	    updateNavigationStyle(category);
	 // 카테고리 링크 클릭 이벤트 핸들러
	    $('.itemnav .link .pagination').off('click').on('click', function(event) {
	    	 // 초기 URL 설정
	    	
	        event.preventDefault();
	        var clickedCategory = $(this).data('category') || "all";  // 클릭된 카테고리 가져오기
	        console.log("클릭된 카테고리: " + clickedCategory);

	       

	        // 전역 변수인 category 업데이트
	        category = clickedCategory;

	        // AJAX 요청을 통해 업데이트된 카테고리와 초기화된 현재 페이지로 제품 목록 가져오기
	        $.ajax({
	            type: 'GET',
	            url: window.location.origin + '/ProductsList/ProductList.do',
	            data: {
	        		page: 1,
	                category: category
	            },
	            success: function(data) {
	                console.log("AJAX 요청 성공");
	                var productListHtml = $(data).find('#productList').html();
	                var productcntHtml = $(data).find('#productcnt').html();
	                var itemhtml = $(data).find('#item').html();
	                var categoryFiltersHtml = $(data).find('#categoryFilters').html(); 

	                console.log("제품 목록 HTML: ", productListHtml);
	                console.log("제품 개수 HTML: ", productcntHtml);

	                // 제품 목록과 개수 업데이트
	                $('#productList').html(productListHtml);
	                $('#productcnt').html(productcntHtml);
	                $('#item').html(productcntHtml);
	                $('#categoryFilters').html(categoryFiltersHtml);

	                // 브라우저 URL 업데이트하여 현재 상태 반영
	                var newUrl = window.location.origin + '/ProductsList/ProductList.do?page='+currentPage + '&category=' + category;
	                history.pushState({page:currentPage, category: category }, null, newUrl);

	                // 동적으로 로드된 콘텐츠에 이벤트 핸들러 재설정
	                initializeEventHandlers();
	                updateNavigationStyle();
	            },
	            error: function(xhr, status, error) {
	                console.error("AJAX 요청 실패", status, error);
	            }
	        });
	    });

	 

	    // 초기 이벤트 핸들러 설정
	    initializeEventHandlers();

	 	


	});


	</script>
</body>
</html>
